import 'package:get/get.dart';

import '../../../data/models/project.dart';
import '../../../data/services/project/service.dart';

class HomeController extends GetxController {
  ProjectService projectService = Get.find();

  final projects = <Project>[].obs;

  @override
  void onInit() {
    super.onInit();

    projectService.getAll().then((value) => projects.assignAll(value));
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
