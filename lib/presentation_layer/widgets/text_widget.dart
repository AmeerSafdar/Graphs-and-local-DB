// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
class TextWidget extends StatelessWidget {
   TextWidget({
    required this.txt, this.style,super.key
    });
    String txt;
    TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(txt, style: style,);
  }
}