import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/colors.dart';
import '../../../data/core/extentions.dart';
import '../../../data/widgets/form.dart';
import '../../forgotpasswd/views/forgotpasswd_view.dart';
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
            key: controller.formkey,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              children: [
                welcome(),
                const SizedBox(height: 47),
                Formulir.formEmail(ctr: controller.emailC),
                const SizedBox(height: 24),
                Obx(() => Formulir.formPass(
                      ctr: controller.passC,
                      visibil: controller.visibil.value,
                      onPres: () {
                        controller.visibil.toggle();
                      },
                    )),
                const SizedBox(height: 14),
                forgotPasswd(),
                const SizedBox(height: 24),
                buttonLogin(),
                const SizedBox(height: 58),
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
          onTap: () {
            Get.to(() => const ForgotpasswdView(),
                transition: Transition.circularReveal);
          },
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
          onTap: () {},
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

  // tombol login
  Obx buttonLogin() {
    return Obx(
      () => ElevatedButton(
        onPressed: () {
          if (controller.formkey.currentState!.validate()) {
            controller.signup();
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.biruTua,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        child: controller.l.isFalse
            ? Text(
                'Login',
                style:
                    TextStyle(fontSize: 18.0.sp, fontWeight: FontWeight.w500),
              )
            : const CircularProgressIndicator(
                backgroundColor: Colors.amber, color: Colors.white),
      ),
    );
  }
}
