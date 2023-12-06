
import 'package:flutter/material.dart';

extension FastHash on String {
  int fastHash() {
    var hash = 0xcbf29ce484222325;

    var i = 0;
    while (i < length) {
      final codeUnit = codeUnitAt(i++);
      hash ^= codeUnit >> 8;
      hash *= 0x100000001b3;
      hash ^= codeUnit & 0xFF;
      hash *= 0x100000001b3;
    }

    return hash;
  }
}

extension CodePointIcon on Icon {
  static Icon fromCodePoint(int codePoint) => Icon(IconData(codePoint));
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    if (hexString.length < 6) return const Color(0xFFBC3455);
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