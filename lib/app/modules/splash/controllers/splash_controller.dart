import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    autoRedirect();
  }

  @override
  void onClose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.onClose();
  }

  Future autoRedirect() {
    return Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(Routes.SIGNIN);
    });
  }
}
