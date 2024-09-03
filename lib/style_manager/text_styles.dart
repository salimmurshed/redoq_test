import 'package:flutter/material.dart';

class TextStyles {
  TextStyles._();

  static InputDecoration inputBorder = const InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xff6b6868), width: 1.0),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xff6b6868), width: 1.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xff6b6868), width: 1.0),
    ),
  );
}
