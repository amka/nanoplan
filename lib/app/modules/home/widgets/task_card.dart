import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/extensions.dart';
import '../../../core/values/constants.dart';
import '../../../data/models/task.dart';

class TaskCard extends StatelessWidget {
  final Function()? onTap;
  final Task task;

  const TaskCard({super.key, required this.task, this.onTap});

  @override
  Widget build(BuildContext context) {
    var squareWith = Get.width - 12.0.wp;
    final color = HexColor.fromHex(task.color);
    final icon = IconData(task.icon,
        fontFamily: 'tabler-icons', fontPackage: "flutter_tabler_icons");

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
          child: Padding(
            padding: EdgeInsets.all(5.0.wp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(icon, color: color, size: 24.0.sp),
                    CircularProgressIndicator(
                      color: HexColor.fromHex(task.color),
                      value: Random().nextInt(100) / 100,
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  task.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0.sp,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                SizedBox(height: 1.0.wp),
                Text(
                  '${task.todos?.length ?? 0} todos',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10.0.sp,
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withAlpha(145),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
