import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/colors.dart' as colors;

extension PercentSized on double {
  double get hp => (Get.height * this / 100);

  double get wp => (Get.width * this / 100);
}

extension ResponsiveText on double {
  double get sp => Get.width / 100 * (this / 3);
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    if (hexString.length < 6) return colors.purple;
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write(hexString);
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String hexColor({bool leadingHashSign = true}) {
    return '${leadingHashSign ? '#' : ''}'
        '${alpha.toRadixString(16).padLeft(2, '0')}'
        '${red.toRadixString(16).padLeft(2, '0')}'
        '${green.toRadixString(16).padLeft(2, '0')}'
        '${blue.toRadixString(16).padLeft(2, '0')}';
  }
}

extension CodePointIcon on Icon {
  static Icon withColor({required int codePoint, Color? color}) {
    return Icon(
      IconData(
        codePoint,
        fontFamily: 'tabler-icons',
        fontPackage: "flutter_tabler_icons",
      ),
      color: color,
    );
  }
}
