import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simple_quiz/app/data/core/extentions.dart';

import '../controllers/praquiz_controller.dart';

class PraquizView extends GetView<PraquizController> {
  const PraquizView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pra-Test'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(4.0.wp),
        children: [
          const Text('1. Siapa antum'),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 4,
                  offset: const Offset(1, 1),
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 5.0.wp, vertical: 3.0.wp),
            child: Text(
              'A. ini adalah',
              style: TextStyle(
                fontSize: 14.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
