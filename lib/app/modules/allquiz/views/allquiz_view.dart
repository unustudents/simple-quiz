import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

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
    Map<String, dynamic>? data = Get.arguments;
    return Scaffold(
        appBar: AppBar(title: Text('Semua Kuis - ${data?["title"]}'), actions: [
          IconButton(
              onPressed: () =>
                  Get.toNamed(Routes.ADDQUIZ, arguments: {'uid': data?['uid']}),
              icon: const Icon(Icons.note_add_rounded))
        ]),
        body: Padding(
          padding: EdgeInsets.all(3.0.wp),
          child: StreamBuilder(
              stream: controller.fetchAllQuiz("${data?['uid']}"),
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
                              onTap: () => Get.toNamed(Routes.PRAQUIZ,
                                  arguments: sample.id),
                              index: index,
                              title: sample.data()['title'],
                              subtitle: sample.data()['description']);
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
                // return Padding(
                //   padding: EdgeInsets.all(2.0.wp),
                //   child: CardCustom.cardQuiz(
                //     index: 0,
                //     title: data.toString(),
                //     onTap: () {
                //       Get.to(AddQuiz());
                //     },
                //   ),
                // );
              }),
        ));
  }
}

class AddQuiz extends StatelessWidget {
  const AddQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    AllquizController controller = Get.put(AllquizController());
    var judul = TextEditingController();
    var subjudul = TextEditingController();
    final formkeyAddQuiz = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Form(
          key: formkeyAddQuiz,
          child: ListView(
            padding: EdgeInsets.all(4.0.wp),
            children: [
              Formulir.formReguler(title: 'Judul', ctr: judul),
              SizedBox(height: 5.0.wp),
              Formulir.formReguler(title: 'SubJudul', ctr: subjudul),
              SizedBox(height: 5.0.wp),
              buttonBlueObx(
                  l: controller.l.value,
                  onPressed: () {
                    if (formkeyAddQuiz.currentState!.validate()) {}
                  },
                  teks: 'TAMBAH')
            ],
          ),
        ),
      ),
    );
  }
}
