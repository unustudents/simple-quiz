import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class ProfilController extends GetxController {
  void funLogout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.SPLASH);
  }

  @override
  void onClose() {
    Get.delete();
    super.onClose();
  }
}
