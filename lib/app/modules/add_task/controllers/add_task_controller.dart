import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/services/storage/repository.dart';
import '../../../data/models/task.dart';

class AddTaskController extends GetxController {
  TaskRepository taskRepository = Get.find();

  final tasks = <Task>[].obs;
  final formKey = GlobalKey<FormState>();
  final editController = TextEditingController();
  final task = Rx<Task?>(null);

  @override
  void onInit() {
    super.onInit();

    if (tasks.isEmpty) {
      tasks.assignAll(taskRepository.readTasks());
    }
  }

  @override
  void onClose() {
    editController.dispose();
    super.onClose();
  }

  void changeTask(Task? task) {
    this.task.value = task;
  }

  bool addTodo({required Task task, required String todo}) {
    var todos = [];

    if (task.todos != null) {
      todos.assignAll(task.todos!.toList());
    }

    if (todos.contains(todo)) {
      return false;
    }

    todos.add(todo);
    final newTask = task.copyWith(todos: todos);
    final oldIndex = tasks.indexOf(task);
    tasks[oldIndex] = newTask;
    tasks.refresh();

    return true;
  }
}
