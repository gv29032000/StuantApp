// ignore_for_file: unnecessary_overrides, unrelated_type_equality_checks, use_function_type_syntax_for_parameters
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../screens/chapt_list/model/chapter_list.dart';
import '../screens/chapters/model/poly_concepts.dart';
import '../screens/chapters/model/poly_set1.dart';
import '../screens/chapters/model/poly_set2.dart';
import '../screens/chapters/model/poly_videos.dart';
import '../screens/quick_practice/crash_course/model/crash_course.dart';
import '../screens/quick_practice/ncert_solution/model/ncert_solutions.dart';

class PolynomialVideoController extends GetxController {
  Questions1? questions1;
  PolynomialVideos? polyVideos;
  PolynomialSet1? polySet1;
  PolynomialSet2? polySet2;
  PolynomialConcepts? polyConcepts;
  MathsChapterList? mathsChaptList;
  PolyNCERTSolutions? ncertSolutions;
  PolyCrashCourse? crashCourse;

  // var polyVideos = <PolynomialVideos>[].obs;
  PageController pageController = PageController();

  final customTileExpanded = true.obs;
  final customTileExpanded1 = true.obs;
  final eg = false.obs;
  final bkmark = false.obs;
  final find = false.obs;
  RxInt currIndex = 0.obs;
  RxList<Questions1> questions = <Questions1>[].obs;

  //   int? correctAnsIndex;
  // RxBool isAnswered = false.obs;
  // int? selectedAns;
  // checkAns(Questions1? abc, int selectedIndex, int index) {
  //   isAnswered.value = true;
  //   correctAnsIndex = abc?.choices?.indexWhere((isRight) => isRight == true);
  //   selectedAns = selectedIndex;
  //   print('hii $correctAnsIndex');
  // }

  RxInt selectedOptionIndex = 5.obs;
  RxInt selectedQnIndex = 0.obs;
  int? correctAnsIndex = 0;
  int? currentQn;
  RxList selectedQnId = [].obs;
  final showSoln = false.obs;

  void updateCurrentQn(
    int oIndex,
    int qIndex,
  ) {
    selectedOptionIndex.value = oIndex;
    currentQn = crashCourse?.data?.questions?.elementAt(qIndex).sequenceNo;

    print('123 $currentQn');
    print('1234 $currIndex');
    print('12345 $selectedOptionIndex');
  }

  // RxInt selectedAns = 0.obs;
  // void checkAns(
  //   int oIndex,
  //   int qIndex,
  // ) {
  //   selectedOptionIndex.value = oIndex;
  //   correctAnsIndex = crashCourse?.data?.questions
  //       ?.elementAt(qIndex)
  //       .choices
  //       ?.indexWhere((isRight) => true);
  //   selectedAns = selectedOptionIndex;
  //   print("hii $correctAnsIndex");
  //   update();
  // }

  @override
  void onReady() {
    fetchPolynomialVideos();
    fetchPolynomialSet1();
    fetchPolynomialSet2();
    fetchPolynomialConcepts();
    fetchMathsChapterList();
    fetchPolyNCERTSolution();
    fetchPolyCrashCourse();

    super.onReady();
  }

  Future<void> fetchPolynomialVideos() async {
    final response =
        await rootBundle.loadString('json/maths/polynomial_video.json');
    polyVideos = PolynomialVideos.fromJson(jsonDecode(response));
  }

  Future<void> fetchPolynomialSet1() async {
    final response = await rootBundle.loadString('json/maths/poly_set1.json');
    polySet1 = PolynomialSet1.fromJson(jsonDecode(response));
  }

  Future<void> fetchPolynomialSet2() async {
    final response = await rootBundle.loadString('json/maths/poly_set2.json');
    polySet2 = PolynomialSet2.fromJson(jsonDecode(response));
  }

  Future<void> fetchPolynomialConcepts() async {
    final response =
        await rootBundle.loadString('json/maths/polynomial_concepts.json');
    polyConcepts = PolynomialConcepts.fromJson(jsonDecode(response));
  }

  Future<void> fetchMathsChapterList() async {
    final response =
        await rootBundle.loadString('json/maths/chapter_list.json');
    mathsChaptList = MathsChapterList.fromJson(jsonDecode(response));
  }

  Future<void> fetchPolyNCERTSolution() async {
    final response =
        await rootBundle.loadString('json/maths/ncert_solutions.json');
    ncertSolutions = PolyNCERTSolutions.fromJson(jsonDecode(response));
  }

  Future<void> fetchPolyCrashCourse() async {
    final response =
        await rootBundle.loadString('json/maths/crash_course.json');
    crashCourse = PolyCrashCourse.fromJson(jsonDecode(response));
  }

  // Color getTheBorderColor(int ind) {
  //   if (isAnswered.value) {
  //     if (ind == correctAnsIndex) {
  //       return const Color(0xff68c721);
  //     } else if (ind == selectedAns) {
  //       return Colors.lightBlue.shade300;
  //     } else if (selectedAns != correctAnsIndex) {
  //       return Colors.red.shade400;
  //     }
  //   }
  //   return Colors.grey.shade300;
  // }
  var solution = false.obs;

  showSolution1(int questionIndex) async {
    Future.delayed(const Duration(milliseconds: 100), (() {
      return ncertSolutions?.data?.questions
          ?.elementAt(questionIndex)
          .showSolution = true;
    }));
    update();
  }

  Future<bool?> solutionCall(int index) async {
    var submitted = await showSolution1(index);
    // isSelect.value = false;
    update();
    return ncertSolutions?.data?.questions?.elementAt(index).solutionShown =
        true;
  }

  // showAnswer(int questionIndex) {
  //   ncertSolutions?.data?.questions?.elementAt(questionIndex).showSolution =
  //       true;
  // }

  nextPage() {
    //isAnswered = false;
    pageController.nextPage(
        duration: const Duration(milliseconds: 1), curve: Curves.linear);
    //print('currIndexSubi = $currIndex');
  }

  prevPage() {
    //isAnswered = true;
    pageController.previousPage(
        duration: const Duration(milliseconds: 1), curve: Curves.linear);
  }
}

// List<Questions> _questions = questions
//     .map(
//       (question) => Questions(
//           sequenceNo: question.sequenceNo,
//           questionId: question.questionId,
//           question: question.question,
//           solution: question.solution,
//           solutionId: question.solutionId),
//     )
//     .toList();
// List<Questions> get questions => _questions;

// RxInt selectedAns = 0.obs;
//   int? correctAnsIndex;
//   RxInt selectedIndex = 5.obs;
//   RxInt currentQnId = 0.obs;
 
