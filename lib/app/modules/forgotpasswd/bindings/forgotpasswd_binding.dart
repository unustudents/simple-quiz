import 'package:get/get.dart';

import '../controllers/forgotpasswd_controller.dart';

class ForgotpasswdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotpasswdController>(
      () => ForgotpasswdController(),
    );
  }
}
