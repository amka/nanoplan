import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

import 'package:get/get.dart';

import '../../../core/utils/extensions.dart';
import '../../../core/values/constants.dart';
import '../controllers/add_task_controller.dart';

class AddTaskView extends GetView<AddTaskController> {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(TablerIcons.x)),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: const Text('Done'),
                    ),
                  ],
                ),
              ),
              Text(
                'New Task',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0.sp,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              SizedBox(height: 2.0.hp),
              TextFormField(
                controller: controller.editController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                  ),
                  isDense: true,
                ),
                autofocus: true,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.0.hp),
                child: Text(
                  'Add to',
                  style: TextStyle(
                    fontSize: 12.0.sp,
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withAlpha(145),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
