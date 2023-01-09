import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:get/get.dart';
import 'package:toppr1/screens/previous_paper/model/previous_paper.dart';

import '../../../controller/previous_paper_controller.dart';

class AnswerOption extends StatelessWidget {
  AnswerOption({
    super.key,
    required this.questionIndex,
    required this.status,
    required this.ansIndex,
    required this.questionId,
    required this.onPressed,
  });
  final int questionIndex;
  final int ansIndex;
  final int questionId;
  final AnswerStatus? status;
  final Function() onPressed;

  PreviousQuestionPaperController myController = Get.find();
  @override
  Widget build(BuildContext context) {
    var questions = myController.previousQuestionPapers?.data?.questions;
    Color backgroundColor = Theme.of(context).primaryColor;
    Color borderColor = Theme.of(context).primaryColor;
    Color labelColor = Theme.of(context).primaryColor;
    Color labelTextColor = Theme.of(context).primaryColor;
    switch (status) {
      case AnswerStatus.answered:
        backgroundColor = Colors.blue.shade200;
        break;
      case AnswerStatus.correct:
        backgroundColor = Colors.green.shade300;
        break;
      case AnswerStatus.wrong:
        backgroundColor = Colors.red.shade400;
        break;
      case AnswerStatus.notanswered:
        backgroundColor = Colors.white;
        borderColor = Colors.grey.shade300;
        labelColor = Colors.grey.shade300;
        labelTextColor = Colors.black;
        break;
      case AnswerStatus.selected:
        backgroundColor = const Color(0xffEDF8FC);
        borderColor = Colors.lightBlue.shade300;
        labelColor = const Color(0xff55bbea);
        labelTextColor = Colors.white;
        break;
      default:
        backgroundColor = Colors.white;
    }
    return Column(
      children: [
        GestureDetector(
          onTap:
              // myController.checkIsQuestionAnswered(questionId)
              // ? null
              // :
              onPressed,
          child: Container(
            height: 70,
            width: 300,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(offset: const Offset(0, 2), color: backgroundColor)
              ],
              color: backgroundColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: borderColor,
              ),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      // color: const Color(0xffE0E0E0),
                      color: labelColor,
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                    child: Text(
                      questions
                              ?.elementAt(questionIndex)
                              .choices
                              ?.elementAt(ansIndex)
                              .label ??
                          '',
                      style: TextStyle(color: labelTextColor),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: onPressed,
                  child: Center(
                    child: SizedBox(
                      // height: 55,
                      width: 200,
                      child: TeXView(
                        child: TeXViewDocument(questions
                                ?.elementAt(questionIndex)
                                .choices
                                ?.elementAt(ansIndex)
                                .choice ??
                            'No Data'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}

class CorrectAnsCard extends StatelessWidget {
  CorrectAnsCard({
    super.key,
    required this.questionIndex,
    required this.ansIndex,
    required this.onPressed,
  });
  final int questionIndex;
  final int ansIndex;
  final Function() onPressed;

  PreviousQuestionPaperController myController = Get.find();
  @override
  Widget build(BuildContext context) {
    var questions = myController.previousQuestionPapers?.data?.questions;

    return Column(
      children: [
        GestureDetector(
          onTap:
              // myController.checkIsQuestionAnswered(questionId)
              // ? null
              // :
              onPressed,
          child: Container(
            height: 70,
            width: 300,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 2),
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.green.shade300,
              ),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: const Color(0xffE0E0E0),
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                    child: Text(
                      questions
                              ?.elementAt(questionIndex)
                              .choices
                              ?.elementAt(ansIndex)
                              .label ??
                          '',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: onPressed,
                  child: Center(
                    child: SizedBox(
                      // height: 55,
                      width: 200,
                      child: TeXView(
                        child: TeXViewDocument(questions
                                ?.elementAt(questionIndex)
                                .choices
                                ?.elementAt(ansIndex)
                                .choice ??
                            'No Data'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}

class WrongAnsCard extends StatelessWidget {
  WrongAnsCard({
    super.key,
    required this.questionIndex,
    required this.ansIndex,
    required this.onPressed,
  });
  final int questionIndex;
  final int ansIndex;
  final Function() onPressed;

  PreviousQuestionPaperController myController = Get.find();
  @override
  Widget build(BuildContext context) {
    var questions = myController.previousQuestionPapers?.data?.questions;
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            height: 70,
            width: 300,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 2),
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.red.shade200,
              ),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: const Color(0xffE0E0E0),
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                    child: Text(
                      questions
                              ?.elementAt(questionIndex)
                              .choices
                              ?.elementAt(ansIndex)
                              .label ??
                          '',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: onPressed,
                  child: Center(
                    child: SizedBox(
                      // height: 55,
                      width: 200,
                      child: TeXView(
                        child: TeXViewDocument(questions
                                ?.elementAt(questionIndex)
                                .choices
                                ?.elementAt(ansIndex)
                                .choice ??
                            'No Data'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}

class NotAnswerCard extends StatelessWidget {
  NotAnswerCard({
    super.key,
    required this.questionIndex,
    required this.ansIndex,
    required this.status,
    required this.onPressed,
  });
  final int questionIndex;
  final int ansIndex;
  final Function() onPressed;
  final AnswerStatus status;

  PreviousQuestionPaperController myController = Get.find();

  @override
  Widget build(BuildContext context) {
    var questions = myController.previousQuestionPapers?.data?.questions;
    Color backgroundColor = Theme.of(context).primaryColor;
    Color borderColor = Theme.of(context).primaryColor;
    Color labelColor = Colors.grey.shade300;
    Color labelTextColor = Colors.black;
    switch (status) {
      case AnswerStatus.answered:
        backgroundColor = backgroundColor;
        break;
      case AnswerStatus.correct:
        backgroundColor = Colors.green.shade300;
        labelColor = Colors.green.shade300;
        labelTextColor = Colors.white;
        break;
      case AnswerStatus.wrong:
        backgroundColor = Colors.red.shade400;
        labelColor = Colors.red.shade400;
        labelTextColor = Colors.white;
        break;
      case AnswerStatus.notanswered:
        backgroundColor = Colors.white;
        break;
      case AnswerStatus.selected:
        backgroundColor = Colors.blue.shade300;
        break;
      default:
        labelColor = Colors.grey.shade400;
        labelTextColor = Colors.white;
        backgroundColor = Colors.white;
    }
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            height: 70,
            width: 300,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(offset: Offset(0, 2), color: Colors.white),
              ],
              // color: backgroundColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: backgroundColor,
              ),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: labelColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Text(
                      questions
                              ?.elementAt(questionIndex)
                              .choices
                              ?.elementAt(ansIndex)
                              .label ??
                          '',
                      style: TextStyle(
                        color: labelTextColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: onPressed,
                  child: Center(
                    child: SizedBox(
                      // height: 55,
                      width: 200,
                      child: TeXView(
                        child: TeXViewDocument(questions
                                ?.elementAt(questionIndex)
                                .choices
                                ?.elementAt(ansIndex)
                                .choice ??
                            'No Data'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}
