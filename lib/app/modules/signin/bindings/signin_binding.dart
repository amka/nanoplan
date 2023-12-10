import 'package:get/get.dart';

import '../../../data/services/auth.dart';
import '../controllers/signin_controller.dart';

class SigninBinding extends Bindings {
  final AuthService authService = Get.find();

  @override
  void dependencies() {
    Get.lazyPut<SigninController>(
      () => SigninController(authService: authService),
    );
  }
}
