import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/constant/teks.dart';
import 'splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.autoRedirect;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppTexts.logo, width: Get.width / 2),
            const SizedBox(height: 20),
            const CircularProgressIndicator.adaptive(),
          ],
        ),
      ),
      floatingActionButton: Text('@unustudents ${DateTime.now().year}'),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
