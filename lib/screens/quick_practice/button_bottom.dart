import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toppr1/controller/ncert_solution_controller.dart';

class ButtonBottomCard extends StatelessWidget {
  ButtonBottomCard({super.key});

  final NCERTSolutionController controller = Get.find();

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
              Obx(
                () => ElevatedButton(
                  onPressed: () {
                    if (controller.polyNCERTSolutions.value.data?.questions
                            ?.elementAt(controller.questionIndex.value)
                            .solutionShown ==
                        true) {
                      controller.nextPage();
                    }
                    if (controller.polyNCERTSolutions.value.data?.questions
                            ?.elementAt(controller.questionIndex.value)
                            .showSolution ==
                        true) {
                      controller.viewSolution(controller.questionIndex.value);
                    }
                    controller.solutionCall(controller.questionIndex.value);
                  },
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(
                          color: controller
                                      .polyNCERTSolutions.value.data?.questions
                                      ?.elementAt(
                                          controller.questionIndex.value)
                                      .showSolution ==
                                  true
                              ? Colors.green.shade400
                              : Colors.lightBlue.shade300),
                      elevation: 0,
                      minimumSize: const Size(270, 50),
                      shape: const StadiumBorder(),
                      backgroundColor: controller
                                  .polyNCERTSolutions.value.data?.questions
                                  ?.elementAt(controller.questionIndex.value)
                                  .solutionShown ==
                              true
                          ? Colors.green.shade500
                          : Colors.blue.shade300),
                  child: controller.polyNCERTSolutions.value.data?.questions
                              ?.elementAt(controller.questionIndex.value)
                              .solutionShown ==
                          true
                      ? const Text(
                          'NEXT',
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
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
