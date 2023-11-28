import 'dart:developer';

import 'package:get/get.dart';

import '../../../data/services/auth.dart';

class SplashController extends GetxController {
  final AuthService authService = Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    log('AuthStatus: ${authService.status.value}');
    authService.status.value == AuthStatus.authenticated
        ? Get.offAllNamed('/home')
        : Get.offAllNamed('/signin');
  }

  @override
  void onClose() {
    super.onClose();
  }
}
