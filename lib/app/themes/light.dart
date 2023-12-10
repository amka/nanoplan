import 'package:flutter/material.dart';

const textColor = Color(0xFF050a0a);
const backgroundColor = Color(0xFFf5fafa);
const primaryColor = Color(0xFF55b4ae);
const primaryFgColor = Color(0xFF050a0a);
const secondaryColor = Color(0xFFa6c3d9);
const secondaryFgColor = Color(0xFF050a0a);
const accentColor = Color(0xFFa7b8dc);
const accentFgColor = Color(0xFF050a0a);

const lightScheme = ColorScheme(
  brightness: Brightness.light,
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
  error: Brightness.light == Brightness.light ? Color(0xffB3261E) : Color(0xffF2B8B5),
  onError: Brightness.light == Brightness.light ? Color(0xffFFFFFF) : Color(0xff601410),
);