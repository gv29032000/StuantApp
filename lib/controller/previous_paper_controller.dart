import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:toppr1/screens/previous_paper/model/previous_paper.dart';

class PreviousQuestionPaperController extends GetxController {
  PreviousQuestionPapers? previousQuestionPapers;
  Questions? question;
  final Map<int, bool> questionIsAnswerd = {};
  final List<int> list_status = <int>[0, 1, 2, 3].obs;
  RxList attemptedQuestions = [].obs;
  // Set<String> physical_status_selected = {};
  RxMap list_status_selected = {}.obs;
  Rxn<Questions> currentQuestion = Rxn<Questions>();
  RxSet addansIndex = <int>{}.obs;
  RxList<bool> ansAttempted = [
    false,
    false,
    false,
    false,
    false,
  ].obs;
  RxList<dynamic> attemptedAnsList = [].obs;
  final PageController pageController = PageController(
    initialPage: 0,
    // controller.courseCrash?.data?.questions?.length  ?? 0
  );
  RxList quesIndexList = [].obs;
  var isPressed = false.obs;
  var currentansIndex = 0.obs;
  var currentquesIndex = 0.obs;
  var selectedOptionIndex = 0.obs;
  var selectedAnswerIndex = 0.obs;
  RxList selecteOptionList = [].obs;
  RxList selectedListList = [].obs;
  var questionIndex = 0.obs;
  var selectedAnsId = 0.obs;
  var ansSelectedIndex = 0.obs;
  var selectedId = 0.obs;
  var correctAns = false.obs;
  Rx<AnswerStatus> status = AnswerStatus.notanswered.obs;

  addBookMark(int quesIndex) {
    previousQuestionPapers?.data?.questions?.elementAt(quesIndex).isBookmarked =
        true;
    if (previousQuestionPapers?.data?.questions
            ?.elementAt(quesIndex)
            .isBookmarked ==
        true) {
      Get.bottomSheet(Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Icon(
            Icons.close,
            color: Colors.grey.shade400,
          ),
          const SizedBox(
            height: 3,
          ),
          const Text('Removing this will also remove it from any notebook'),
          const SizedBox(
            height: 5,
          ),
          const Divider(),
          const SizedBox(
            height: 5,
          ),
          const Text('REMOVE FROM BOOK MARKS'),
        ],
      ));
    }
  }

  bool checkIsQuestionAnswered(int quesId) {
    return questionIsAnswerd.entries
        .firstWhere((element) => element.key == quesId)
        .value;
  }

  Color getcolor(int ansindex, int quesindex) {
    if (previousQuestionPapers?.data?.questions
                ?.elementAt(quesindex)
                .choices
                ?.elementAt(ansindex)
                .isSelect1 ==
            true &&
        ansindex == currentansIndex.value) {
      return Colors.blue.shade300;
    }

    return Colors.grey.shade300;
  }

  void selectedAnswer(
    int ansindex,
    int quesindex,
  ) {
    // questionIndex.value = quesindex;
    // attemptedQuestions.re
    selectedAnswerIndex.value = ansindex;
    previousQuestionPapers?.data?.questions?.elementAt(quesindex).isSelected =
        true;
    addansIndex.add(ansindex);

    attemptedQuestions.add(previousQuestionPapers?.data?.questions
        ?.elementAt(quesindex)
        .questionId);
    selecteOptionList.add(ansindex);
    selectedListList.add(previousQuestionPapers?.data?.questions
        ?.elementAt(quesindex)
        .choices
        ?.elementAt(ansindex)
        .isSelect1);
    print('hiiii $selecteOptionList');
    previousQuestionPapers?.data?.questions
        ?.elementAt(quesindex)
        .choices
        ?.elementAt(ansindex)
        .isSelect1 = true;

    for (dynamic i = 0;
        i <
            previousQuestionPapers?.data?.questions
                ?.elementAt(quesindex)
                .attemptedAnswer
                ?.length;
        i++) {
      previousQuestionPapers?.data?.questions
          ?.elementAt(quesindex)
          .attemptedAnswer?[ansindex] = true;
      if (previousQuestionPapers?.data?.questions
              ?.elementAt(quesindex)
              .attemptedAnswer?[i] ==
          false) {
        previousQuestionPapers?.data?.questions
            ?.elementAt(quesindex)
            .attemptedAnswer?[i] = true;
      }
      previousQuestionPapers?.data?.questions
          ?.elementAt(quesindex)
          .attemptedAnswer?[i] = false;
      attemptedAnsList.add(previousQuestionPapers?.data?.questions
          ?.elementAt(quesindex)
          .attemptedAnswer
          ?.elementAt(i));
    }
    currentansIndex.value = ansindex;

    update();
  }

  checkAnswer(
    int quesIndex,
    int id,
  ) {
    print('hello1 $selectedAnsId');
    selectedId.value = id;
    for (dynamic i = 0;
        i <
            previousQuestionPapers?.data?.questions
                ?.elementAt(quesIndex)
                .choices
                ?.length;
        i++) {
      print(
          'hello2 ${previousQuestionPapers?.data?.questions?.elementAt(quesIndex).choices?.elementAt(i).choiceId}');
      if (previousQuestionPapers?.data?.questions
              ?.elementAt(quesIndex)
              .choices
              ?.elementAt(i)
              .isRight ==
          true) {
        print('Hellooooooo');
        selectedAnsId.value = previousQuestionPapers?.data?.questions
                ?.elementAt(quesIndex)
                .choices
                ?.elementAt(i)
                .choiceId ??
            0;
        print('hello $selectedAnsId');
      }
    }
    if (selectedAnsId.value == id) {
      previousQuestionPapers?.data?.questions
          ?.elementAt(quesIndex)
          .correctlyAnswered = true;
      print('hello Your answer is corret');
    } else if (selectedAnsId.value != id) {
      previousQuestionPapers?.data?.questions
          ?.elementAt(quesIndex)
          .correctlyAnswered = false;
      previousQuestionPapers?.data?.questions
          ?.elementAt(quesIndex)
          .alreadyAttempted = true;
      print('hello Your Ans is Wrong');
    }
  }

  viewSolution(int questionIndex) async {
    Future.delayed(const Duration(milliseconds: 100), (() {
      return previousQuestionPapers?.data?.questions
          ?.elementAt(questionIndex)
          .showSolution = true;
    }));
    update();
  }

  Future<bool?> solutionCall(int index) async {
    var submitted = await viewSolution(index);
    // isSelect.value = false;
    update();
    return previousQuestionPapers?.data?.questions
        ?.elementAt(index)
        .solutionShown = true;
  }

  nextPage() {
    //isAnswered = false;
    pageController.nextPage(
        duration: const Duration(milliseconds: 100), curve: Curves.linear);
    //print('currIndexSubi = $currIndex');
  }

  prevPage() {
    //isAnswered = true;
    pageController.previousPage(
        duration: const Duration(milliseconds: 100), curve: Curves.linear);
  }

  // void checkAnswer(int index, Questions? questions) {
  //   isPressed.value = true;
  //   questionIsAnswerd.update(questions?.questionId ?? 0, (value) => true);

  //   print('hii ${isPressed.value}');
  // }

  @override
  void onInit() {
    fetchPreviousQuestionPaperlist();
    super.onInit();
  }

  Future<void> fetchPreviousQuestionPaperlist() async {
    final response =
        await rootBundle.loadString('json/maths/previous_paper.json');
    previousQuestionPapers =
        PreviousQuestionPapers.fromJson(jsonDecode(response));
    print(response);
    update();
  }
}
