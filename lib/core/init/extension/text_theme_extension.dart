import 'package:flutter/material.dart';
import 'package:space_explorer/core/constants/color/colors_constants.dart';

extension TextThemeExtension on TextTheme {
  TextStyle get h1 => displayLarge!
      .copyWith(fontWeight: FontWeight.w900, color: const Color.fromRGBO(255, 255, 255, 1));
  TextStyle get h2 => displayMedium!
      .copyWith(fontWeight: FontWeight.w900, color: ColorConstants.rhino);
  TextStyle get h3 => headlineLarge!
      .copyWith(fontWeight: FontWeight.w800, color: ColorConstants.rhino);
  TextStyle get h4 => headlineSmall!
      .copyWith(fontWeight: FontWeight.normal, color: ColorConstants.grey);
  TextStyle get h5 => bodyLarge!
      .copyWith(fontWeight: FontWeight.normal, color: ColorConstants.grey);
  TextStyle get h6 => bodyMedium!
      .copyWith(fontWeight: FontWeight.normal, color: ColorConstants.grey);
}
