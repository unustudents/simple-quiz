import 'package:get/get.dart';

import '../controllers/allquiz_controller.dart';

class AllquizBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllquizController>(
      () => AllquizController(),
    );
  }
}
