import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:keymap/keymap.dart';

import '../../../modules/details/views/details_view.dart';
import '../../../modules/details/controllers/details_controller.dart';
import '../../../modules/add_task/views/add_task_view.dart';
import '../../../modules/add_task/controllers/add_task_controller.dart';
import '../../../core/utils/extensions.dart';
import '../../../core/values/constants.dart';
import '../../../data/models/task.dart';
import '../../../widgets/icons.dart';
import '../controllers/home_controller.dart';
import '../widgets/add_card.dart';
import '../widgets/task_card.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardWidget(
      bindings: [
        KeyAction(LogicalKeyboardKey.keyN, 'Add task type', () {
          onAddCard(context);
        }, isShiftPressed: true),
        KeyAction(LogicalKeyboardKey.keyN, 'Add todo', () {
          onAddTodo();
        }),
      ],
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(4.0.wp),
                child: Text(
                  'My Lists',
                  style: TextStyle(
                    fontSize: 24.0.sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0.0.wp),
                child: Obx(
                  () => GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    crossAxisSpacing: 2.0.wp,
                    mainAxisSpacing: 2.0.wp,
                    padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                    physics: const ClampingScrollPhysics(),
                    children: [
                      ...controller.tasks
                          .map((task) => LongPressDraggable(
                                data: task,
                                onDragStarted: () =>
                                    controller.setDeleteState(true),
                                onDragCompleted: () =>
                                    controller.setDeleteState(false),
                                onDraggableCanceled: (_, __) =>
                                    controller.setDeleteState(false),
                                feedback: Opacity(
                                    opacity: 0.8,
                                    child: TaskCard(
                                      task: task,
                                      onTap: () {},
                                    )),
                                child: TaskCard(
                                    task: task, onTap: () => onTaskTap(task)),
                              ))
                          .toList(),
                      AddCard(
                        onTap: () {
                          onAddCard(context);
                          controller.editController.clear();
                          controller.chipIndex.value = 0;
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: DragTarget(
          builder: (context, data, rejectedData) {
            return Obx(
              () => Focus(
                child: Tooltip(
                  message: 'Add new task (N)',
                  waitDuration: Durations.short4,
                  child: FloatingActionButton(
                    onPressed: () {
                      if (controller.tasks.isEmpty) {
                        EasyLoading.showInfo('Create a task type');
                        return;
                      }
                      onAddTodo();
                    },
                    backgroundColor: controller.deleting.value
                        ? Colors.red
                        : Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    child: Icon(
                      controller.deleting.value
                          ? TablerIcons.trash_x
                          : TablerIcons.plus,
                    ),
                  ),
                ),
              ),
            );
          },
          onAccept: (Task task) {
            // TODO: Check for uncompleted todos before delete
            controller.deleteTask(task);
            EasyLoading.showSuccess('Task deleted');
          },
        ),
      ),
    );
  }

  void onAddTodo() {
    Get.to(
        () => GetBuilder(
              init: AddTaskController(),
              builder: (context) => AddTaskView(
                tasks: controller.tasks,
              ),
            ),
        transition: Transition.downToUp,
        duration: const Duration(milliseconds: 120));
  }

  void onAddCard(context) async {
    final icons = getIcons();
    await Get.defaultDialog(
      titlePadding: EdgeInsets.only(top: 3.0.wp, bottom: 3.0.wp),
      radius: kDefaultBorderRadius,
      title: 'Task Type',
      titleStyle: TextStyle(
        color: Theme.of(context).colorScheme.onBackground,
      ),
      content: Form(
        key: controller.formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
              child: TextFormField(
                controller: controller.editController,
                decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                    borderSide: BorderSide.none,
                  ),
                  isDense: true,
                ),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                autofocus: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Enter your task title';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0.wp),
              child: Wrap(
                spacing: 2.0.wp,
                runSpacing: 2.0.wp,
                children: icons
                    .map(
                      (e) => Obx(() {
                        final index = icons.indexOf(e);
                        return ChoiceChip(
                          label: e,
                          pressElevation: 0,
                          showCheckmark: false,
                          side: BorderSide.none,
                          selectedColor: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.3),
                          backgroundColor: Colors.transparent,
                          selected: controller.chipIndex.value == index,
                          onSelected: (selected) {
                            controller.chipIndex.value = selected ? index : 0;
                          },
                        );
                      }),
                    )
                    .toList(),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      final icon =
                          icons[controller.chipIndex.value].icon!.codePoint;
                      final color =
                          icons[controller.chipIndex.value].color!.hexColor();
                      var task = Task(
                          title: controller.editController.text.trim(),
                          icon: icon,
                          color: color,
                          todos: const []);
                      controller.addTask(task)
                          ? EasyLoading.showSuccess('Task added')
                          : EasyLoading.showError('Duplicated Task');
                      Get.back();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        kDefaultBorderRadius,
                      ),
                    ),
                    elevation: 0,
                  ),
                  child: const Text('Confirm'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  onTaskTap(Task task) {
    Get.to(
      () => GetBuilder(
        init: DetailsController(),
        builder: (_) => DetailsView(task: task),
      ),
    );
  }
}
