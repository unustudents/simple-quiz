import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  String uid = Get.arguments;
  // VARIABLE
  final _firestore = FirebaseFirestore.instance.collection('all_quiz');
  RxMap record = {}.obs;

  // STREAM SOAL
  Stream<QuerySnapshot<Map<String, dynamic>>> streamSoal() async* {
    yield* _firestore.doc(uid).collection('qna').snapshots();
  }

  // JAWABAN
  RxMap<String, Object> answerQuestion(
      {required String uid,
      required String answerTrue,
      required String answerCurrent}) {
    final bool status = answerCurrent == answerTrue;
    return record[uid] =
        {'answer': answerTrue, 'current': answerCurrent, 'status': status}.obs;
  }
}
