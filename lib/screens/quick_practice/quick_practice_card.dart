// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toppr1/controller/ncert_solution_controller.dart';
import 'package:toppr1/screens/quick_practice/close_card.dart';

import '../../controller/chapt.controller.dart';

class QuickPracticeCard extends StatelessWidget {
  QuickPracticeCard({
    this.child,
    required this.child1,
    super.key,
  });
  final Widget? child;
  final Widget? child1;

  dynamic title = Get.parameters['CardTitle'];

  final PolynomialVideoController controller =
      Get.find<PolynomialVideoController>();
  final NCERTSolutionController myController =
      Get.find<NCERTSolutionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        actions: [
          buildActions1(
            Icons.apps_rounded,
            myController,
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
              onTap: () {
                print('Hello Close Card');
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
          child1 ?? const SizedBox(),
          // BottomButtonCard(),
        ],
      ),
    );
  }
}

class QuickPracticeCard1 extends StatelessWidget {
  QuickPracticeCard1({
    this.child,
    required this.child1,
    super.key,
  });
  final Widget? child;
  final Widget? child1;

  dynamic title = Get.parameters['CardTitle'];

  final PolynomialVideoController controller =
      Get.find<PolynomialVideoController>();
  final NCERTSolutionController myController =
      Get.find<NCERTSolutionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        actions: [
          buildActions1(
            Icons.apps_rounded,
            myController,
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
              onTap: () {
                print('Hello Close Card');
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
          child1 ?? const SizedBox(),
          // BottomButtonCard(),
        ],
      ),
    );
  }
}

buildActions(IconData icon) {
  return GestureDetector(
    onTap: () {
      // controller!.isList.value = !controller.isList.value;
    },
    child: Container(
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
    ),
  );
}

buildActions1(IconData icon, NCERTSolutionController controller) {
  return GestureDetector(
    onTap: () {
      controller.isList.value = !controller.isList.value;
    },
    child: Container(
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
    ),
  );
}
