// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:toppr1/screens/quick_practice/quick_practice_card.dart';
import 'package:toppr1/screens/quick_practice/widgets/question_card.dart';
import 'package:toppr1/screens/quick_practice/widgets/solution_card.dart';

class NCERTSolutionPage extends QuickPracticeCard {
  NCERTSolutionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return QuickPracticeCard(
      child: PageView.builder(
          onPageChanged: (value1) {
            controller.currIndex.value = value1;
          },
          controller: controller.pageController,
          itemCount: controller.ncertSolutions?.data?.questions?.length ?? 0,
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
                            seqNo: controller.ncertSolutions?.data?.questions
                                    ?.elementAt(qIndex)
                                    .sequenceNo
                                    .toString() ??
                                '',
                            qnText: controller.ncertSolutions?.data?.questions
                                    ?.elementAt(qIndex)
                                    .question ??
                                ''),
                        SolutionCard(
                          solnCond: controller.ncertSolutions?.data?.questions
                                  ?.elementAt(qIndex)
                                  .solutionShown ==
                              true,
                          solnText: controller.ncertSolutions?.data?.questions
                                  ?.elementAt(qIndex)
                                  .solution ??
                              '',
                        )
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
