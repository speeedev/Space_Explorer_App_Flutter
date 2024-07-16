import 'dart:math';

import 'package:flutter/material.dart';

class ColorUtils {
  static Color randomColor() {
    return Colors.primaries[Random().nextInt(17)];
  }
}