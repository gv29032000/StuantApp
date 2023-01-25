import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:get/get.dart';
import 'package:toppr1/controller/chapt.controller.dart';
import 'package:toppr1/controller/previous_paper_controller.dart';
import 'package:toppr1/screens/previous_paper/model/previous_paper.dart';
import 'package:toppr1/screens/previous_paper/widgets/answer_option.dart';
import 'package:toppr1/screens/previous_paper/widgets/build_text.dart';

class PreviousPapperView extends StatelessWidget {
  PreviousPapperView({super.key});
  PreviousQuestionPaperController myController = Get.find();

  final PolynomialVideoController controller =
      Get.find<PolynomialVideoController>();

  @override
  Widget build(BuildContext context) {
    var questions = myController.previousQuestionPapers?.data?.questions;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {},
              icon: _buildicon(
                Icons.apps_rounded,
                false,
              )),
          const SizedBox(
            width: 10,
          ),
          IconButton(
              onPressed: () {
                _buildExitdialog();
              },
              icon: _buildicon(
                Icons.close,
                false,
              )),
          const SizedBox(
            width: 10,
          ),
        ],
        title: const BuildText(
          text: 'Previous Papers',
          colors: Colors.white,
          weight: FontWeight.w500,
        ),
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: myController.pageController,
            onPageChanged: (value) {
              myController.questionIndex.value = value;
            },
            itemCount:
                myController.previousQuestionPapers?.data?.questions?.length,
            itemBuilder: (BuildContext context, int index) {
              return GetBuilder<PreviousQuestionPaperController>(
                  init: PreviousQuestionPaperController(),
                  builder: (_) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(4)),
                                child: Center(
                                  child: Text(
                                    index < 9
                                        ? '0${index + 1}'
                                        : '${(index + 1)}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {},
                                child: const Icon(
                                  Icons.report_problem_outlined,
                                  size: 18,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const SizedBox(
                                height: 18,
                                child: VerticalDivider(
                                  width: 10,
                                  color: Colors.black,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  myController.addBookMark(index);
                                },
                                icon:
                                    // !controller.bookmarkSelected.value
                                    //     ? const Icon(Icons.bookmark_border)
                                    //     :
                                    myController.previousQuestionPapers?.data
                                                ?.questions
                                                ?.elementAt(index)
                                                .isBookmarked ==
                                            true
                                        ? Icon(Icons.bookmark,
                                            color: Colors.blue.shade200)
                                        : const Icon(
                                            Icons.bookmark_border_outlined,
                                          ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TeXView(
                            child: TeXViewDocument(myController
                                    .previousQuestionPapers?.data?.questions
                                    ?.elementAt(index)
                                    .question ??
                                ''),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 360,
                            child: myController
                                        .previousQuestionPapers?.data?.questions
                                        ?.elementAt(index)
                                        .solutionShown ==
                                    true
                                ? ListView.builder(
                                    itemCount: myController
                                        .previousQuestionPapers?.data?.questions
                                        ?.elementAt(index)
                                        .choices
                                        ?.length,
                                    itemBuilder:
                                        (BuildContext context, int index1) {
                                      AnswerStatus status =
                                          AnswerStatus.notanswered;
                                      if (myController.previousQuestionPapers
                                                  ?.data?.questions
                                                  ?.elementAt(index)
                                                  .correctlyAnswered ==
                                              true &&
                                          myController.previousQuestionPapers
                                                  ?.data?.questions
                                                  ?.elementAt(index)
                                                  .choices
                                                  ?.elementAt(index1)
                                                  .choiceId ==
                                              myController.selectedId.value) {
                                        status = AnswerStatus.correct;
                                      } else if (myController
                                              .previousQuestionPapers
                                              ?.data
                                              ?.questions
                                              ?.elementAt(index)
                                              .choices
                                              ?.elementAt(index1)
                                              .isRight ==
                                          true) {
                                        status = AnswerStatus.correct;
                                      } else if (myController
                                                      .selectedAnsId.value !=
                                                  myController
                                                      .selectedId.value &&
                                              myController
                                                      .previousQuestionPapers
                                                      ?.data
                                                      ?.questions
                                                      ?.elementAt(index)
                                                      .choices
                                                      ?.elementAt(index1)
                                                      .choiceId ==
                                                  myController
                                                      .selectedId.value &&
                                              myController
                                                      .previousQuestionPapers
                                                      ?.data
                                                      ?.questions
                                                      ?.elementAt(index)
                                                      .solutionShown ==
                                                  true ||
                                          myController.previousQuestionPapers
                                                  ?.data?.questions
                                                  ?.elementAt(index)
                                                  .attemptedAnswer
                                                  ?.elementAt(index1) ==
                                              true) {
                                        status = AnswerStatus.wrong;
                                      } else if (myController
                                              .previousQuestionPapers
                                              ?.data
                                              ?.questions
                                              ?.elementAt(index)
                                              .choices
                                              ?.elementAt(index1)
                                              .choiceId !=
                                          myController.selectedAnsId.value) {
                                        return NotAnswerCard(
                                            status: status,
                                            questionIndex: index,
                                            ansIndex: index1,
                                            onPressed: () {});
                                      }
                                      return NotAnswerCard(
                                          status: status,
                                          questionIndex: index,
                                          ansIndex: index1,
                                          onPressed: () {});
                                    })
                                : ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: myController
                                        .previousQuestionPapers?.data?.questions
                                        ?.elementAt(index)
                                        .choices
                                        ?.length,
                                    itemBuilder:
                                        (BuildContext context, int index1) {
                                      AnswerStatus status =
                                          AnswerStatus.notanswered;
                                      if (myController.previousQuestionPapers
                                                  ?.data?.questions
                                                  ?.elementAt(index)
                                                  .choices
                                                  ?.elementAt(index1)
                                                  .isSelect1 ==
                                              true &&
                                          questions
                                                  ?.elementAt(index)
                                                  .attemptedAnswer
                                                  ?.elementAt(index1) ==
                                              true) {
                                        status = AnswerStatus.selected;
                                      }
                                      return AnswerOption(
                                          status: status,
                                          questionId: questions
                                                  ?.elementAt(index)
                                                  .questionId ??
                                              0,
                                          questionIndex: index,
                                          ansIndex: index1,
                                          onPressed: () {
                                            print(
                                                'hello${questions?.elementAt(index).selectedAns}');

                                            questions
                                                ?.elementAt(index)
                                                .selectedAns
                                                ?.add(index1);
                                            myController.selectedOptionIndex
                                                .value = index1;
                                            myController.selectedAnswer(
                                              index1,
                                              index,
                                            );
                                          });
                                    }),
                          ),
                          myController.previousQuestionPapers?.data?.questions
                                      ?.elementAt(index)
                                      .solutionShown ==
                                  true
                              ? GetBuilder<PreviousQuestionPaperController>(
                                  builder: (_) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Colors.lightGreen.shade50,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'SOLUTION',
                                            style: TextStyle(
                                                letterSpacing: 0.5,
                                                color: Colors
                                                    .lightGreenAccent.shade700,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          TeXView(
                                            child: TeXViewDocument(
                                              myController
                                                      .previousQuestionPapers
                                                      ?.data
                                                      ?.questions
                                                      ?.elementAt(index)
                                                      .solution ??
                                                  '',
                                              style: TeXViewStyle(
                                                contentColor:
                                                    Colors.grey.shade800,
                                                fontStyle: TeXViewFontStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        TeXViewFontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                })
                              : const SizedBox(),
                        ],
                      ),
                    );
                  });
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 90,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        myController.prevPage();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.arrow_back,
                            size: 28,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ),
                    ),
                    Obx(() {
                      return ElevatedButton(
                        onPressed: () {
                          if (myController
                                  .previousQuestionPapers?.data?.questions
                                  ?.elementAt(myController.questionIndex.value)
                                  .choices
                                  ?.elementAt(
                                      myController.currentansIndex.value)
                                  .isSelect1 ==
                              false) {
                            myController.nextPage();
                          }
                          if (myController
                                  .previousQuestionPapers?.data?.questions
                                  ?.elementAt(myController.questionIndex.value)
                                  .choices
                                  ?.elementAt(
                                      myController.currentansIndex.value)
                                  .isSelect1 ==
                              true) {
                            myController
                                .viewSolution(myController.questionIndex.value);
                            myController.checkAnswer(
                                myController.questionIndex.value,
                                questions
                                        ?.elementAt(
                                            myController.questionIndex.value)
                                        .choices
                                        ?.elementAt(
                                            myController.currentansIndex.value)
                                        .choiceId ??
                                    0);
                            myController.previousQuestionPapers?.data?.questions
                                        ?.elementAt(
                                            myController.questionIndex.value)
                                        .solutionShown ==
                                    true
                                ? myController.nextPage()
                                : myController.solutionCall(
                                    myController.questionIndex.value);
                          }

                          // if (myController
                          //         .previousQuestionPapers?.data?.questions
                          //         ?.elementAt(myController.questionIndex.value)
                          //         .showSolution ==
                          //     true) {
                          //   myController.previousQuestionPapers?.data?.questions
                          //               ?.elementAt(
                          //                   myController.questionIndex.value)
                          //               .solutionShown ==
                          //           true
                          //       ? myController.nextPage()
                          //       : myController.solutionCall(
                          //           myController.questionIndex.value);
                          // }
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          side: BorderSide(
                            color: myController
                                        .previousQuestionPapers?.data?.questions
                                        ?.elementAt(
                                            myController.questionIndex.value)
                                        .solutionShown ==
                                    true
                                ? const Color(0xff7ED321)
                                : myController.previousQuestionPapers?.data
                                            ?.questions
                                            ?.elementAt(myController
                                                .questionIndex.value)
                                            .choices
                                            ?.elementAt(myController
                                                .selectedOptionIndex.value)
                                            .isSelect1 ==
                                        true
                                    ? Colors.lightBlue.shade300
                                    : Colors.grey.shade300,
                          ),
                          minimumSize: const Size(270, 50),
                          shape: const StadiumBorder(),
                          backgroundColor: myController
                                      .previousQuestionPapers?.data?.questions
                                      ?.elementAt(
                                          myController.questionIndex.value)
                                      .solutionShown ==
                                  true
                              ? const Color(0xff7ED321)
                              : myController.previousQuestionPapers?.data
                                          ?.questions
                                          ?.elementAt(
                                              myController.questionIndex.value)
                                          .choices
                                          ?.elementAt(myController
                                              .selectedOptionIndex.value)
                                          .isSelect1 ==
                                      true
                                  ? Colors.lightBlue.shade300
                                  : Colors.white,
                        ),
                        child: myController
                                    .previousQuestionPapers?.data?.questions
                                    ?.elementAt(
                                        myController.questionIndex.value)
                                    .solutionShown ==
                                true
                            ? const Text(
                                'NEXT',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800),
                              )
                            : myController
                                        .previousQuestionPapers?.data?.questions
                                        ?.elementAt(
                                            myController.questionIndex.value)
                                        .choices
                                        ?.elementAt(myController
                                            .selectedOptionIndex.value)
                                        .isSelect1 ==
                                    true
                                ? const Text(
                                    'SUBMIT',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800),
                                  )
                                : controller.currIndex.value == 9
                                    ? const Text(
                                        'FINISH',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800),
                                      )
                                    : Text(
                                        'SKIP',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey.shade500,
                                            fontWeight: FontWeight.w800),
                                      ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildicon(IconData icon, bool select, {Color? color}) {
    return Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: select ? Colors.blue : Colors.white),
            color: select ? Colors.blue : Colors.black),
        child: Icon(icon, size: 16, color: color));
  }

  Future<dynamic> _buildExitdialog() {
    return Get.defaultDialog(
        title: 'Are you sure you want to exit?',
        middleText: 'You have attempted 0 out of 30 Questions.',
        content: Column(
          children: [
            Center(
              child: Text(
                'You have attempted 0 out of 30 \nQuestions.',
                style: TextStyle(
                  color: Colors.grey.shade400,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Get.close(2);
              },
              child: Container(
                width: 180,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xff50BF30),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(child: Text('Exit')),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Get.close(1);
              },
              child: Container(
                width: 180,
                height: 40,
                decoration: BoxDecoration(
                    // color: Color(0xff50BF30),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey)),
                child: Center(
                    child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.grey.shade400,
                  ),
                )),
              ),
            ),
          ],
        ));
  }
}
