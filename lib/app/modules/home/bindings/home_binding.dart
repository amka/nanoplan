import 'package:get/get.dart';

import '../../../data/services/auth.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  final AuthService authService = Get.find();

  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(authService: authService),
    );
  }
}
