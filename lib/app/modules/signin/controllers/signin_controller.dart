import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../data/services/auth.dart';

class SigninController extends GetxController {
  final AuthService authService = Get.find();

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwdController = TextEditingController();
  final loading = false.obs;

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

  Future signIn() async {
    final email = emailController.text;
    final password = passwdController.text;
    try {
      loading.value = true;
      await authService.signIn(email: email, password: password);
    } on AppwriteException catch (e) {
      Get.snackbar('Sign in failed', e.message ?? 'Unknown error');
    } catch (e) {
      log('Authentication failed: ${e.toString()}');
      Get.snackbar('Sign in failed', 'Unknown error');
    } finally {
      loading.value = false;
    }
  }
}
