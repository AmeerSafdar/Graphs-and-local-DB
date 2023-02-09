import 'package:flutter/cupertino.dart';

abstract class Events{}

class AddFields extends Events{
  TextEditingController controler;
  AddFields({required this.controler});
}
class GetData extends Events{}
class AddData extends Events{}


class Deleteitem extends Events{
  String delteItemName;
  Deleteitem({
    required this.delteItemName
  });
}

class UpdateData extends Events{
  int index;
  String name;
  BuildContext contxt;
  
  UpdateData({
    required this.index,
    required this.name,
    required this.contxt
  });
}