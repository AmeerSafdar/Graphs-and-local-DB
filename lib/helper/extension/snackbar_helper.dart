  // ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task07/helper/const/colorsHelper.dart';

void buildSnackbar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:  Text(msg) ,
                    backgroundColor: ColorsHelper.GREEN_COLOR,
             ));
  }