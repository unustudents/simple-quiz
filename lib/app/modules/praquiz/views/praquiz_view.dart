import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/widgets/button.dart';
import '../../../data/widgets/card.dart';
import '../../../data/widgets/form.dart';
import '../../../data/core/extentions.dart';
import '../controllers/praquiz_controller.dart';

class PraquizView extends GetView<PraquizController> {
  PraquizView({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        controller.loadMoreData(controller.uid);
      }
    });

    var soal = TextEditingController();
    var jawabTrue = TextEditingController();
    var jawab2 = TextEditingController();
    var jawab3 = TextEditingController();
    var jawab4 = TextEditingController();

    final formkeyAddQuiz = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: const Text('Pra-Test')),
      body: Obx(() {
        if (controller.qnaList.value.isEmpty) {
          return Center(
            child: Text(
              'Quiz not created ! 😩',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.0.sp, fontWeight: FontWeight.w500),
            ),
          );
        } else {
          return ListView.builder(
            controller: _scrollController,
            physics: const PageScrollPhysics(),
            padding: EdgeInsets.all(4.0.wp),
            itemCount: controller.qnaList.value.length,
            itemBuilder: (context, index) {
              String uid = controller.qnaList.value[index].id;
              Map<String, dynamic> item =
                  controller.qnaList.value[index].data();
              List options = item.entries
                  .where((el) => el.key != 'question')
                  .map((e) => e.value)
                  .toList()
                ..shuffle();

              List abjad = <String>['A', 'B', 'C', 'D'];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${index + 1}. ${item['question']}"),
                  const SizedBox(height: 15),
                  ...options.asMap().entries.map((e) => CardCustom.cardOption(
                        title: e.value,
                        teks: abjad[e.key],
                        selected: controller.record[uid]!['status'] ?? false,
                        onTap: () {
                          controller.answerQuestion(
                            uid: uid,
                            answerTrue: item['option_true'],
                            answerCurrent: e.value,
                          );
                        },
                      )),
                  const SizedBox(height: 35),
                ],
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.bottomSheet(
          Card(
            child: Column(
              children: [
                FractionallySizedBox(
                  widthFactor: 0.25,
                  child: Container(
                    height: 5.0,
                    decoration: const BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.all(Radius.circular(2.5)),
                    ),
                    margin: const EdgeInsets.symmetric(
                      vertical: 12.0,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Form(
                    key: formkeyAddQuiz,
                    child: ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.fromLTRB(4.0.wp, 0, 4.0.wp, 6.0.wp),
                      physics: const PageScrollPhysics(),
                      children: [
                        Formulir.formReguler(title: 'Soal', ctr: soal),
                        SizedBox(height: 5.0.wp),
                        Formulir.formReguler(
                            title: 'Jawaban Benar', ctr: jawabTrue),
                        SizedBox(height: 5.0.wp),
                        Formulir.formReguler(
                            title: 'Jawaban ke 2', ctr: jawab2),
                        SizedBox(height: 5.0.wp),
                        Formulir.formReguler(
                            title: 'Jawaban ke 3', ctr: jawab3),
                        SizedBox(height: 5.0.wp),
                        Formulir.formReguler(
                            title: 'Jawaban ke 4', ctr: jawab4),
                        SizedBox(height: 5.0.wp),
                        Obx(() => buttonBlueObx(
                            l: controller.l.value,
                            onPressed: () {
                              if (formkeyAddQuiz.currentState!.validate()) {
                                controller.addQuiz(soal.text, jawabTrue.text,
                                    jawab2.text, jawab3.text, jawab4.text);
                              }
                            },
                            teks: 'TAMBAH')),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
