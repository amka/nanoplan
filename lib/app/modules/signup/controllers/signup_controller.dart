import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/services/auth.dart';

class SignupController extends GetxController {
  final AuthService authService = Get.find();

  var formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwdController = TextEditingController();
  final loading = false.obs;

  final count = 0.obs;
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

  Future signUp() async {
    final email = emailController.text;
    final password = passwdController.text;
    try {
      loading.value = true;
      await authService.signUp(email: email, password: password);
      Get.offAllNamed('/home');
      
    } on AppwriteException catch (e) {
      Get.snackbar('Sign up failed', e.message ?? 'Unknown error');
    } catch (e) {
      log('Registration failed: ${e.toString()}');
      Get.snackbar('Sign up failed', 'Unknown error');
    } finally {
      loading.value = false;
    }
  }
}
