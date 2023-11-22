import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {required this.controller,
        this.labelText,
        this.hintText,
        this.inputFormatter,
        this.keyboardType,
        this.icon,
        this.maxLines,
        Key? key})
      : super(key: key);

  String? labelText;
  String? hintText;
  List<TextInputFormatter>? inputFormatter;
  TextEditingController? controller;
  TextInputType? keyboardType;
  Icon? icon;
  int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      inputFormatters: inputFormatter,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        icon: icon,
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.black),
        hintStyle: const TextStyle(fontSize: 8),
      ),
    );
  }
}