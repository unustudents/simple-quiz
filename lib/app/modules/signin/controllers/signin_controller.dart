import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  final formkey = GlobalKey<FormState>();
  final visibil = true.obs;

  final emailC = TextEditingController();
  final passC = TextEditingController();
}
