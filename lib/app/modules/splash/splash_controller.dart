import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null && user.emailVerified == true) {
        autoRedirect(signin: true);
      } else {
        autoRedirect(signin: false);
      }
    });
  }

  @override
  void onClose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.onClose();
  }

  Future autoRedirect({required bool signin}) {
    return Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(signin ? Routes.HOME : Routes.SIGNIN);
    });
  }
}
