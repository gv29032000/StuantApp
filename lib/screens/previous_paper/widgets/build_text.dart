import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildText extends StatelessWidget {
  const BuildText(
      {this.colors,
      this.size,
      this.weight,
      this.textalign,
      super.key,
      required this.text});
  final String text;
  final Color? colors;
  final double? size;
  final FontWeight? weight;
  final TextAlign? textalign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(color: colors, fontSize: size, fontWeight: weight),
    );
  }
}
