 import 'package:flutter/material.dart';

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
        boxShadow: [
          BoxShadow(
            color: Colors.grey[500]!,
            offset: Offset(4.0, 4.0),
            blurRadius: 15.0,
            spreadRadius: 1.0,
          ), // BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: Offset(-4.0, -4.0),
            blurRadius: 15.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: ClipRRect(borderRadius: BorderRadius.circular(30), child: child),
    );
  }