import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

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
    return Scaffold(
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
                        .map((task) => TaskCard(
                              task: task,
                              onTap: () {},
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
    );
  }

  void onAddCard(context) async {
    final icons = getIcons();
    await Get.defaultDialog(
      titlePadding: EdgeInsets.symmetric(vertical: 5.0.wp),
      radius: kDefaultBorderRadius,
      title: 'Task Type',
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
}
