// ignore_for_file: prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace, unnecessary_string_interpolations, unused_local_variable, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:task07/helper/const/dimension.dart';
import 'package:task07/helper/const/screen_percentage.dart';
import 'package:task07/helper/const/stringHelper.dart';
import 'package:task07/presentation_layer/widgets/input_fields.dart';
import 'package:task07/presentation_layer/widgets/sizedBox.dart';
import 'package:task07/helper/extension/validation_helper.dart';
import 'package:task07/presentation_layer/widgets/text_widget.dart';
class DialogUtils{
  TextEditingController updateController = TextEditingController();

  dialogBox(BuildContext context,String txt)  {
       Size size=MediaQuery.of(context).size;
        return AlertDialog(
          title:Text(StringHelper.UPDATE),
          content: SingleChildScrollView(
            child: Column(
            children: <Widget>[
             Container(
              height: size.height * ScreenPercentage.SCREEN_SIZE_20,
              child: Padding(
                padding:  EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFieldWidget(
                       textEditingController: updateController..text='$txt',
                       validator:(val) => '$val'.isRequired()? null:StringHelper.REQ_FIELD,
                        type: TextInputType.name,
                        ),
                       
                    SizeBoxWidget(),
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * ScreenPercentage.SCREEN_SIZE_25,
                          child: Center(
                            child: ElevatedButton(
                              onPressed: ()=> Navigator.pop(context),
                              child: TextWidget(
                                txt:StringHelper.CANCEL,
                              ),
                            ),
                          ),
                        ),
                      SizedBox(
                       width: size.width * ScreenPercentage.SCREEN_SIZE_30,
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                          if(updateController.text.isNotEmpty){
                            Navigator.pop(context,updateController.text);
                            }
                          },
                          child: TextWidget(
                            txt:StringHelper.UPDATE,
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