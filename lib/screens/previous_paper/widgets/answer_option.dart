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
    switch (status) {
      case AnswerStatus.answered:
        backgroundColor = backgroundColor;
        break;
      case AnswerStatus.correct:
        backgroundColor = Colors.green.shade300;
        break;
      case AnswerStatus.wrong:
        backgroundColor = Colors.red.shade400;
        break;
      case AnswerStatus.notanswered:
        backgroundColor = Colors.white;
        break;
      case AnswerStatus.selected:
        backgroundColor = Colors.blue.shade300;
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
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: myController.previousQuestionPapers?.data?.questions
                                ?.elementAt(questionIndex)
                                .choices
                                ?.elementAt(ansIndex)
                                .isSelect1 ==
                            true &&
                        myController.previousQuestionPapers?.data?.questions
                                ?.elementAt(questionIndex)
                                .isSelected ==
                            true
                    ? Colors.blue.shade300
                    : Colors.grey.shade400,
                //  myController.onPressedColor(ansIndex, questionIndex)
                //  (myController.currentansIndex.value == ansIndex &&
                //         myController.questionAttempted[questionIndex] ==
                //             true)
                //     ? Colors.blue
                //     : Colors.grey
                // myController.onPressedColor(ansIndex),
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
                Center(
                  child: SizedBox(
                    // height: 55,
                    width: 200,
                    child: TeXView(
                        child: TeXViewDocument(questions
                                ?.elementAt(questionIndex)
                                .choices
                                ?.elementAt(ansIndex)
                                .choice ??
                            'hiii')),
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
