import 'package:get/get.dart';

import '../controllers/addquiz_controller.dart';

class AddquizBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddquizController>(
      () => AddquizController(),
    );
  }
}
