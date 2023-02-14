// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:task07/presentation_layer/widgets/text_widget.dart';
class AppBarWidget extends StatelessWidget {
  AppBarWidget({
    required this.name,
    Key? key,
  }) : super(key: key);
   String name;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextWidget(txt: name),
      centerTitle: true,
    );
  }
}