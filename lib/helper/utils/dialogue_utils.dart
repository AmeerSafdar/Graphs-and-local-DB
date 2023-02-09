// ignore_for_file: prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace, unnecessary_string_interpolations, unused_local_variable, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:task07/helper/const/constants.dart';
import 'package:task07/helper/const/stringHelper.dart';
import 'package:task07/presentation_layer/widgets/sizedBox.dart';
class DialogUtils{
  dialogBox(BuildContext context,String txt)  {
        return AlertDialog(
          title:Text(StringHelper.UPDATE),
          content: SingleChildScrollView(
            child: Column(
                  children: <Widget>[
                  Container(
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: Constants.control.updateController..text='$txt',
                      decoration: InputDecoration(
                        border: OutlineInputBorder()
                      ),
                    ),
                    SizeBoxWidget(),
                    Row(
                      children: [
                        SizedBox(
                          width: 100.0,
                          child: Center(
                            child: ElevatedButton(
                              onPressed: ()=> Navigator.pop(context),
                              child: Text(
                                StringHelper.CANCEL,
                              ),
                            ),
                          ),
                        ),
                         SizedBox(
                      width: 100.0,
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                          if(Constants.control.updateController.text.isNotEmpty){
                            Navigator.pop(context,Constants.control.updateController.text);
                            }
                          },
                          child: Text(
                            StringHelper.UPDATE,
                          ),
                        ),
                      ),
                    )
                      ],
                    )
                  ],
                ),
              ),
            ),
            ]
          )));

          }

}