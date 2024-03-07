import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simple_quiz/app/data/core/extentions.dart';
import 'package:simple_quiz/app/data/widgets/button.dart';
import 'package:simple_quiz/app/data/widgets/card.dart';
import 'package:simple_quiz/app/routes/app_pages.dart';

import '../controllers/quiz_controller.dart';

class QuizView extends GetView<QuizController> {
  const QuizView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz')),
      body: StreamBuilder(
        stream: controller.streamSoal(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              const Center(child: Text("No internet 🛜"));
              break;
            case ConnectionState.waiting:
              const Center(child: CircularProgressIndicator());
              break;
            default:
              if (snapshot.hasData) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    if (index == snapshot.data!.docs.length) {
                      return Obx(
                        () => buttonBlueObx(
                          onPressed: controller.record.values.length ==
                                  snapshot.data!.docs.length
                              ? () => Get.toNamed(Routes.HOME)
                              : null,
                          teks: "Selesai",
                        ),
                      );
                    }

                    // VARIABLE
                    String uid = snapshot.data!.docs.elementAt(index).id;
                    const abjad = <String>['A', 'B', 'C', 'D'];
                    Map<String, dynamic> data =
                        snapshot.data!.docs.elementAt(index).data();
                    List options = data.entries
                        .where((el) => el.key != 'question')
                        .map((e) => e.value)
                        .toList()
                      ..shuffle();

                    return Column(
                      children: [
                        Text("${index + 1}. ${data['question']}"),
                        const SizedBox(height: 15),
                        ...options.asMap().entries.map(
                              (e) => Obx(
                                () => CardCustom.cardOption(
                                  title: e.value,
                                  teks: abjad[e.key],
                                  selected: controller.record[uid],
                                  onTap: () => controller.answerQuestion(
                                    uid: uid,
                                    answerTrue: data["option_true"],
                                    answerCurrent: e.value,
                                  ),
                                ),
                              ),
                            ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 35),
                  itemCount: snapshot.data!.docs.length,
                );
              }
          }
          return Center(
            child: Text(
              'Quiz not created ! 😩',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
      ),
    );
  }
}
