import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/core/extentions.dart';
import '../../../data/widgets/button.dart';
import '../../../data/widgets/form.dart';
import '../controllers/addquiz_controller.dart';

class AddquizView extends GetView<AddquizController> {
  const AddquizView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Map data = Get.arguments; // form, uid
    var judul = TextEditingController();
    var subjudul = TextEditingController();
    var soal = TextEditingController();
    var jawabTrue = TextEditingController();
    var jawab2 = TextEditingController();
    var jawab3 = TextEditingController();
    var jawab4 = TextEditingController();
    final formkeyAddQuiz = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: const Text('AddquizView')),
      body: SafeArea(
        child: Form(
          key: formkeyAddQuiz,
          child: ListView(
            padding: EdgeInsets.all(4.0.wp),
            children: [
              if (data['from'] != 'pra')
                Formulir.formReguler(title: 'Judul', ctr: judul),
              if (data['from'] != 'pra') SizedBox(height: 5.0.wp),
              if (data['from'] != 'pra')
                Formulir.formReguler(
                    title: 'Deskripsi', ctr: subjudul, validator: (p0) => null),
              if (data['from'] != 'pra') SizedBox(height: 5.0.wp),
              if (data['from'] != 'pra')
                Obx(
                  () => buttonBlueObx(
                      l: controller.l.value,
                      onPressed: () {
                        if (formkeyAddQuiz.currentState!.validate()) {
                          controller.createQuiz(
                              judul.text, subjudul.text, data['uid']);
                        }
                      },
                      teks: 'TAMBAH'),
                ),
              if (data['from'] == 'pra')
                Formulir.formReguler(title: 'Soal', ctr: soal),
              if (data['from'] == 'pra') SizedBox(height: 5.0.wp),
              if (data['from'] == 'pra')
                Formulir.formReguler(title: 'Jawaban Benar', ctr: jawabTrue),
              if (data['from'] == 'pra') SizedBox(height: 5.0.wp),
              if (data['from'] == 'pra')
                Formulir.formReguler(title: 'Jawaban ke 2', ctr: jawab2),
              if (data['from'] == 'pra') SizedBox(height: 5.0.wp),
              if (data['from'] == 'pra')
                Formulir.formReguler(title: 'Jawaban ke 3', ctr: jawab3),
              if (data['from'] == 'pra') SizedBox(height: 5.0.wp),
              if (data['from'] == 'pra')
                Formulir.formReguler(title: 'Jawaban ke 4', ctr: jawab4),
              if (data['from'] == 'pra') SizedBox(height: 5.0.wp),
              if (data['from'] == 'pra')
                Obx(
                  () => buttonBlueObx(
                      l: controller.l.value,
                      onPressed: () {
                        if (formkeyAddQuiz.currentState!.validate()) {
                          controller.addQuiz(
                              data['uid'],
                              soal.text,
                              jawabTrue.text,
                              jawab2.text,
                              jawab3.text,
                              jawab4.text);
                        }
                      },
                      teks: 'TAMBAH'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
