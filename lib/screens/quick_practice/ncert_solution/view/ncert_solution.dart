import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:get/get.dart';

import '../../../../controller/chapt.controller.dart';

class NCERTSolutionPage extends StatelessWidget {
  NCERTSolutionPage({super.key});

  final PolynomialVideoController controller =
      Get.find<PolynomialVideoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        actions: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white),
            ),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.apps_rounded,
                size: 13,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () => showDialog(),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  Icons.close,
                  size: 13,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
        title: Text(
          controller.ncertSolutions?.data?.pageTitle ?? '',
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: Stack(
        children: [
          PageView.builder(
              onPageChanged: (value1) {
                controller.currIndex.value = value1;
              },
              controller: controller.pageController,
              itemCount:
                  controller.ncertSolutions?.data?.questions?.length ?? 0,
              itemBuilder: (context, index) {
                // padding: const EdgeInsets.only(right: 8, left: 8),
                return SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20.0, 40, 20, 40),
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      controller.ncertSolutions?.data?.questions
                                              ?.elementAt(index)
                                              .sequenceNo
                                              .toString() ??
                                          '',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                const Icon(Icons.report_problem_outlined),
                                const SizedBox(
                                  width: 5,
                                ),
                                const SizedBox(
                                  height: 20,
                                  child: VerticalDivider(
                                    thickness: 1,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(Icons.bookmark_outline),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              child: TeXView(
                                child: TeXViewDocument(controller
                                        .ncertSolutions?.data?.questions
                                        ?.elementAt(index)
                                        .question ??
                                    ''),
                              ),
                            ),
                            Obx(() {
                              return controller.showSoln.value
                                  ? Container(
                                      decoration: BoxDecoration(
                                          color: Colors.lightGreen.shade50,
                                          borderRadius:
                                              BorderRadius.circular(10)),
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
                                                  color: Colors.lightGreenAccent
                                                      .shade700,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            TeXView(
                                              child: TeXViewDocument(
                                                  controller.ncertSolutions
                                                          ?.data?.questions
                                                          ?.elementAt(index)
                                                          .solution ??
                                                      '',
                                                  style: TeXViewStyle(
                                                      contentColor:
                                                          Colors.grey.shade800,
                                                      fontStyle: TeXViewFontStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              TeXViewFontWeight
                                                                  .w400))),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : const SizedBox();
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
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
                        controller.prevPage();
                      },
                      child: Obx(() {
                        return Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: controller.currIndex.value.isEqual(0)
                                ? Border.all(color: Colors.grey.shade300)
                                : Border.all(color: Colors.grey.shade400),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.arrow_back,
                              size: 28,
                              color: controller.currIndex.value.isEqual(0)
                                  ? Colors.grey.shade300
                                  : Colors.grey.shade500,
                            ),
                          ),
                        );
                      }),
                    ),
                    Obx(() {
                      return ElevatedButton(
                          onPressed: () {
                            controller.showSoln.isFalse
                                ? controller.showSoln.value =
                                    !controller.showSoln.value
                                : controller.currIndex.value == 9
                                    ? showDialog()
                                    : controller.nextPage();
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              minimumSize: const Size(270, 50),
                              shape: const StadiumBorder(),
                              backgroundColor: controller.showSoln.isFalse
                                  ? Colors.lightBlue.shade300
                                  : const Color(0xff7ed321)),
                          child: controller.showSoln.isFalse
                              ? const Text(
                                  'VIEW SOLUTION',
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
                                  : const Text(
                                      'NEXT',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800),
                                    ));
                    })
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

showDialog() {
  return Get.dialog(Padding(
    padding: const EdgeInsets.all(16.0),
    child: Center(
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          // padding: const EdgeInsets.all(20),
          height: 390,
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 75,
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade100,
                          blurRadius: 4,
                          spreadRadius: 4,
                          offset: const Offset(0, 3))
                    ]),
                child: const Icon(Icons.auto_graph_outlined),
              ),
              const SizedBox(
                height: 30,
              ),
              const Material(
                color: Colors.transparent,
                child: Text(
                  'Are you sure you want to exit?',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              SizedBox(
                width: 250,
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    'You have attempted 10 out of 10 questions',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        letterSpacing: 0.2,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey.shade600,
                        fontSize: 15),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.close(2);
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      minimumSize: const Size(270, 50),
                      shape: const StadiumBorder(),
                      backgroundColor: const Color(0xff7ed321)),
                  child: const Text(
                    'EXIT',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 16),
                  )),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: StadiumBorder(
                        side: BorderSide(color: Colors.grey.shade500)),
                    minimumSize: const Size(270, 50),
                    backgroundColor: Colors.white,
                  ),
                  child: Text(
                    'CANCEL',
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w800,
                        fontSize: 16),
                  ))
            ],
          )),
    ),
  ));
}
