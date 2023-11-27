import 'dart:developer';

import 'package:appwrite/models.dart';
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
    authService.loadUser().then((User? user) {
      user != null ? Get.offAllNamed('/home') : Get.offAllNamed('/signin');
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
