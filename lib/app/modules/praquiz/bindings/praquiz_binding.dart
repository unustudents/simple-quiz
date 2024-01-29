import 'package:get/get.dart';

import '../controllers/praquiz_controller.dart';

class PraquizBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PraquizController>(
      () => PraquizController(),
    );
  }
}
