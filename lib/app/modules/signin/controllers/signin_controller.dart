import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/widgets/dialog.dart';
import '../../../routes/app_pages.dart';
import '../../../data/widgets/snack.dart';

class SigninController extends GetxController {
  final formkeySignin = GlobalKey<FormState>();
  final visibil = true.obs;
  final l = false.obs;

  final emailC = TextEditingController();
  final passC = TextEditingController();
  final _auth = FirebaseAuth.instance;

  void onSignIn() async {
    l.value = true;
    try {
      await _auth.signInWithEmailAndPassword(
          email: emailC.text, password: passC.text);
      if (_auth.currentUser!.emailVerified == true) {
        Get.offAllNamed(Routes.HOME);
      } else {
        DialogCustom.errorDialog(
            msg:
                'Email anda belum diverifikasi, silahkan cek email untuk verifikasi, atau tekan tombol dibawah untuk mengirim ulang kode verifikasi',
            teks: 'KIRIM ULANG');
        await _auth.currentUser!.sendEmailVerification();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        SnackbarCustom.errorToast(msg: 'Email ini tidak ditemukan');
      } else if (e.code == 'wrong-password') {
        SnackbarCustom.errorToast(msg: 'Kata sandi salah.');
      }
    } finally {
      l.value = false;
    }
  }
}
