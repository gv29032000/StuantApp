import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:toppr1/screens/quick_practice/ncert_solution/model/ncert_solutions.dart';

class NCERTSolutionController extends GetxController {
  // Rx<PolyNCERTSolutions> polyNCERTSolutions;
  // final ncertSol = List<PolyNCERTSolutions>;
  var polyNCERTSolutions = PolyNCERTSolutions().obs;
  final PageController pageController = PageController(
    initialPage: 0,
  );
  var questionIndex = 0.obs;
  var first = ''.obs;
  var isList = false.obs;
  var listtoPage = false.obs;

  isListToPage(int index) {
    listtoPage.value = true;
  }

  // viewSolution(int index) {
  //   polyNCERTSolutions.value.data?.questions?.elementAt(index).solutionShown =
  //       true;
  // }
  viewSolution(int questionIndex) async {
    Future.delayed(const Duration(milliseconds: 50), (() {
      return polyNCERTSolutions.value.data?.questions
          ?.elementAt(questionIndex)
          .showSolution = true;
    }));
    update();
  }

  Future<bool?> solutionCall(int index) async {
    var submitted = await viewSolution(index);
    update();
    return polyNCERTSolutions.value.data?.questions
        ?.elementAt(index)
        .solutionShown = true;
  }

  String firstLine(int index) {
    List<String>? lines = polyNCERTSolutions.value.data?.questions
        ?.elementAt(index)
        .question
        ?.split("\$");
    if (kDebugMode) {
      print('Lines $lines');
    }
    return first.value = lines![0];
  }

  @override
  void onInit() {
    fetchNCERTSolution();
    super.onInit();
  }

  nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 100), curve: Curves.linear);
    update();
  }

  prevPage() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 100), curve: Curves.linear);
    update();
  }

  Future<void> fetchNCERTSolution() async {
    final response =
        await rootBundle.loadString('json/maths/ncert_solutions.json');
    polyNCERTSolutions.value =
        PolyNCERTSolutions.fromJson(jsonDecode(response));
    print('Hiii $response');
    update();
  }
}
