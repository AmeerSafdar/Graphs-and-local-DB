// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  TextFieldWidget({
    super.key,required this.hintText,
    required this.textEditingController,
    required this.validator,
    required this.type
    });
  String hintText;
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
               labelText: widget.hintText),
    );
  }
}