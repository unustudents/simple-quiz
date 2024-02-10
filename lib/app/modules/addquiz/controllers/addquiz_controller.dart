import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../../data/models/models.dart';
import '../../../data/widgets/snack.dart';

class AddquizController extends GetxController {
  final l = false.obs;
  final _firestore = FirebaseFirestore.instance.collection('all_quiz');

  void createQuiz(String title, String? description, String category) async {
    l.value = true;
    CreateQuiz data =
        CreateQuiz(title: title, description: description, category: category);
    await _firestore.add(data.toMap()).then((v) {
      Get.back();
      SnackbarCustom.successToast(msg: 'Selamat 🥳 berhasil membuat kuis');
    }).catchError((e) {
      Get.back();
      SnackbarCustom.errorToast(msg: 'Maaf 🙏 gagal membuat kuis');
    });
    l.value = false;
  }

  void addQuiz(String uid, String question, String optionTrue, String option2,
      String option3, String option4) async {
    l.value = true;
    AddQuistion data = AddQuistion(
        question: question,
        optionTrue: optionTrue,
        option2: option2,
        option3: option3,
        option4: option4);

    await _firestore.doc(uid).collection('qna').add(data.toMap()).then((value) {
      Get.back();
      SnackbarCustom.successToast(msg: 'Selamat 🥳 berhasil menambah kuis');
    }).catchError((e) {
      Get.back();
      SnackbarCustom.errorToast(msg: 'Maaf 🙏 gagal menambah kuis');
    });
    l.value = false;
  }
}
