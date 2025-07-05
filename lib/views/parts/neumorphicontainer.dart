 import 'package:flutter/material.dart';
import 'package:shouryapandey/constants.dart';

AnimatedContainer neomorphiContainer(
    double width,
    double height,
    Widget? child,
  ) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        shape: BoxShape.circle,
        boxShadow: neumorphicBoxShadow,
      ),
      child: ClipRRect(borderRadius: BorderRadius.circular(30), child: child),
    );
  }