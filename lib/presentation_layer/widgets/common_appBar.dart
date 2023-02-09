// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
class AppBarWidget extends StatelessWidget {
  AppBarWidget({
    required this.name,
    Key? key,
  }) : super(key: key);
   String name;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading:false ,
      title: Text(name),
      centerTitle: true,
    );
  }
}