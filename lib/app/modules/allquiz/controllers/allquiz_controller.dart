import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AllquizController extends GetxController {
  final l = false.obs;

  final _firestore = FirebaseFirestore.instance.collection('all_quiz');

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchAllQuiz(String uid) async* {
    yield* _firestore.where('category', isEqualTo: uid).snapshots();
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // void increment() => count.value++;
}
