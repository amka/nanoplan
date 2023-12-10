import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../data/services/auth.dart';
import '../../../routes/app_pages.dart';

class SigninController extends GetxController {
  final AuthService authService;

  SigninController({required this.authService});

  final loading = false.obs;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void onSingIn() async {
    if (formKey.currentState!.validate()) {
      try {
        loading.value = true;
        await authService.signIn(
            email: emailController.text.trim(),
            password: passwordController.text.trim());

        Get.offAllNamed(Routes.HOME);
      } on AppwriteException catch (e) {
        log('SignIn failed: ${e.toString()}');
        EasyLoading.showError(
          e.message ?? 'Failed to sign in',
          duration: const Duration(seconds: 3),
        );
      } catch (e) {
        log('SignIn failed: ${e.toString()}');
        EasyLoading.showError('Failed to sign in');
      } finally {
        loading.value = false;
      }
    }
  }
}
