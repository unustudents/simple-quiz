import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../data/core/extentions.dart';
import '../../../data/widgets/button.dart';
import '../../../data/widgets/form.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrasi'),
        leading: IconButton(
            onPressed: () => Get.offNamed(Routes.SIGNIN),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Form(
          key: controller.formkeyRegis,
          /* menggunakan streambuilder untuk memantau value dari token apakah true atau false, 
          jika true maka form akan muncul, jika false maka form akan menutup */
          child: StreamBuilder(
            stream: controller.streamToken(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Text('No Internet');
                case ConnectionState.waiting:
                  return const CircularProgressIndicator();
                default:
                  if (snapshot.hasData) {
                    var isValid = snapshot.data!.data()!['is_valid'];
                    if (isValid) {
                      // jika tokennya true / aktif
                      return ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.all(5.0.wp),
                        children: [
                          // formulir - email
                          Formulir.formEmail(ctr: controller.emailT),
                          SizedBox(height: 6.0.wp),

                          // formulir - password
                          Obx(() => Formulir.formPass(
                                visibil: controller.visible.value,
                                onPres: () => controller.visible.toggle(),
                                ctr: controller.paswdT,
                              )),
                          SizedBox(height: 6.0.wp),

                          // formulir - nama lengkap
                          Formulir.formReguler(
                              title: 'Nama Lengkap', ctr: controller.namaT),
                          SizedBox(height: 6.0.wp),

                          // formulir - tombol
                          Obx(() => buttonBlueObx(
                                onPressed: () {
                                  if (controller.formkeyRegis.currentState!
                                      .validate()) controller.onCreateAccount();
                                },
                                l: controller.l.value,
                                teks: 'Register',
                              ))
                        ],
                      );
                    } else {
                      // jika tokenya false / tidak aktif
                      return Padding(
                        padding: EdgeInsets.all(5.0.wp),
                        child: Text(
                          'Mohon maaf sesi registrasi sudah di tutup, silahkan hubungi panitia 😎👌',
                          style: TextStyle(
                              fontSize: 14.0.sp, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      );
                    }
                  } else {
                    // jika token tidak ada di database
                    return Padding(
                      padding: EdgeInsets.all(5.0.wp),
                      child: Text(
                        'Fitur disable ! 😩',
                        style: TextStyle(
                            fontSize: 14.0.sp, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }
              }
            },
          ),
        ),
      ),
    );
  }
}
