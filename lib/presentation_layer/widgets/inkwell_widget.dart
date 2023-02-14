// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:task07/presentation_layer/widgets/text_widget.dart';
class InkwellWidget extends StatelessWidget {
  InkwellWidget({
    super.key,
    required this.pressed,
    required this.txt
    });
    VoidCallback pressed;
    String txt;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pressed,
      child: TextWidget(txt: txt),
    );
  }
}