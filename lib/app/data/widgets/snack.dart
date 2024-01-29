import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_quiz/app/data/constant/colors.dart';
import '../core/extentions.dart';

class SnackbarCustom {
  // when error
  static errorToast({required String msg}) {
    _snackbarCustom(
      ttl: 'Error Notification',
      msg: msg,
      clr: AppColors.error,
      icon: Icons.error_rounded,
    );
  }

  // when success
  static successToast({required String msg}) {
    _snackbarCustom(
      ttl: 'Success Notification',
      msg: msg,
      clr: AppColors.sukses,
      icon: Icons.check_circle_rounded,
    );
  }

  // when warning
  static warningToast({required String msg}) {
    _snackbarCustom(
      ttl: 'Warning Notification',
      msg: msg,
      clr: AppColors.warning,
      icon: Icons.warning_rounded,
    );
  }

  static _snackbarCustom(
      {required String ttl, required String msg, Color? clr, IconData? icon}) {
    return Get.snackbar(
      ttl,
      msg,
      isDismissible: true,
      margin: EdgeInsets.symmetric(vertical: 5.0.wp, horizontal: 3.0.wp),
      padding: EdgeInsets.symmetric(vertical: 3.0.wp, horizontal: 5.0.wp),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: clr,
      colorText: Colors.white,
      icon: Icon(icon, size: 40, color: Colors.white),
    );
  }
}
