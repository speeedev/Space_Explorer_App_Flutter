import 'package:flutter/material.dart';
import 'package:space_explorer/core/constants/color/colors_constants.dart';
import 'package:space_explorer/core/utils/scale_size.dart';

class MyTheme {
  static ThemeData themeData(context) {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: ColorConstants.darkYellow,
        onPrimary: ColorConstants.white,
        surface: ColorConstants.white,
        onSurface: ColorConstants.grey,
        surfaceVariant: ColorConstants.bilobaFlower,
        onSurfaceVariant: ColorConstants.persianIndigo,
        background: ColorConstants.white,
        onBackground: ColorConstants.grey,
      ),
      textTheme: Theme.of(context).textTheme.apply(
            fontSizeFactor: ScaleSize.textScaleFactor(context),
          ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
      ),
    );
  }
}
