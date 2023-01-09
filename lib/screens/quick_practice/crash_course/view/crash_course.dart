import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toppr1/screens/quick_practice/crash_course/widgets/option_card.dart';
import 'package:toppr1/screens/quick_practice/quick_practice_card.dart';

import '../../../../controller/chapt.controller.dart';
import '../../widgets/question_card.dart';

class PolyCrashCoursePage extends StatelessWidget {
  PolyCrashCoursePage({super.key});
  final PolynomialVideoController controller =
      Get.find<PolynomialVideoController>();

  @override
  Widget build(BuildContext context) {
    return QuickPracticeCard(
      child: PageView.builder(
          onPageChanged: (value1) {
            controller.currIndex.value = value1;
          },
          controller: controller.pageController,
          itemCount: controller.crashCourse?.data?.questions?.length ?? 0,
          itemBuilder: (context, qIndex) {
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.fromLTRB(20.0, 40, 20, 40),
                color: Colors.white,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        QuestionCard(
                            seqNo: controller.crashCourse?.data?.questions
                                    ?.elementAt(qIndex)
                                    .sequenceNo
                                    .toString() ??
                                '',
                            qnText: controller.crashCourse?.data?.questions
                                    ?.elementAt(qIndex)
                                    .question ??
                                ''),
                        ...List.generate(
                            controller.crashCourse?.data?.questions
                                    ?.elementAt(qIndex)
                                    .choices
                                    ?.length ??
                                0, (optIndex) {
                          return OptionCard(
                            index: qIndex,
                            index1: optIndex,
                            label: controller.crashCourse?.data?.questions
                                    ?.elementAt(qIndex)
                                    .choices
                                    ?.elementAt(optIndex)
                                    .label ??
                                '',
                            text: controller.crashCourse?.data?.questions
                                    ?.elementAt(qIndex)
                                    .choices
                                    ?.elementAt(optIndex)
                                    .choice ??
                                '',
                            press: () {
                              controller.updateCurrentQn(optIndex, qIndex);
                            },
                          );
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
