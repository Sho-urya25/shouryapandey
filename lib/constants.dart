import 'package:flutter/material.dart';

List<BoxShadow> neumorphicBoxShadow = [
  BoxShadow(
    color: Colors.grey[500]!,
    offset: Offset(4.0, 4.0),
    blurRadius: 15.0,
    spreadRadius: 1.0,
  ),
  BoxShadow(
    color: Colors.white,
    offset: Offset(-4.0, -4.0),
    blurRadius: 15.0,
    spreadRadius: 1.0,
  ),
];
List<BoxShadow> neumorphicBoxShadowHover = [
  BoxShadow(
    color: Colors.grey[500]!,
    offset: Offset(2.0, 2.0),
    blurRadius: 15.0,
    spreadRadius: 1.0,
  ),
  BoxShadow(
    color: Colors.white,
    offset: Offset(-2.0, -2.0),
    blurRadius: 15.0,
    spreadRadius: 1.0,
  ),
];

Color neumorphicColor = Colors.grey[300]!;