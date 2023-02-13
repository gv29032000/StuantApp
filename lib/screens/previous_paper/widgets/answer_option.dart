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

  final PreviousQuestionPaperController myController = Get.find();
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
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        // padding: const EdgeInsets.all(18),
        margin: const EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: borderColor,
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 2,
                  spreadRadius: 0.5,
                  offset: const Offset(0, 2)),
            ]),
        child: Row(
          children: [
            const SizedBox(
              width: 15,
            ),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: labelColor,
                //borderRadius: BorderRadius.circular(10)
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
                    fontWeight: FontWeight.bold,
                    color: labelTextColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            SizedBox(
              width: 265,
              child: TeXView(
                child: TeXViewDocument(
                    questions
                            ?.elementAt(questionIndex)
                            .choices
                            ?.elementAt(ansIndex)
                            .choice ??
                        'NO DATA',
                    style:
                        const TeXViewStyle(textAlign: TeXViewTextAlign.left)),
              ),
            ),
          ],
        ),
      ),
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

  final PreviousQuestionPaperController myController = Get.find();

  @override
  Widget build(BuildContext context) {
    var questions = myController.previousQuestionPapers?.data?.questions;
    Color backgroundColor = Theme.of(context).primaryColor;
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
              color: Colors.white,
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
