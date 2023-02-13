// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:task07/helper/const/dimension.dart';

class TextFieldWidget extends StatefulWidget {
  TextFieldWidget({
    super.key,
    this.hintText,
    required this.textEditingController,
    required this.validator,
    required this.type
    });
  String? hintText;
  TextEditingController textEditingController;
  final String? Function(String? val) validator;
  TextInputType type;
  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.type,
      controller: widget.textEditingController,
      validator: widget.validator,
      decoration: InputDecoration(
        border:  const OutlineInputBorder(
          borderRadius:BorderRadius.all(Radius.circular(Dimensions.RADIUS_SMALL))
        ),
        labelText: widget.hintText
        ),
    );
  }
}