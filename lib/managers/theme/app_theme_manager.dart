import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../gen/fonts.gen.dart';
import 'colors_manager.dart';

ThemeData appThemeManager() => ThemeData(
      fontFamily: FontFamily.mulish,
      cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(
            fontFamily: FontFamily.mulish,
          ),
        ),
      ),
      scaffoldBackgroundColor: ColorsManager.coreAppBackgroundLight1,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      colorScheme: ColorScheme(
        primary: ColorsManager.foundationMainPrimary,
        // focus Color: The most used color in the application
        onPrimary: ColorsManager.foundationMainWhite,
        // This color is used to color the elements on top of the primary color such as text, icons, etc.
        secondary: ColorsManager.foundationMainPrimary,
        // for less prominent elements like filter chips, toggle buttons, or background elements
        onSecondary: ColorsManager.foundationMainWhite,
        // on top of the secondary color such as text, icons, etc.
        error: ColorsManager.foundationAccentDanger,
        // for error messages or alerts, like a flashing red light to indicate a problem.
        onError: ColorsManager.foundationMainWhite,
        // on top of the error color
        surface: ColorsManager.foundationMainWhite,
        // Used as the base color for elevated UI elements like cards, sheets, dialogs, etc.
        onSurface: ColorsManager.coreAppContentPrimary,
        // the elements on top of the surface color.
        brightness: Brightness.light,
      ),
    );
