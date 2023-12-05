import 'package:flutter/cupertino.dart';

import '../core/values/colors.dart';
import '../core/values/icons.dart';

List<Icon> getIcons() => [
      Icon(IconData(personIcon, fontFamily: 'tabler-icons', fontPackage: "flutter_tabler_icons"), color: purple),
      Icon(IconData(workIcon, fontFamily: 'tabler-icons', fontPackage: "flutter_tabler_icons"), color: pink),
      Icon(IconData(movieIcon, fontFamily: 'tabler-icons', fontPackage: "flutter_tabler_icons"), color: green),
      Icon(IconData(sportIcon, fontFamily: 'tabler-icons', fontPackage: "flutter_tabler_icons"), color: yellow),
      Icon(IconData(travelIcon, fontFamily: 'tabler-icons', fontPackage: "flutter_tabler_icons"), color: deepPink),
      Icon(IconData(shopIcon, fontFamily: 'tabler-icons', fontPackage: "flutter_tabler_icons"), color: lightBlue),
    ];
