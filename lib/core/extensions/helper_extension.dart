import 'package:flutter/material.dart';

//helper extension
extension HelperExtension on BuildContext {
  //device height
  double get height => MediaQuery.of(this).size.height;

  //device width
  double get width => MediaQuery.of(this).size.width;

  //primary color extension getter
  Color get primaryColor => Theme.of(this).primaryColor;

  //texttheme
  TextTheme get textTheme => Theme.of(this).textTheme;
}
