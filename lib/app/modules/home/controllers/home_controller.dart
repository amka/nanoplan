import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/models/task.dart';
import '../../../data/services/storage/repository.dart';

class HomeController extends GetxController {
  TaskRepository taskRepository;

  HomeController({required this.taskRepository});

  final tasks = <Task>[].obs;
  final formKey = GlobalKey<FormState>();
  final editController = TextEditingController();
  final chipIndex = 0.obs;
  final deleting = false.obs;

  @override
  void onInit() {
    super.onInit();

    tasks.assignAll(taskRepository.readTasks());
    ever(tasks, (_) => taskRepository.writeTasks(tasks));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    editController.dispose();
    super.onClose();
  }

  void changeChipIndex(int index) => chipIndex.value = index;

  bool addTask(Task task) {
    if (tasks.contains(task)) {
      return false;
    }
    tasks.add(task);
    return true;
  }

  void setDeleteState(bool state) => deleting.value = state;

  void deleteTask(Task task) {
    tasks.remove(task);
  }
}
