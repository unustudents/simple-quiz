import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/user_model.dart';
import '../../../data/widgets/snack.dart';
import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  final formkeyRegis = GlobalKey<FormState>();
  final l = false.obs;
  final visible = true.obs;
  final tokenX = false.obs;

  final tokenT = TextEditingController();
  final emailT = TextEditingController();
  final paswdT = TextEditingController();
  final namaT = TextEditingController();

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  // stream token
  Stream<DocumentSnapshot<Map<String, dynamic>>> streamToken() async* {
    yield* _firestore.collection('token').doc('valid').snapshots();
  }

  // membuat akun
  Future<void> onCreateAccount() async {
    l.value = true;
    UserModel data = UserModel(email: emailT.text, name: namaT.text);
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
          email: emailT.text, password: paswdT.text);
      if (credential.user != null) {
        String uid = credential.user!.uid;
        await _auth.currentUser!.updateDisplayName(namaT.text);
        onRegister(uid, data);
        await _auth.currentUser!.sendEmailVerification();
        await _auth.signOut();
        Get.offNamed(Routes.SIGNIN);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        SnackbarCustom.errorToast(msg: 'Kata sandi terlalu pendek.');
      } else if (e.code == 'email-already-in-use') {
        SnackbarCustom.errorToast(
            msg: 'Anda memiliki akun terdaftar menggunakan email ini.');
      } else if (e.code == 'invalid-email') {
        SnackbarCustom.errorToast(msg: 'Email tidak valid.');
      }
    } catch (e) {
      SnackbarCustom.errorToast(msg: 'Tidak dapat membuat akun.');
    } finally {
      l.value = false;
    }
  }

  // register
  void onRegister(String uid, UserModel data) async {
    return _firestore
        .collection('users')
        .doc(uid)
        .set(data.toMap())
        .then((v) => SnackbarCustom.successToast(msg: 'Berhasil registrasi'))
        .catchError((e) =>
            SnackbarCustom.errorToast(msg: 'Tidak dapat registrasi, error $e'));
  }
}
