import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../data/models/model_model.dart';
// import '../../../data/models/models.dart';
import '../../../data/widgets/snack.dart';

class AllquizController extends GetxController {
  final l = false.obs;
  final _firestore = FirebaseFirestore.instance.collection('all_quiz');

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchAllQuiz(String uid) async* {
    yield* _firestore.where('category', isEqualTo: uid).snapshots();
  }

  void createQuiz(
      {required String title,
      String? description,
      required String category}) async {
    l.value = true;
    // CreateQuiz data =
    //     CreateQuiz(title: title, description: description, category: category);
    Model data = Model(
        createQuiz: CreateQuiz(
            title: title, description: description, category: category));
    // await _firestore.add(data.toMap()).then((v) {
    await _firestore.add(data.toJson()).then((v) {
      Get.back();
      SnackbarCustom.successToast(msg: 'Selamat 🥳 berhasil membuat kuis');
    }).catchError((e) {
      Get.back();
      SnackbarCustom.errorToast(msg: 'Maaf 🙏 gagal membuat kuis');
    });
    l.value = false;
  }
}
