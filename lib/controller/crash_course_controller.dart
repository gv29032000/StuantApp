import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:toppr1/screens/quick_practice/crash_course/model/crash_course.dart';

class CrashCourseController extends GetxController {
  PolyCrashCourse? crashCourse;
  PageController pageController = PageController();
  RxInt currIndex = 0.obs;
  var selectedAnswerIndex = 0.obs;
  var selectedId = 0.obs;
  var selectedAnsId = 0.obs;

  @override
  void onInit() {
    fetchPolyCrashCourse();
    super.onInit();
  }

  void selectedAnswer(int quesIndex, int ansIndex) {
    selectedAnswerIndex.value = ansIndex;
    crashCourse?.data?.questions
        ?.elementAt(quesIndex)
        .choices
        ?.elementAt(ansIndex)
        .isSelect1 = true;
    for (dynamic i = 0;
        i <
            crashCourse?.data?.questions
                ?.elementAt(ansIndex)
                .attemptedAnswer
                ?.length;
        i++) {
      crashCourse?.data?.questions
          ?.elementAt(quesIndex)
          .attemptedAnswer?[ansIndex] = true;
      if (crashCourse?.data?.questions
              ?.elementAt(quesIndex)
              .attemptedAnswer?[i] ==
          false) {
        crashCourse?.data?.questions?.elementAt(quesIndex).attemptedAnswer?[i] =
            true;
      }
      crashCourse?.data?.questions?.elementAt(quesIndex).attemptedAnswer?[i] =
          false;
    }
    update();
  }

  viewSolution(int questionIndex) async {
    Future.delayed(const Duration(milliseconds: 100), (() {
      return crashCourse?.data?.questions
          ?.elementAt(questionIndex)
          .showSolution = true;
    }));
    update();
  }

  Future<bool?> solutionCall(int index) async {
    var submitted = await viewSolution(index);
    update();
    return crashCourse?.data?.questions?.elementAt(index).solutionShown = true;
  }

  checkAnswer(
    int quesIndex,
    int id,
  ) {
    print('hello1 $selectedAnsId');
    selectedId.value = id;
    for (dynamic i = 0;
        i < crashCourse?.data?.questions?.elementAt(quesIndex).choices?.length;
        i++) {
      // print(
      //     'hello2 ${previousQuestionPapers?.data?.questions?.elementAt(quesIndex).choices?.elementAt(i).choiceId}');
      if (crashCourse?.data?.questions
              ?.elementAt(quesIndex)
              .choices
              ?.elementAt(i)
              .isRight ==
          true) {
        print('Hellooooooo');
        selectedAnsId.value = crashCourse?.data?.questions
                ?.elementAt(quesIndex)
                .choices
                ?.elementAt(i)
                .choiceId ??
            0;
        print('hello $selectedAnsId');
      }
    }
    if (selectedAnsId.value == id) {
      crashCourse?.data?.questions?.elementAt(quesIndex).correctlyAnswered =
          true;
      print('hello Your answer is corret');
    } else if (selectedAnsId.value != id) {
      crashCourse?.data?.questions?.elementAt(quesIndex).correctlyAnswered =
          false;
      crashCourse?.data?.questions?.elementAt(quesIndex).alreadyAttempted =
          true;
      print('hello Your Ans is Wrong');
    }
  }

  nextPage() {
    //isAnswered = false;
    pageController.nextPage(
        duration: const Duration(milliseconds: 100), curve: Curves.linear);
    update();
  }

  prevPage() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 100), curve: Curves.linear);
    update();
  }

  fetchPolyCrashCourse() async {
    final response =
        await rootBundle.loadString('json/maths/crash_course.json');
    crashCourse = PolyCrashCourse.fromJson(jsonDecode(response));
    // RxPolyCrashCourse.fromJson(jsonDecode(response)) ;
    // print('Hiiiiiii$response');
  }
}
