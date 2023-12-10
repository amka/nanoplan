import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../data/services/auth.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final AuthService authService = Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    loadUser().then((_) {
      log('onLoadUser: ${authService.status.value}');
      authService.status.value == AuthStatus.authenticated
          ? Get.offAllNamed(Routes.HOME)
          : Get.offAllNamed(Routes.SIGNIN);
    }).catchError((e) {
      EasyLoading.showError('Failed to start');
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future loadUser() async {
    if (authService.status.value == AuthStatus.uninitialized) {
      await authService.loadUser();
    }
  }
}
