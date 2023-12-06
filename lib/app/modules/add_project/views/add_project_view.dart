import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:nanoplan/app/core/extensions.dart';

import '../../../data/models/project.dart';
import '../../../routes/app_pages.dart';
import '../controllers/add_project_controller.dart';

class AddProjectView extends GetView<AddProjectController> {
  AddProjectView({Key? key}) : super(key: key);

  final colors = [
    '5F33e1',
    'fFE5A4',
    'F778BA',
    'EBE4FF',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Project'.tr),
      ),
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            children: [
              Row(
                children: [
                  Container(
                    height: 32,
                    width: 32,
                    color: Theme.of(context).colorScheme.surface,
                    child: MaterialButton(
                      onPressed: () {
                        Get.defaultDialog();
                      },
                      child: Icon(
                        TablerIcons.color_picker,
                        color: controller.color != null
                            ? HexColor.fromHex(controller.color!)
                            : Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: controller.editController,
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        isDense: true,
                      ),
                      autofocus: true,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Project needs a title'.tr;
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  onPressed: onAddProject,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Theme.of(context).colorScheme.primary,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  elevation: 0,
                  child: Text(
                    "Confirm".tr,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onAddProject() async {
    if (controller.formKey.currentState!.validate()) {
      final project = Project(
        title: controller.editController.text.trim(),
      );

      try {
        await controller.addProject(project);
        Get.offAllNamed(Routes.HOME);
      } catch (e) {
        EasyLoading.showError('Failed to add project'.tr);
      }
    }
  }
}
