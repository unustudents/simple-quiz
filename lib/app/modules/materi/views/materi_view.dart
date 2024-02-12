import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/materi_controller.dart';

class MateriView extends GetView<MateriController> {
  const MateriView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MateriView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MateriView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
