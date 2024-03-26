import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simple_quiz/app/data/core/extentions.dart';
import 'package:simple_quiz/app/data/widgets/button.dart';
import 'package:simple_quiz/app/data/widgets/card.dart';
import 'package:simple_quiz/app/data/widgets/form.dart';
import 'package:simple_quiz/app/routes/app_pages.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../data/constant/colors.dart';
import '../controllers/materi_controller.dart';

class MateriView extends GetView<MateriController> {
  const MateriView({super.key});

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    var cDeskripsi = TextEditingController();
    var cLink = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Materi'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: controller.getDescription(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              if (snapshot.data!.docs.isNotEmpty) {
                var data = snapshot.data!.docs.first.data();
                print(snapshot.data!.docs.isEmpty);
                print(data);
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      YoutubePlayerBuilder(
                        player: YoutubePlayer(
                          controller: controller.cYoutube,
                          showVideoProgressIndicator: true,
                          progressIndicatorColor: Colors.red,
                        ),
                        builder: (contex, player) {
                          return player;
                        },
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Materi",
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              data["materi"].toString(),
                              // "disini isinya materi - materi ynag menejelaskna tentang tes ini dan menjelaskan tentang video di atas, sepertinya seperti itu sih kalau enggak salah",
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: buttonBlueObx(
                                  l: false,
                                  onPressed: () => Get.toNamed(Routes.QUIZ,
                                      arguments: controller.uid),
                                  teks: "Next to Quiz"),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(child: Text("Kosong"));
              }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(
            CardCustom.formBottomSheet(
              key: formkey,
              children: [
                Formulir.formReguler(
                    title: "Materi",
                    icon: Icons.abc,
                    maxLine: 6,
                    ctr: cDeskripsi),
                SizedBox(height: 5.0.wp),
                Formulir.formReguler(
                    title: "URL Video Youtube", icon: Icons.link, ctr: cLink),
                SizedBox(height: 5.0.wp),
                buttonBlueObx(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        controller.addDescription(cDeskripsi.text, cLink.text);
                      }
                    },
                    teks: "Tambah Deskripsi",
                    l: false),
              ],
            ),
          );
        },
        backgroundColor: AppColors.biruTua,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
