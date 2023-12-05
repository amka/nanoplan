import 'package:get/get.dart';

import '../../../data/models/task.dart';
import '../../../data/services/storage/repository.dart';

class DetailsController extends GetxController {
  TaskRepository taskRepository = Get.find();

  final task = Rx<Task?>(null);

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
}
