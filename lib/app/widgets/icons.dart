import 'package:flutter/cupertino.dart';

import '../core/utils/extensions.dart';
import '../core/values/colors.dart';
import '../core/values/icons.dart';

List<Icon> getIcons() => [
      CodePointIcon.withColor(codePoint: personIcon, color: purple),
      CodePointIcon.withColor(codePoint: workIcon, color: pink),
      CodePointIcon.withColor(codePoint: movieIcon, color: green),
      CodePointIcon.withColor(codePoint: sportIcon, color: yellow),
      CodePointIcon.withColor(codePoint: travelIcon, color: deepPink),
      CodePointIcon.withColor(codePoint: shopIcon, color: lightBlue),
    ];
