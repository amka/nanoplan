import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

import 'package:get/get.dart';

import '../../../core/utils/extensions.dart';
import '../../../core/values/constants.dart';
import '../../../data/models/task.dart';
import '../controllers/add_task_controller.dart';

class AddTaskView extends GetView<AddTaskController> {
  AddTaskView({super.key, List<Task>? tasks}) {
    if (tasks != null) {
      controller.tasks.value = tasks;
    }
  }

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
                      onPressed: () => onSave(context),
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 12.0.sp,
                        ),
                      ),
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
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Task should have a name';
                  }
                  return null;
                },
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
              ...controller.tasks
                  .map(
                    (task) => Obx(
                      () => InkWell(
                        onTap: () {
                          controller.changeTask(task);
                        },
                        borderRadius:
                            BorderRadius.circular(kDefaultBorderRadius),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 2.0.hp,
                            horizontal: 2.0.wp,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                IconData(task.icon,
                                    fontFamily: 'tabler-icons',
                                    fontPackage: "flutter_tabler_icons"),
                                color: HexColor.fromHex(task.color),
                              ),
                              SizedBox(width: 2.0.wp),
                              Text(
                                task.title,
                                style: TextStyle(
                                  fontSize: 12.0.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                              ),
                              const Spacer(),
                              controller.task.value == task
                                  ? Icon(
                                      TablerIcons.check,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    )
                                  : const SizedBox.shrink()
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList()
            ],
          ),
        ),
      ),
    );
  }

  void onSave(BuildContext context) {
    if (controller.formKey.currentState!.validate()) {
      if (controller.task.value == null) {
        EasyLoading.showError('Please select task type');
      } else {
        var success = controller.addTodo(
          task: controller.task.value!,
          todo: controller.editController.text.trim(),
        );
        if (success) {
          EasyLoading.showSuccess('Todo added');
          Get.back();
        } else {
          EasyLoading.showError('Todo item already exist');
        }
      }
    }
  }
}
