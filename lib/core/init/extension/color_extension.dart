import 'package:flutter/material.dart';
import 'package:space_explorer/core/constants/color/colors_constants.dart';


extension GradientColorsExtension on ColorScheme {
  LinearGradient get darkYellowToLightYellow => const LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [
      ColorConstants.darkYellow,
      ColorConstants.lightYellow,
    ],
  );
}