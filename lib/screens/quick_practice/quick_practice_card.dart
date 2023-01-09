// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toppr1/screens/quick_practice/bottom_button_card.dart';
import 'package:toppr1/screens/quick_practice/widgets/close_card.dart';

import '../../controller/chapt.controller.dart';

class QuickPracticeCard extends StatelessWidget {
  QuickPracticeCard({
    this.child,
    super.key,
  });
  final Widget? child;

  dynamic title = Get.parameters['CardTitle'];

  final PolynomialVideoController controller =
      Get.find<PolynomialVideoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        actions: [
          buildActions(
            Icons.apps_rounded,
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
              onTap: () {
                Get.dialog(const CloseCard());
              },
              child: buildActions(Icons.close)),
          const SizedBox(
            width: 20,
          ),
        ],
        title: Text(
          title,
          // controller.ncertSolutions?.data?.pageTitle ?? '',
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: Stack(
        children: [
          child ?? const SizedBox(),
          BottomButtonCard(),
        ],
      ),
    );
  }
}

buildActions(IconData icon) {
  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: Colors.white),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Icon(
        icon,
        size: 13,
      ),
    ),
  );
}
