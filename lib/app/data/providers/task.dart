import 'dart:convert';

import 'package:get/get.dart';
import 'package:nanoplan/app/core/utils/keys.dart';

import '../models/task.dart';
import '../services/storage/service.dart';

class TaskProvider {
  final StorageService _storage = Get.find();

  List<Task> readTasks() {
    var taskList = <Task>[];
    jsonDecode(_storage.read(taskKey).toString())
        .forEach((e) => taskList.add(Task.fromJson(e)));

    return taskList;
  }

  void writeTasks(List<Task> tasks) {
    _storage.write(taskKey, jsonEncode(tasks));
  }
}
