import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/organisation_controller.dart';

class OrganisationView extends GetView<OrganisationController> {
  const OrganisationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('OrganisationView'),
          centerTitle: true,
        ),
        body: const Text("data"));
  }
}
