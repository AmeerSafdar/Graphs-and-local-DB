  // ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:task07/helper/const/colorsHelper.dart';
import 'package:task07/presentation_layer/widgets/text_widget.dart';

void buildSnackbar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration:const Duration(milliseconds: 500),
                    content:  TextWidget(txt:msg) ,
                    backgroundColor: ColorsHelper.GREEN_COLOR,
             ));
  }