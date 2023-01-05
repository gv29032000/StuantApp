import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:get/get.dart';
import 'package:toppr1/controller/previous_paper_controller.dart';
import 'package:toppr1/screens/previous_paper/model/previous_paper.dart';
import 'package:toppr1/screens/previous_paper/widgets/answer_option.dart';
import 'package:toppr1/screens/previous_paper/widgets/build_text.dart';

class PreviousPapperView extends StatelessWidget {
  PreviousPapperView({super.key});
  PreviousQuestionPaperController myController = Get.find();

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
      body: PageView.builder(
        controller: myController.pageController,
        itemCount: myController.previousQuestionPapers?.data?.questions?.length,
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
                                index < 9 ? '0${index + 1}' : '${(index + 1)}',
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
                            onPressed: () {},
                            icon:
                                // !controller.bookmarkSelected.value
                                //     ? const Icon(Icons.bookmark_border)
                                //     :
                                Icon(
                              Icons.bookmark,
                              color: Colors.blue.shade200,
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
                              '')),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 360,
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: myController
                                .previousQuestionPapers?.data?.questions
                                ?.elementAt(index)
                                .choices
                                ?.length,
                            itemBuilder: (BuildContext context, int index1) {
                              AnswerStatus status = AnswerStatus.notanswered;
                              // if (myController.currentansIndex.value == index1 &&
                              //     myController.questionAttempted[index] == true) {
                              //   status = AnswerStatus.selected;
                              // }
                              return AnswerOption(
                                  status: status,
                                  questionId:
                                      questions?.elementAt(index).questionId ??
                                          0,
                                  questionIndex: index,
                                  ansIndex: index1,
                                  onPressed: () {
                                    myController.selectedOptionIndex.value =
                                        index1;
                                    myController.selectedAnswer(
                                      index1,
                                      index,
                                    );
                                    // myController.checkAnswer(
                                    //     index, myController.question);
                                    // myController.onPressedColor(index);
                                  });
                            }),
                      ),
                      // ColoredBox(
                      //   color: Theme.of(context).scaffoldBackgroundColor,
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(10),
                      //     child: Row(
                      //       children: [
                      //         SizedBox(
                      //           height: 55,
                      //           width: 55,
                      //           child: IconButton(
                      //             onPressed: () {},
                      //             icon: const Icon(Icons.arrow_back_ios_new),
                      //           ),
                      //         ),
                      //         const SizedBox(
                      //           width: 5,
                      //         ),
                      //         Expanded(
                      //           child: ElevatedButton(
                      //             onPressed: () {
                      //               // controller.nextQuestion();
                      //             },
                      //             child: const Text('Next'),
                      //           ),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                );
              });
        },
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
