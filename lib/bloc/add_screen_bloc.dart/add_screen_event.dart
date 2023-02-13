// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:task07/bloc/main_screen_bloc.dart/main_screen_bloc.dart';

abstract class AddScreenEvents{}

class AddFields extends AddScreenEvents{
}

class AddData extends AddScreenEvents{
  String listName;
  List<TextEditingController> controllers;
  MainScreenBloc mainBloc;
  AddData({
    required this.controllers,
    required this.listName,
    required this.mainBloc
  });
}
