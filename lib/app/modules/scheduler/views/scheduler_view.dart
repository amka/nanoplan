import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/scheduler_controller.dart';

class SchedulerView extends GetView<SchedulerController> {
  const SchedulerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => ListView.builder(
            itemCount: controller.teamMembers.length,
            itemBuilder: (BuildContext context, int index) {
              final item = controller.teamMembers[index];
              return ListTile(
                title: Row(
                  children: [
                    Text(item.firstName),
                    const SizedBox(width: 6),
                    (item.lastName != null)
                        ? Text(item.lastName!)
                        : const SizedBox.shrink(),
                  ],
                ),
                subtitle: Text(item.email),
                onTap: () {},
              );
            },
          ),
        ),
      ),
    );
  }
}
