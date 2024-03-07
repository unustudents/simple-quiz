import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../data/widgets/snack.dart';

class MateriController extends GetxController {
  String uid = Get.arguments;
  final _firebase = FirebaseFirestore.instance.collection("all_quiz");
  // late YoutubePlayerController cYoutube;
  RxBool isPlayerReady = false.obs;
  // final String idYoutube = YoutubePlayer.convertUrlToId(
  //     "https://youtu.be/ExSaQtW3EVA?si=KAAGz5Omi44-pk3p")!;
  // late String idYoutube;

  // @override
  // void onInit() {
  //   super.onInit();
  //   getDescription().then((value) {
  //     print("================= ${value.docs.first.data()}");
  //     String idYoutube =
  //         YoutubePlayer.convertUrlToId(value.docs.first.data()["youtube"])!;
  //     cYoutube = YoutubePlayerController(
  //       initialVideoId: idYoutube,
  //       flags: const YoutubePlayerFlags(autoPlay: false),
  //     );
  //   });
  //   // cYoutube = YoutubePlayerController(
  //   //   initialVideoId: idYoutube,
  //   //   flags: const YoutubePlayerFlags(autoPlay: false),
  //   // );
  // }

  @override
  void onClose() {
    // cYoutube.dispose();
    super.onClose();
  }

  // void klikVideo() =>
  //     cYoutube = YoutubePlayerController(initialVideoId: idYoutube);

  Future<QuerySnapshot<Map<String, dynamic>>> getDescription() async {
    return await _firebase.doc(uid).collection("materi").get();
  }

  Future<Null> addDescription(String deskripsi, String link) async {
    return await _firebase
        .doc(uid)
        .collection("materi")
        .add({"materi": deskripsi, "youtube": link}).then((value) {
      Get.back();
      SnackbarCustom.successToast(msg: 'Selamat 🥳 berhasil menambah materi');
    }).catchError((e) {
      Get.back();
      SnackbarCustom.errorToast(msg: 'Maaf 🙏 gagal menambah materi');
    });
  }
}
