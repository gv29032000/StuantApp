// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:get/get.dart';
import 'package:toppr1/controller/ncert_solution_controller.dart';
import 'package:toppr1/screens/previous_paper/widgets/build_text.dart';
import 'package:toppr1/screens/quick_practice/button_bottom.dart';
import 'package:toppr1/screens/quick_practice/quick_practice_card.dart';
import 'package:toppr1/screens/quick_practice/widgets/question_card.dart';
import 'package:toppr1/screens/quick_practice/widgets/solution_card.dart';

class NCERTSolutionPage extends StatelessWidget {
  NCERTSolutionPage({super.key});

  NCERTSolutionController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return QuickPracticeCard(
      child1: controller.isList.value ? const SizedBox() : ButtonBottomCard(),
      child: Obx(
        () => controller.isList.value
            ? CustomScrollView(controller: controller.pageController, slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  title: Column(
                    children: [
                      const BuildText(
                          text: '0 / 30',
                          colors: Colors.black,
                          weight: FontWeight.bold,
                          size: 16),
                      BuildText(
                          text: 'Questions attempted',
                          size: 12,
                          colors: Colors.grey.shade600)
                    ],
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.grid_view,
                          color: Colors.black,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.filter_alt_outlined,
                          color: Colors.black,
                        ))
                  ],
                  pinned: true,
                  backgroundColor: Colors.blueGrey.shade50,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      childCount: controller
                          .polyNCERTSolutions.value.data?.questions?.length, (
                    BuildContext context,
                    int index,
                  ) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // controller.isListToPage(index);
                            controller.isList.value = false;
                            // pageController.jumpToPage(2);
                            controller.isListToPage(index);
                            // controller.pageController.animateToPage(
                            //   index,
                            //   curve: Curves.easeInOut,
                            //   duration: const Duration(microseconds: 200),
                            // );
                            controller.pageController.jumpToPage(index);
                            print('Is Index :$index');
                          },
                          child: ListTile(
                            title: TeXView(
                              child: TeXViewDocument(
                                controller.firstLine(index),
                                style: const TeXViewStyle(
                                  textAlign: TeXViewTextAlign.left,
                                ),
                              ),
                            ),
                            leading: Text(
                              index < 9
                                  ? '0${index + 1}'
                                  : '${0 + (index + 1)}',
                              style: const TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                        const Divider(),
                      ],
                    );
                  }),
                ),
              ])
            : PageView.builder(
                onPageChanged: (page) {
                  controller.questionIndex.value = page;
                },
                controller: controller.pageController,
                itemCount: controller
                        .polyNCERTSolutions.value.data?.questions?.length ??
                    0,
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
                                  qnText: controller.polyNCERTSolutions.value
                                          .data?.questions
                                          ?.elementAt(qIndex)
                                          .question ??
                                      ''),
                              controller.polyNCERTSolutions.value.data
                                          ?.questions
                                          ?.elementAt(qIndex)
                                          .showSolution ==
                                      true
                                  ? SolutionCard1(quesindex: qIndex)
                                  : const SizedBox()
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
      ),
    );
  }
}
