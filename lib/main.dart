import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simple_quiz/color_schemes.g.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      // initialRoute: AppPages.INITIAL,
      initialRoute: Routes.SIGNIN,
      getPages: AppPages.routes,
      theme: ThemeData(
        colorScheme: lightColorScheme,
        fontFamily: 'Poppins',
      ),
    ),
  );
}
