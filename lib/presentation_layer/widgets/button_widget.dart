// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:task07/presentation_layer/widgets/text_widget.dart';
class ButtonWidgets extends StatelessWidget {
   ButtonWidgets({
    Key? key,
    required this.pressed,
    required this.btnTXT
  }):super(key: key);
  VoidCallback pressed;
  String btnTXT;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed:pressed,
     child: TextWidget(txt: btnTXT)
     ),
                 );
  }
}