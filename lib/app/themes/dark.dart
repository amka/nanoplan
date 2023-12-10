import 'package:flutter/material.dart';

const textColor = Color(0xFFf5fafa);
const backgroundColor = Color(0xFF050a0a);
const primaryColor = Color(0xFF4baaa4);
const primaryFgColor = Color(0xFF050a0a);
const secondaryColor = Color(0xFF264359);
const secondaryFgColor = Color(0xFFf5fafa);
const accentColor = Color(0xFF233458);
const accentFgColor = Color(0xFFf5fafa);

const darkScheme = ColorScheme(
  brightness: Brightness.dark,
  background: backgroundColor,
  onBackground: textColor,
  primary: primaryColor,
  onPrimary: primaryFgColor,
  secondary: secondaryColor,
  onSecondary: secondaryFgColor,
  tertiary: accentColor,
  onTertiary: accentFgColor,
  surface: backgroundColor,
  onSurface: textColor,
  error: Brightness.dark == Brightness.light ? Color(0xffB3261E) : Color(0xffF2B8B5),
  onError: Brightness.dark == Brightness.light ? Color(0xffFFFFFF) : Color(0xff601410),
);