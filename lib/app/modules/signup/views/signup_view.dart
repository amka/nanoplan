import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/entry.dart';
import '../../../widgets/primary_button.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 64,
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 360),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GradientText(
                            'Sign Up'.tr,
                            style: const TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              // color: Theme.of(context).colorScheme.onBackground,
                            ),
                            colors: [
                              Colors.deepPurple.shade700,
                              Colors.teal,
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 32),
                            child: Text(
                              'Enter your email and password to get into NanoPlan'
                                  .tr,
                              style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 24),
                            child: Obx(
                              () => Entry(
                                controller: controller.emailController,
                                label: 'Email'.tr,
                                autofocus: true,
                                enabled: !controller.loading.value,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Email is required'.tr;
                                  }
                                  if (!value.trim().isEmail) {
                                    return 'Valid email is required'.tr;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 24),
                            child: Obx(
                              () => Entry(
                                controller: controller.passwordController,
                                label: 'Password'.tr,
                                obscureText: true,
                                enabled: !controller.loading.value,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Password is required'.tr;
                                  }
                                  if (value.trim().length < 8) {
                                    return 'At least 8 symbols is required'.tr;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Obx(
                              () => PrimaryButton(
                                label: 'Register'.tr,
                                onPressed: !controller.loading.value
                                    ? controller.onSignUp
                                    : null,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Need an account? '.tr,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => Get.offNamed(Routes.SIGNIN),
                        child: Text(
                          'Sign up here'.tr,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
