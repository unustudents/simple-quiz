// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final currentIndex = 0.obs;

  final user = FirebaseAuth.instance.currentUser;
  final _firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> categoryQuiz() async {
    return await _firestore.collection('category_quiz').get();
  }

  dataUser() {
    if (user != null) {
      // Name, email address, and profile photo URL
      final name = user?.displayName;
      final email = user?.email;
      final photoUrl = user?.photoURL;

      // Check if user's email is verified
      final emailVerified = user?.emailVerified;

      // The user's ID, unique to the Firebase project. Do NOT use this value to
      // authenticate with your backend server, if you have one. Use
      // User.getIdToken() instead.
      final uid = user?.uid;
    }
  }
}
