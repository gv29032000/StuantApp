import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toppr1/screens/quick_practice/widgets/close_card.dart';

import '../../controller/chapt.controller.dart';

class BottomButtonCard extends StatelessWidget {
  BottomButtonCard({super.key});

  final PolynomialVideoController controller =
      Get.find<PolynomialVideoController>();

  @override
  Widget build(BuildContext context) {
    return Align(
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
                      controller.solutionCall(controller.currIndex.value);
                      controller.currIndex.value == 9
                          ? Get.dialog(const CloseCard())
                          : controller.ncertSolutions?.data?.questions
                                      ?.elementAt(controller.currIndex.value)
                                      .solutionShown ==
                                  true
                              ? controller.nextPage()
                              : controller
                                  .showSolution1(controller.currIndex.value);
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        minimumSize: const Size(270, 50),
                        shape: const StadiumBorder(),
                        backgroundColor: controller
                                    .ncertSolutions?.data?.questions
                                    ?.elementAt(controller.currIndex.value)
                                    .showSolution ==
                                false
                            ? Colors.lightBlue.shade300
                            : const Color(0xff7ed321)),
                    child: controller.ncertSolutions?.data?.questions
                                ?.elementAt(controller.currIndex.value)
                                .showSolution ==
                            true
                        ? const Text(
                            'NEXT',
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
                                'VIEW SOLUTION',
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
    );
  }
}
