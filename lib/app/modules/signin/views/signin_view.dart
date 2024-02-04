import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/widgets/button.dart';
import '../../../routes/app_pages.dart';
import '../../../data/constant/colors.dart';
import '../../../data/core/extentions.dart';
import '../../../data/widgets/form.dart';
import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Form(
            key: controller.formkeySignin,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              children: [
                // title
                welcome(),
                const SizedBox(height: 47),

                // form - email
                Formulir.formEmail(ctr: controller.emailC),
                const SizedBox(height: 24),

                // form - password
                Obx(() => Formulir.formPass(
                      ctr: controller.passC,
                      visibil: controller.visibil.value,
                      onPres: () => controller.visibil.toggle(),
                    )),
                const SizedBox(height: 14),

                // lupa password
                forgotPasswd(),
                const SizedBox(height: 24),

                // tombol login
                Obx(() => buttonBlueObx(
                      onPressed: () {
                        if (controller.formkeySignin.currentState!.validate()) {
                          controller.onSignIn();
                        }
                      },
                      l: controller.l.value,
                      teks: 'Login',
                    )),
                const SizedBox(height: 58),

                // link ke register
                linkRegister(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // welcome
  Text welcome() {
    return Text(
      'Welcome !',
      style: TextStyle(
        color: AppColors.biruTua,
        fontSize: 24.0.sp,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.center,
    );
  }

  // lupa password atau forgot password
  Row forgotPasswd() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () => Get.toNamed(Routes.FORGOTPASSWD),
          child: Text(
            'Forgot password ?',
            style: TextStyle(
              color: AppColors.biruTua,
              fontSize: 12.0.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  // register
  Row linkRegister() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account yet? "),
        GestureDetector(
          onTap: () => Get.offNamed(Routes.REGISTER),
          child: Text(
            'Register',
            style: TextStyle(
                color: AppColors.biruTua,
                decoration: TextDecoration.underline,
                fontSize: 14.0.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
