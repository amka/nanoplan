import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';

import '../../../core/utils/extensions.dart';
import '../../../core/values/constants.dart';

class AddCard extends StatelessWidget {
  final Function()? onTap;

  const AddCard({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    var squareWith = Get.width - 12.0.wp;

    return SizedBox(
      width: squareWith / 2,
      height: squareWith / 2,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kDefaultBorderRadius),
        ),
        elevation: 0.5,
        child: InkWell(
          borderRadius: BorderRadius.circular(kDefaultBorderRadius),
          onTap: onTap,
          child: Center(
            child: Icon(
              TablerIcons.plus,
              size: 10.0.wp,
            ),
          ),
        ),
      ),
    );
  }
}
