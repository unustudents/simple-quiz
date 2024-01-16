import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simple_quiz/app/data/constant/colors.dart';
import 'package:simple_quiz/app/data/core/extentions.dart';
import 'package:simple_quiz/app/data/widgets/form.dart';
import 'package:simple_quiz/app/modules/home/views/home_view.dart';

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
                Text(
                  'Login',
                  style: TextStyle(
                    color: AppColors.biruTua,
                    fontSize: 24.0.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Forgot password ?',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 12.0.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    print(controller.emailC.text.toString());
                    if (controller.formkey.currentState!.validate()) {
                      Get.to(const HomeView());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.biruTua,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 18.0.sp, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 58),
                Row(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField emailForm() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        labelText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade500,
          ),
        ),
        prefixIcon: Icon(
          Icons.person_2_rounded,
          color: Colors.grey.shade500,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (GetUtils.isNullOrBlank(value) == true) {
          return 'Kolom wajib diisi';
        }
        if (!GetUtils.isEmail(value!)) {
          return 'Ini bukan email';
        }
        return null;
      },
    );
  }
}
