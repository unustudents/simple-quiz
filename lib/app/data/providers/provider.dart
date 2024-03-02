import 'package:cloud_firestore/cloud_firestore.dart';

class Provider {
  final _firebase = FirebaseFirestore.instance.collection("all_quiz");

  Future<String> createQuiz(Map<String, dynamic>? data) async {
    return await _firebase
        .add(data!)
        .then((value) => "success")
        .catchError((e) => "error");
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readAllQuiz(String uid) async* {
    yield* _firebase.where("category", isEqualTo: uid).snapshots();
  }
}
