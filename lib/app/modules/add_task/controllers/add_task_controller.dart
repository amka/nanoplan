import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/services/storage/repository.dart';
import '../../../data/models/task.dart';

class AddTaskController extends GetxController {
  TaskRepository taskRepository = Get.find();

  final tasks = <Task>[].obs;
  final formKey = GlobalKey<FormState>();
  final editController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    tasks.assignAll(taskRepository.readTasks());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
