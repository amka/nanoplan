import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../data/services/auth.dart';
import '../../../routes/app_pages.dart';

class SignupController extends GetxController {
  final AuthService authService;

  SignupController({required this.authService});

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

  void onSignUp() async {
    if (formKey.currentState!.validate()) {
      try {
        loading.value = true;
        await authService.signUp(
            email: emailController.text.trim(),
            password: passwordController.text.trim());

        Get.offAllNamed(Routes.HOME);

      } on AppwriteException catch (e) {
        log('SignUp failed: ${e.toString()}');
        EasyLoading.showError(e.message ?? 'Failed to sign up');
      } catch (e) {
        log('SignUp failed: ${e.toString()}');
        EasyLoading.showError('Failed to sign up');
      } finally {
        loading.value = false;
      }
    }
  }
}
