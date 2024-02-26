import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/providers/provider.dart';
import '../../../data/models/model_model.dart';
import '../../../data/widgets/snack.dart';

class AllquizController extends GetxController {
  // variable
  final isLoading = false.obs;
  var title = TextEditingController();
  var description = TextEditingController();

  // CREATE QUIZ
  void createQuiz(String category) async {
    isLoading(true); // start -- loading

    // model
    Model data = Model(
      createQuiz: CreateQuiz(
        title: title.text,
        description: description.text,
        category: category,
      ),
    );
    // call api
    String result = await Provider().createQuiz(data.createQuiz?.toJson());
    // logic
    if (result == "success") {
      Get.back();
      title.clear();
      description.clear();
      SnackbarCustom.successToast(msg: 'Selamat 🥳 berhasil membuat kuis');
    } else if (result == "error") {
      Get.back();
      SnackbarCustom.errorToast(msg: 'Maaf 🙏 gagal membuat kuis');
    } else {
      SnackbarCustom.errorToast(msg: 'Maaf 🙏 terjadi kesalahan sistem');
    }

    isLoading(false); // finish -- loading
  }
}
