import 'package:flutter/cupertino.dart';

abstract class HiveRepoInterface{
  Future<void> addHiveData(String listName,List<TextEditingController> controllers);
  List<dynamic>? getData();
  Future<void> deleteData(String name);
  void updateItems(int index, String value);
}