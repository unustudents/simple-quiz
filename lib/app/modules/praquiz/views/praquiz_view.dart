import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_quiz/app/data/constant/teks.dart';

import '../../../data/constant/colors.dart';
import '../../../data/widgets/button.dart';
import '../../../data/widgets/card.dart';
import '../../../data/widgets/form.dart';
import '../../../data/core/extentions.dart';
import '../controllers/praquiz_controller.dart';

class PraquizView extends GetView<PraquizController> {
  const PraquizView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // variabel
    var soal = TextEditingController();
    var jawabTrue = TextEditingController();
    var jawab2 = TextEditingController();
    var jawab3 = TextEditingController();
    var jawab4 = TextEditingController();
    final formkeyAddQuiz = GlobalKey<FormState>();
    Map<String, TextEditingController> abjad = {
      'Soal': soal,
      'Jawaban Benar': jawabTrue,
      'Jawaban ke 2': jawab2,
      'Jawaban ke 3': jawab3,
      'Jawaban ke 4': jawab4
    };

    return Scaffold(
      appBar: AppBar(title: const Text('Pra-Test')),
      body: Obx(() {
        if (controller.qnaList.value.isEmpty) {
          // jika tidak ada soal
          return Center(
            child: Text(
              'Quiz not created ! 😩',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.0.sp, fontWeight: FontWeight.w500),
            ),
          );
        } else {
          // jika ada soal
          return ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.all(4.0.wp),
            itemCount:
                controller.qnaList.value.length + 1, // jangan lupa ditambah + 1
            itemBuilder: (context, index) {
              // harus paling atas supaya bisa di posisi paling bawah
              // kalau di bawah variabel maka akan menjalankan variabelnya dulu
              if (index == controller.qnaList.value.length) {
                return buttonBlueObx(
                    l: controller.l.value,
                    onPressed: () {
                      Get.bottomSheet(
                        CardCustom.formBottomSheet(
                          children: [
                            Image.asset(
                              AppTexts.background,
                              fit: BoxFit.cover,
                              width: Get.width / 2,
                            )
                          ],
                        ),
                      );
                    },
                    teks: 'NEXT');
              }

              // variabel
              String uid = controller.qnaList.value[index].id;
              Map<String, dynamic> item =
                  controller.qnaList.value[index].data();
              List options = item.entries
                  .where((el) => el.key != 'question')
                  .map((e) => e.value)
                  .toList()
                ..shuffle();
              const abjad = <String>['A', 'B', 'C', 'D'];

              // badan soal
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // soal
                  Text("${index + 1}. ${item['question']}"),
                  const SizedBox(height: 15),

                  // pilihan / jawaban
                  ...options.asMap().entries.map((e) => Obx(
                        () => CardCustom.cardOption(
                          title: e.value,
                          teks: abjad[e.key],
                          selected:
                              controller.record[uid]?['current'] == e.value,
                          onTap: () {
                            controller.answerQuestion(
                              uid: uid,
                              answerTrue: item['option_true'],
                              answerCurrent: e.value,
                            );
                          },
                        ),
                      )),
                  const SizedBox(height: 35),
                ],
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.biruTua,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
        onPressed: () => Get.bottomSheet(
          CardCustom.formBottomSheet(key: formkeyAddQuiz, children: [
            // formulir
            ...abjad.entries.map((e) => Column(
                  children: [
                    Formulir.formReguler(title: e.key, ctr: e.value),
                    SizedBox(height: 5.0.wp)
                  ],
                )),

            // tombol
            Obx(() => buttonBlueObx(
                l: controller.l.value,
                onPressed: () {
                  if (formkeyAddQuiz.currentState!.validate()) {
                    controller.addQuiz(soal.text, jawabTrue.text, jawab2.text,
                        jawab3.text, jawab4.text);
                  }
                },
                teks: 'TAMBAH')),
          ]),
        ),
      ),
    );
  }
}
