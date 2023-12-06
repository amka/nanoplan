
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
