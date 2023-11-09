import 'package:flutter/material.dart';
import 'package:waveline/app/theme/color.dart';

import 'font.dart';

ThemeData theme = ThemeData(
  scaffoldBackgroundColor: whiteColor,
  appBarTheme:  AppBarTheme(
    backgroundColor: whiteColor,
    elevation: 0,
    foregroundColor: font,
    titleTextStyle: h3Bold,
    centerTitle: false,
  ),
  indicatorColor: primary,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: primary,
    secondary: accentColor,
    error: errorColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: placeholder.copyWith(
      color: greyColor,
    ),
    border: InputBorder.none,
    outlineBorder: const BorderSide(
      color: greyColor,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: greyColor,
      ),
    ),
    focusColor: font,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: font,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: greyColor,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: errorColor,
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      disabledBackgroundColor: inactiveColorButton,
      disabledForegroundColor: whiteColor,
      elevation: 0,
      backgroundColor: primary,
      foregroundColor: whiteColor,
      textStyle: h4Bold,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
);
