import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    required this.seqNo,
    required this.qnText,
    super.key,
  });

  final String seqNo;
  final String qnText;

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
            const Icon(Icons.bookmark_outline),
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
