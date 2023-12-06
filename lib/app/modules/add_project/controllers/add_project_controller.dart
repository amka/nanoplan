import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/models/project.dart';
import '../../../data/services/project/service.dart';

class AddProjectController extends GetxController {
  ProjectService projectService = Get.find();

  final formKey = GlobalKey<FormState>();
  final editController = TextEditingController();
  String? color;
  int? icon;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<int> addProject(Project project) async {
    return await projectService.put(project);
  }
}
