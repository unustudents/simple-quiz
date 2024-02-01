import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'color_schemes.g.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: lightColorScheme.copyWith(background: Colors.white),
        appBarTheme: AppBarTheme(
          color: lightColorScheme.primary,
          centerTitle: true,
          foregroundColor: Colors.white,
          titleTextStyle:
              const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
      defaultTransition: Transition.circularReveal,
      transitionDuration: Durations.medium3,
    ),
  );
}
