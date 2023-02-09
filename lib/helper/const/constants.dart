// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:task07/helper/const/stringHelper.dart';
import 'package:task07/helper/const/text_edit_controllers.dart';
import 'package:task07/helper/extension/validation_helper.dart';
import 'package:task07/helper/utils/dialogue_utils.dart';
class Constants{
  static DialogUtils dialogUtils = DialogUtils();
  static TextEditContrlers control=TextEditContrlers();
  
  static TextFormField textFields(TextEditingController controller) {
    return TextFormField(
                            keyboardType: TextInputType.number,
                            controller: controller,
                            validator: (val) => '$val'.isRequired()
                                ? null
                                : StringHelper.REQ_FIELD,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText:
                                  "${StringHelper.NUMBER} ${control.controllers.length + 1 }",
                            ),
                          );
  }
}