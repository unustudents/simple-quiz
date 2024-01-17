import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/colors.dart';
import '../../../data/core/extentions.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.autoRedirect;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/splash.png'),
              const SizedBox(height: 10),
              Text(
                'Simple Quiz',
                style: TextStyle(
                  color: AppColors.biruTua,
                  fontFamily: 'Mogra',
                  fontSize: 25.0.sp,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              const CircularProgressIndicator.adaptive(),
            ],
          ),
        ),
      ),
      floatingActionButton: Text('@unustudents ${DateTime.now().year}'),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
