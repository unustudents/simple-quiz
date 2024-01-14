import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simple_quiz/app/modules/signin/views/signin_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selamat Datang'),
        centerTitle: true,
      ),
      body: GridView.count(
        primary: false,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: [
          InkWell(
            onTap: () {
              Get.to(const SigninView());
            },
            child: Container(
                color: Colors.amber,
                padding: const EdgeInsets.all(8),
                child: const Text(
                    "He'd have you all unravel at thesrsetsdfsrtsertdts")),
          ),
          Container(
              color: Colors.red,
              padding: const EdgeInsets.all(8),
              child: const Text("He'd have you all unravel at the")),
          Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(8),
              child: const Text("He'd have you all unravel at the")),
          Container(
              color: Colors.green,
              padding: const EdgeInsets.all(8),
              child: const Text("He'd have you all unravel at the")),
          Container(
              color: Colors.green,
              padding: const EdgeInsets.all(8),
              child: const Text("He'd have you all unravel at the")),
          Container(
              color: Colors.green,
              padding: const EdgeInsets.all(8),
              child: const Text("He'd have you all unravel at the")),
          Container(
              color: Colors.black,
              padding: const EdgeInsets.all(8),
              child: const Text("He'd have you all unravel at the")),
        ],
      ),
    );
  }
}
