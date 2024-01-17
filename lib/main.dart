import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'color_schemes.g.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        colorScheme: lightColorScheme,
        fontFamily: 'Poppins',
      ),
      defaultTransition: Transition.circularReveal,
      transitionDuration: Durations.short2,
    ),
  );
}
