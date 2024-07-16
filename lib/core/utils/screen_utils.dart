import 'dart:math';

import 'package:flutter/material.dart';
import 'package:space_explorer/core/init/extension/context_extension.dart';

class ScreenUtils {
  static double getRandomX(BuildContext context) {
    Random random = Random();
    double maxX = context.width;
    return random.nextDouble() * maxX;
  }

  static double getRandomY(BuildContext context) {
    Random random = Random();
    double maxY = context.height;
    return random.nextDouble() * maxY;
  }
}
