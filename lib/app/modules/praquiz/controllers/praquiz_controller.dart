import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:simple_quiz/app/data/models/model_model.dart';
import '../../../data/widgets/snack.dart';

class PraquizController extends GetxController {
  String uid = Get.arguments;
  final qnaList = Rx<List<QueryDocumentSnapshot<Map<String, dynamic>>>>([]);
  RxMap record = {}.obs;
  QueryDocumentSnapshot<Map<String, dynamic>>? lastDocument;

  final _firestore = FirebaseFirestore.instance.collection('all_quiz');
  final l = false.obs;

  @override
  void onInit() {
    qnaList.bindStream(streamSoal(uid));
    super.onInit();
  }

  @override
  void onReady() {
    qnaList.bindStream(streamSoal(uid));
    super.onReady();
  }

  void addQuiz({
    required String question,
    required String optionTrue,
    required String option2,
    required String option3,
    required String option4,
  }) async {
    l.value = true;
    // AddQuistion data = AddQuistion(
    //   question: question,
    //   optionTrue: optionTrue,
    //   option2: option2,
    //   option3: option3,
    //   option4: option4,
    // );
    var data = Model(
        addQuiz: AddQuiz(
            question: question,
            optionTrue: optionTrue,
            option2: option2,
            option3: option3,
            option4: option4));

    await _firestore
        .doc(uid)
        .collection('pretest')
        .add(data.addQuiz!.toJson())
        .then((value) {
      Get.back();
      SnackbarCustom.successToast(msg: 'Selamat 🥳 berhasil menambah kuis');
    }).catchError((e) {
      Get.back();
      SnackbarCustom.errorToast(msg: 'Maaf 🙏 gagal menambah kuis');
    });
    l.value = false;
  }

  Stream<List<QueryDocumentSnapshot<Map<String, dynamic>>>> streamSoal(
      String uid) {
    return _firestore
        .doc(uid)
        .collection('pretest')
        .snapshots()
        .map((event) => event.docs);
  }

  // Future<void> loadMoreData(String uid) async {
  //   QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
  //       .doc(uid)
  //       .collection('pretest')
  //       .limit(3)
  //       .startAfterDocument(qnaList.value.last)
  //       .get();
  //   qnaList.value = [...qnaList.value, ...snapshot.docs..shuffle()];
  //   qnaList.refresh();
  // }

  RxMap<String, Object> answerQuestion(
      {required String uid,
      required String answerTrue,
      required String answerCurrent}) {
    final bool status = answerCurrent == answerTrue;
    return record[uid] =
        {'answer': answerTrue, 'current': answerCurrent, 'status': status}.obs;
  }
}
