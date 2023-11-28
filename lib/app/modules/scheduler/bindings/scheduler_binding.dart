import 'package:get/get.dart';

import '../controllers/scheduler_controller.dart';

class SchedulerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SchedulerController>(
      () => SchedulerController(),
    );
  }
}
