import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:get/get.dart';

import '../../../controller/ncert_solution_controller.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    this.onTap,
    required this.seqNo,
    required this.qnText,
    super.key,
  });

  final String seqNo;
  final String qnText;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  seqNo,
                  style: const TextStyle(fontWeight: FontWeight.bold),
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
            GestureDetector(
              onTap: onTap,
              child: const Icon(Icons.bookmark_outline),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          child: TeXView(
            child: TeXViewDocument(
              qnText,
            ),
          ),
        ),
      ],
    );
  }
}

class QuestionCard1 extends StatelessWidget {
  QuestionCard1({
    this.onTap,
    required this.seqNo,
    required this.qnText,
    required this.qIndex,
    super.key,
  });

  final String seqNo;
  final String qnText;
  final int qIndex;
  final Function()? onTap;
  final NCERTSolutionController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
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
                  seqNo,
                  style: const TextStyle(fontWeight: FontWeight.bold),
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
            GestureDetector(
              onTap: onTap,
              child: Obx(
                () => controller.polyNCERTSolutions.value.data?.questions
                            ?.elementAt(qIndex)
                            .isBookmarked ==
                        true
                    ? const Icon(
                        Icons.bookmark,
                        color: Colors.blue,
                      )
                    : const Icon(Icons.bookmark_outline),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          child: TeXView(
            child: TeXViewDocument(
              qnText,
            ),
          ),
        ),
      ],
    );
  }
}
