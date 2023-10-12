import 'package:flutter/material.dart';

class EventRowTheme {
  final double height;
  final Color fillColor;
  final TextStyle? labelStyle;
  final double startRadius;
  final double endRadius;

  EventRowTheme({
    this.height = 50.0,
    Color? fillColor,
    this.labelStyle,
    this.startRadius = 8.0,
    this.endRadius = 8.0,
  }) : fillColor = fillColor ?? Colors.greenAccent.shade700;
}
