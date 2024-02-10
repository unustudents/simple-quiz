import 'package:get/get.dart';

import '../controllers/organisation_controller.dart';

class OrganisationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrganisationController>(
      () => OrganisationController(),
    );
  }
}
