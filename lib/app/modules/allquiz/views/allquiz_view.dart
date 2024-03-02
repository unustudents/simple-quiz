import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:simple_quiz/app/data/providers/provider.dart';

import '../../../data/constant/colors.dart';
import '../../../data/core/extentions.dart';
import '../../../data/widgets/button.dart';
import '../../../data/widgets/card.dart';
import '../../../data/widgets/form.dart';
import '../../../routes/app_pages.dart';
import '../controllers/allquiz_controller.dart';

class AllquizView extends GetView<AllquizController> {
  const AllquizView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // variabel
    Map<String, dynamic>? data = Get.arguments;
    final formkeyAddQuiz = GlobalKey<FormState>();
    Map<String, TextEditingController> abjad = {
      'Judul': controller.title,
      'Deskripsi': controller.description
    };
    Provider provider = Provider();

    return Scaffold(
      appBar: AppBar(title: Text('Semua Kuis - ${data?["title"]}')),
      body: Padding(
        padding: EdgeInsets.all(3.0.wp),
        child: StreamBuilder(
          stream: provider.readAllQuiz("${data?['uid']}"),
          // stream: controller.fetchAllQuiz("${data?['uid']}"),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(child: Text('No Internet'));
              case ConnectionState.waiting:
                return ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade200,
                      highlightColor: Colors.cyan.shade300,
                      child: const Card(child: SizedBox(height: 80)),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 10),
                  itemCount: 3,
                );
              default:
                if (snapshot.hasData) {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      var sample = snapshot.data!.docs.elementAt(index);

                      return CardCustom.cardQuiz(
                        onTap: () =>
                            Get.toNamed(Routes.PRAQUIZ, arguments: sample.id),
                        index: index,
                        title: sample.data()['title'].toString(),
                        subtitle: sample.data()['description'].toString(),
                      );
                    },
                    itemCount: snapshot.data!.docs.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(height: 10),
                  );
                } else {
                  return Center(
                    child: Text(
                      'Quiz not created ! 😩',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14.0.sp, fontWeight: FontWeight.w500),
                    ),
                  );
                }
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.biruTua,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
        onPressed: () => Get.bottomSheet(
          CardCustom.formBottomSheet(
            key: formkeyAddQuiz,
            children: [
              ...abjad.entries.map((e) => Column(
                    children: [
                      Formulir.formReguler(title: e.key, ctr: e.value),
                      SizedBox(height: 5.0.wp)
                    ],
                  )),

              // tombol
              Obx(
                () => buttonBlueObx(
                    l: controller.isLoading.value,
                    onPressed: () {
                      if (formkeyAddQuiz.currentState!.validate()) {
                        controller.createQuiz(data?['uid']);
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
