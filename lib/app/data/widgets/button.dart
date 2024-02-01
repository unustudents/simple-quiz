// tombol login
import 'package:flutter/material.dart';

import '../core/extentions.dart';
import '../constant/colors.dart';

ElevatedButton buttonBlueObx(
    {required void Function()? onPressed,
    bool l = true,
    required String teks}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.biruTua,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15)),
    child: l
        ? const CircularProgressIndicator(
            backgroundColor: Colors.amber, color: Colors.white)
        : Text(teks,
            style: TextStyle(fontSize: 18.0.sp, fontWeight: FontWeight.w500)),
  );
}
