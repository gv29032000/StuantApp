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
  RxList<bool> questionAttempted = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ].obs;
  final PageController pageController = PageController(
    initialPage: 0,
    // controller.courseCrash?.data?.questions?.length  ?? 0
  );
  RxSet list1 = RxSet();
  RxList quesIndexList = [].obs;
  var isPressed = false.obs;
  var currentansIndex = 0.obs;
  var currentquesIndex = 0.obs;
  var selectedOptionIndex = 0.obs;
  var selectedAnswerIndex = 0.obs;
  RxList selecteOptionList = [].obs;
  RxList selectedListList = [].obs;

  bool checkIsQuestionAnswered(int quesId) {
    return questionIsAnswerd.entries
        .firstWhere((element) => element.key == quesId)
        .value;
  }

  void selectedAnswer(
    int ansindex,
    int quesindex,
  ) {
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
    if (ansindex == selecteOptionList.last &&
        selectedOptionIndex.value == ansindex) {
      previousQuestionPapers?.data?.questions
                  ?.elementAt(quesindex)
                  .choices
                  ?.elementAt(ansindex)
                  .isSelect1 ==
              false
          ? previousQuestionPapers?.data?.questions
              ?.elementAt(quesindex)
              .choices
              ?.elementAt(ansindex)
              .isSelect1 = true
          : previousQuestionPapers?.data?.questions
              ?.elementAt(quesindex)
              .choices
              ?.elementAt(ansindex)
              .isSelect1 = false;
    }
    if (selectedOptionIndex > selectedAnswerIndex.value) {
      previousQuestionPapers?.data?.questions
          ?.elementAt(quesindex)
          .choices
          ?.elementAt(ansindex)
          .isSelect1 = false;
    }
    // if (ansindex != selecteOptionList.last) {
    //   previousQuestionPapers?.data?.questions
    //       ?.elementAt(quesindex)
    //       .choices
    //       ?.elementAt(ansindex)
    //       .isSelect1 = false;
    // }

    // quesIndexList[quesindex] = quesindex;
    questionAttempted[quesindex] = true;
    currentansIndex.value = ansindex;
    print('hiii $questionAttempted');
    print('hiii $quesIndexList');
    print('hiii $attemptedQuestions');

    update();
  }

  void checkAnswer(int index, Questions? questions) {
    isPressed.value = true;
    // list_status_selected.value.add(list_status[index]);
    questionIsAnswerd.update(questions?.questionId ?? 0, (value) => true);
    list1.add(index);
    print('hii ${isPressed.value}');
  }

  @override
  void onInit() {
    fetchPreviousQuestionPaperlist();
    super.onInit();
  }

  Future<void> fetchPreviousQuestionPaperlist() async {
    final response =
        await rootBundle.loadString('json/maths/`previous_paper.json');
    previousQuestionPapers =
        PreviousQuestionPapers.fromJson(jsonDecode(response));
    print(response);
    update();
  }
}
