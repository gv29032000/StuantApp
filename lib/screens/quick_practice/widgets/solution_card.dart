// ignore_for_file: must_be_immutable, override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:get/get.dart';
import 'package:toppr1/controller/ncert_solution_controller.dart';

class SolutionCard extends StatelessWidget {
  const SolutionCard(
      {required this.solnCond, required this.solnText, super.key});

  @override
  final bool solnCond;

  final String solnText;

  @override
  Widget build(BuildContext context) {
    return solnCond
        ? Container(
            decoration: BoxDecoration(
                color: Colors.lightGreen.shade50,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SOLUTION',
                    style: TextStyle(
                        letterSpacing: 0.5,
                        color: Colors.lightGreenAccent.shade700,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TeXView(
                    child: TeXViewDocument(solnText,
                        style: TeXViewStyle(
                            contentColor: Colors.grey.shade800,
                            fontStyle: TeXViewFontStyle(
                                fontSize: 14,
                                fontWeight: TeXViewFontWeight.w400))),
                  ),
                ],
              ),
            ),
          )
        : const SizedBox();
  }
}

class SolutionCard1 extends StatelessWidget {
  const SolutionCard1({required this.quesindex, super.key});

  @override
  final int quesindex;

  @override
  Widget build(BuildContext context) {
    NCERTSolutionController controller = Get.find();
    return Container(
      decoration: BoxDecoration(
          color: Colors.lightGreen.shade50,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SOLUTION',
              style: TextStyle(
                  letterSpacing: 0.5,
                  color: Colors.lightGreenAccent.shade700,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            TeXView(
              child: TeXViewDocument(
                controller.polyNCERTSolutions.value.data?.questions
                        ?.elementAt(quesindex)
                        .solution ??
                    '',
                style: TeXViewStyle(
                  contentColor: Colors.grey.shade800,
                  fontStyle: TeXViewFontStyle(
                      fontSize: 14, fontWeight: TeXViewFontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
