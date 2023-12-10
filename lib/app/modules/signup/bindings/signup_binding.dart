import 'package:get/get.dart';

import '../../../data/services/auth.dart';
import '../controllers/signup_controller.dart';

class SignupBinding extends Bindings {
  final AuthService authService = Get.find();

  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
          () =>
          SignupController(
              authService: authService
          ),
    );
  }
}
