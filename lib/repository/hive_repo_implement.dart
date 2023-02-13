// ignore_for_file: non_constant_identifier_names, use_rethrow_when_possible

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task07/helper/const/commonkeys.dart';
import 'package:task07/repository/hive_repo_interface.dart';

class AddDataRepo implements HiveRepoInterface{

  @override
  Future<void> addHiveData(String listName,List<TextEditingController> controllers) async{
    try{
      
      final listData=Hive.box(CommonKeys.DB_NAME);
      await listData.put(listName, [controllers[0].text,controllers[1].text,controllers[2].text,controllers[3].text,controllers[4].text],);
      
    }
    catch(e){
      throw e;
    }
  }

  @override
  List<dynamic> getData(){
    final listData=Hive.box(CommonKeys.DB_NAME);
    final keys=listData.keys;
    final values = listData.values;
    return [values.toList(), keys.toList()];
  }

  @override
  Future<void> deleteData(String name) async{
    final listData=Hive.box(CommonKeys.DB_NAME);
    await listData.delete(name);
  }

  @override
  void updateItems(int index, String value) {
    final listData=Hive.box(CommonKeys.DB_NAME);
    var keyValuePair=listData.getAt(index).toList();
     listData.deleteAt(index);
     listData.put(value, keyValuePair);
  }
}