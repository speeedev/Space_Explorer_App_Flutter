import 'package:flutter/material.dart';
import 'dart:math';

class ScaleSize {
  static double textScaleFactor(BuildContext context, {double maxTextScaleFactor = 2}) {
    var width = MediaQuery.of(context).size.width;
    double val = (width / 1300) * maxTextScaleFactor;
    return max(1.2, min(val, maxTextScaleFactor));
  }
}
