import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/widgets/dialog.dart';
import '../../../routes/app_pages.dart';
import '../../../data/widgets/snack.dart';

class SigninController extends GetxController {
  final formkey = GlobalKey<FormState>();
  final visibil = true.obs;
  final l = false.obs;

  final emailC = TextEditingController();
  final passC = TextEditingController();

  void signup() async {
    l.value = true;
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailC.text, password: passC.text);
      if (FirebaseAuth.instance.currentUser!.emailVerified == true) {
        Get.offAllNamed(Routes.HOME);
      } else {
        await FirebaseAuth.instance.currentUser!.sendEmailVerification();
        DialogCustom.errorDialog(
            msg:
                'Email anda belum diverifikasi, silahkan cek email anda untuk verifikasi');
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
