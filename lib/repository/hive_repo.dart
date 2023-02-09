// ignore_for_file: non_constant_identifier_names, use_rethrow_when_possible

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task07/helper/const/commonkeys.dart';

class AddDataRepo{
  addHiveData(String listName,List<TextEditingController> controllers) async{
    try{
      final listData=Hive.box(CommonKeys.DB_NAME);
      await listData.put(listName, [controllers[0].text,controllers[1].text,controllers[2].text,controllers[3].text,controllers[4].text],);
      getData();
    }
    catch(e){
      throw e;
    }
  }
  getData(){
    final listData=Hive.box(CommonKeys.DB_NAME);
    final keys=listData.keys;
    final values = listData.values;
    return [values.toList(), keys.toList()];
  }
  deleteData(String name) async{
    final listData=Hive.box(CommonKeys.DB_NAME);
    await listData.delete(name);
  }
  updateItems(int index, String value) async{
    final listData=Hive.box(CommonKeys.DB_NAME);
    var keyValuePair=listData.getAt(index).toList();
     listData.deleteAt(index);
     listData.put(value, keyValuePair);
    getData();
  }
}