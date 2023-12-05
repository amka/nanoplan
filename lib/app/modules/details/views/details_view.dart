import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

import 'package:get/get.dart';

import '../../../core/utils/extensions.dart';
import '../../../data/models/task.dart';
import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  DetailsView({super.key, Task? task}) {
    if (task != null) {
      controller.task.value = task;
    }
  }

  @override
  Widget build(BuildContext context) {
    final task = controller.task.value!;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.0.hp),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(TablerIcons.chevron_left),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                CodePointIcon.withColor(
                  codePoint: task.icon,
                  color: HexColor.fromHex(task.color),
                ),
                SizedBox(width: 2.0.wp),
                Text(
                  task.title,
                  style: TextStyle(
                      fontSize: 14.0.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
