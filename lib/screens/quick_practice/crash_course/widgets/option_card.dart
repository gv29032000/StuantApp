// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:toppr1/screens/previous_paper/model/previous_paper.dart';
import 'package:toppr1/screens/quick_practice/crash_course/view/crash_course.dart';

class OptionCard extends PolyCrashCoursePage {
  OptionCard({
    super.key,
    required this.index,
    required this.index1,
    required this.label,
    required this.text,
    required this.status,
    required this.press,
  });
  final String label;
  final String text;
  final int index;
  final int index1;
  final AnswerStatus status;
  final Function() press;

  @override
  Widget build(BuildContext context) {
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
      onTap: press,
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
                  label,
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
                child: TeXViewDocument(text,
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

class AdditionalOptionCard extends PolyCrashCoursePage {
  AdditionalOptionCard({
    super.key,
    required this.index,
    required this.index1,
    required this.label,
    required this.text,
    required this.status,
  });
  final String label;
  final String text;
  final int index;
  final AnswerStatus status;
  final int index1;

  @override
  Widget build(BuildContext context) {
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
        borderColor = Colors.green.shade300;
        labelTextColor = Colors.white;
        break;
      case AnswerStatus.wrong:
        backgroundColor = Colors.red.shade400;
        borderColor = Colors.red.shade400;
        labelColor = Colors.red.shade400;
        labelTextColor = Colors.white;
        break;
      case AnswerStatus.notanswered:
        backgroundColor = Colors.white;
        borderColor = Colors.grey.shade400;
        break;
      case AnswerStatus.selected:
        backgroundColor = Colors.blue.shade300;
        break;
      default:
        labelColor = Colors.grey.shade400;
        borderColor = Colors.grey.shade400;
        labelTextColor = Colors.white;
        backgroundColor = Colors.white;
    }
    return GestureDetector(
      child: Container(
        // padding: const EdgeInsets.all(18),
        margin: const EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
            color: Colors.white,
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
                // borderRadius: BorderRadius.circular(10)
              ),
              child: Center(
                child: Text(
                  label,
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
                child: TeXViewDocument(text,
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
