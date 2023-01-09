// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:get/get.dart';
import 'package:toppr1/screens/quick_practice/crash_course/view/crash_course.dart';

class OptionCard extends PolyCrashCoursePage {
  OptionCard({
    super.key,
    this.press,
    required this.index,
    required this.index1,
    required this.label,
    required this.text,
  });
  final String label;
  final String text;
  final int index;
  final int index1;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: press,
        child: Container(
          // padding: const EdgeInsets.all(18),
          margin: const EdgeInsets.only(top: 12),
          decoration: BoxDecoration(
              color: controller.selectedOptionIndex == index1
                  ? const Color(0xffedf8fc)
                  : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: controller.selectedOptionIndex == index1
                    ? Colors.lightBlue.shade300
                    : Colors.grey.shade300,
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
                  color: controller.selectedOptionIndex == index1
                      ? const Color(0xff55bbea)
                      : Colors.grey.shade300,
                  //borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Text(
                    label,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: controller.selectedOptionIndex == index1
                            ? Colors.white
                            : Colors.black),
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
    });
  }
}
