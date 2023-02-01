import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toppr1/controller/crash_course_controller.dart';
import 'package:toppr1/screens/previous_paper/model/previous_paper.dart';
import 'package:toppr1/screens/quick_practice/bottom_button_card.dart';
import 'package:toppr1/screens/quick_practice/crash_course/widgets/option_card.dart';
import 'package:toppr1/screens/quick_practice/quick_practice_card.dart';
import 'package:toppr1/screens/quick_practice/widgets/question_card.dart';

class PolyCrashCoursePage extends StatelessWidget {
  PolyCrashCoursePage({super.key});
  CrashCourseController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    var questions = controller.crashCourse?.data?.questions;
    return QuickPracticeCard(
      child1: BottomButtonCard(),
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
                            seqNo: qIndex < 9
                                ? '0${qIndex + 1}'
                                : '${(qIndex + 1)}',
                            qnText: controller.crashCourse?.data?.questions
                                    ?.elementAt(qIndex)
                                    .question ??
                                ''),
                        SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: controller.crashCourse?.data?.questions
                                      ?.elementAt(qIndex)
                                      .solutionShown ==
                                  true
                              ? ListView.builder(
                                  itemCount: controller
                                      .crashCourse?.data?.questions
                                      ?.elementAt(qIndex)
                                      .choices
                                      ?.length,
                                  itemBuilder:
                                      (BuildContext context, int optIndex) {
                                    AnswerStatus status =
                                        AnswerStatus.notanswered;
                                    if (controller.crashCourse?.data?.questions
                                                ?.elementAt(qIndex)
                                                .correctlyAnswered ==
                                            true &&
                                        controller.crashCourse?.data?.questions
                                                ?.elementAt(qIndex)
                                                .choices
                                                ?.elementAt(optIndex)
                                                .choiceId ==
                                            controller.selectedId.value) {
                                      status = AnswerStatus.correct;
                                    } else if (controller
                                            .crashCourse?.data?.questions
                                            ?.elementAt(qIndex)
                                            .choices
                                            ?.elementAt(optIndex)
                                            .isRight ==
                                        true) {
                                      status = AnswerStatus.correct;
                                    } else if (controller.selectedAnsId.value !=
                                                controller.selectedId.value &&
                                            controller.crashCourse?.data
                                                    ?.questions
                                                    ?.elementAt(qIndex)
                                                    .choices
                                                    ?.elementAt(optIndex)
                                                    .choiceId ==
                                                controller.selectedId.value &&
                                            controller.crashCourse?.data
                                                    ?.questions
                                                    ?.elementAt(qIndex)
                                                    .solutionShown ==
                                                true ||
                                        controller.crashCourse?.data?.questions
                                                ?.elementAt(qIndex)
                                                .attemptedAnswer
                                                ?.elementAt(optIndex) ==
                                            true) {
                                      status = AnswerStatus.wrong;
                                    } else if (controller
                                            .crashCourse?.data?.questions
                                            ?.elementAt(qIndex)
                                            .choices
                                            ?.elementAt(optIndex)
                                            .choiceId !=
                                        controller.selectedAnsId.value) {
                                      return AdditionalOptionCard(
                                        index: qIndex,
                                        index1: optIndex,
                                        status: status,
                                        label: controller
                                                .crashCourse?.data?.questions
                                                ?.elementAt(qIndex)
                                                .choices
                                                ?.elementAt(optIndex)
                                                .label ??
                                            '',
                                        text: controller
                                                .crashCourse?.data?.questions
                                                ?.elementAt(qIndex)
                                                .choices
                                                ?.elementAt(optIndex)
                                                .choice ??
                                            '',
                                      );
                                    }
                                    return AdditionalOptionCard(
                                      index: qIndex,
                                      index1: optIndex,
                                      status: status,
                                      label: controller
                                              .crashCourse?.data?.questions
                                              ?.elementAt(qIndex)
                                              .choices
                                              ?.elementAt(optIndex)
                                              .label ??
                                          '',
                                      text: controller
                                              .crashCourse?.data?.questions
                                              ?.elementAt(qIndex)
                                              .choices
                                              ?.elementAt(optIndex)
                                              .choice ??
                                          '',
                                    );
                                  })
                              : ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller
                                      .crashCourse?.data?.questions
                                      ?.elementAt(qIndex)
                                      .choices
                                      ?.length,
                                  itemBuilder:
                                      (BuildContext context, int optIndex) {
                                    AnswerStatus status =
                                        AnswerStatus.notanswered;
                                    print('NotSelected');
                                    if (controller.crashCourse?.data?.questions
                                                ?.elementAt(qIndex)
                                                .choices
                                                ?.elementAt(optIndex)
                                                .isSelect1 ==
                                            true &&
                                        controller.crashCourse?.data?.questions
                                                ?.elementAt(qIndex)
                                                .attemptedAnswer
                                                ?.elementAt(optIndex) ==
                                            true) {
                                      status = AnswerStatus.selected;
                                      print('Status $status');
                                    }
                                    return OptionCard(
                                      index: qIndex,
                                      index1: optIndex,
                                      status: status,
                                      label: controller
                                              .crashCourse?.data?.questions
                                              ?.elementAt(qIndex)
                                              .choices
                                              ?.elementAt(optIndex)
                                              .label ??
                                          '',
                                      text: controller
                                              .crashCourse?.data?.questions
                                              ?.elementAt(qIndex)
                                              .choices
                                              ?.elementAt(optIndex)
                                              .choice ??
                                          '',
                                      press: () {
                                        print('Selecteddddddd');
                                        controller.selectedAnswer(
                                            qIndex, optIndex);
                                      },
                                    );
                                  }),
                        ),
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
