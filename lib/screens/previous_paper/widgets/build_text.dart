import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildText extends StatelessWidget {
  const BuildText(
      {this.colors, this.size, this.weight, super.key, required this.text});
  final String text;
  final Color? colors;
  final double? size;
  final FontWeight? weight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: colors, fontSize: size, fontWeight: weight),
    );
  }
}
