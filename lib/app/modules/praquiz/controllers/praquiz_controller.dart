import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../../data/models/models.dart';
import '../../../data/widgets/snack.dart';

class PraquizController extends GetxController {
  String uid = Get.arguments;
  final qnaList = Rx<List<QueryDocumentSnapshot<Map<String, dynamic>>>>([]);
  // final selected = false.obs;
  Map<String, Map<String, dynamic>> record = {};
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

  void addQuiz(String question, String optionTrue, String option2,
      String option3, String option4) async {
    l.value = true;
    AddQuistion data = AddQuistion(
        question: question,
        optionTrue: optionTrue,
        option2: option2,
        option3: option3,
        option4: option4);

    await _firestore
        .doc(uid)
        .collection('pretest')
        .add(data.toMap())
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
        .limit(3)
        .snapshots()
        .map((event) => event.docs);
  }

  Future<void> loadMoreData(String uid) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
        .doc(uid)
        .collection('pretest')
        .limit(3)
        .startAfterDocument(qnaList.value.last)
        .get();
    qnaList.value = [...qnaList.value, ...snapshot.docs..shuffle()];
    qnaList.refresh();
  }

  answerQuestion(
      {required String uid,
      required String answerTrue,
      required String answerCurrent}) {
    record[uid] = {'answer': answerTrue, 'status': answerCurrent};
  }
}
