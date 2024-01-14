import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Column(
              children: [
                Text('Quiz App'),
                Text('Selamat Datang'),
                SizedBox(height: 30),
              ],
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                alignLabelWithHint: true,
                labelText: 'Email',
                hintText: '....@gmail.com',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (GetUtils.isNullOrBlank(value) == true) {
                  return 'Kolom wajib diisi';
                }
                if (!GetUtils.isEmail(value!)) {
                  return 'Ini bukan email';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(),
            backgroundColor: Colors.lightBlue,
            foregroundColor: Colors.white),
        onPressed: () {
          //
        },
        child: const Text('Selanjutnya'),
      ),
    );
  }
}
