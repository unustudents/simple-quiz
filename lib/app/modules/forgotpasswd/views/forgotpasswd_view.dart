import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forgotpasswd_controller.dart';

class ForgotpasswdView extends GetView<ForgotpasswdController> {
  const ForgotpasswdView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ForgotpasswdView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ForgotpasswdView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
