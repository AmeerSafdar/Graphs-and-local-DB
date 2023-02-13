// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:task07/helper/const/commonkeys.dart';
import 'package:task07/presentation_layer/views/add_screen.dart';
import 'package:task07/presentation_layer/views/graph_screen.dart';
import 'package:task07/presentation_layer/views/main_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (context) => MainScreen());
      case '/addScreen':
        return CupertinoPageRoute(builder: (context) => AddNewScreen());
      case '/graphScreen':
        var map = args as Map ;
        return CupertinoPageRoute(builder: (_) => GraphScreen(data: map[CommonKeys.DATA_KEY], name: map[CommonKeys.NAME_KEY],));
      default:
        return CupertinoPageRoute(builder: (context) => MainScreen());

    }
  }
}