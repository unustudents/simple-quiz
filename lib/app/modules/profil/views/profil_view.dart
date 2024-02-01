import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/widgets/dialog.dart';
import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> {
  const ProfilView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfilView'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              DialogCustom.warningDialog(
                msg: 'Apakah anda yakin ingin keluar ?',
                teks: 'TIDAK',
                onPres: () => controller.funLogout(),
              );
            },
            child: const Text('KELUAR')),
      ),
    );
  }
}
