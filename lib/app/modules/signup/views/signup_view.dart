import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/button.dart';
import '../../../widgets/textfield.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 32, bottom: 24),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 32,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 360),
                    child: APTextField(
                      controller: controller.emailController,
                      autofocus: true,
                      keyboardType: TextInputType.emailAddress,
                      hintText: 'email@nanoplan.app',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email required';
                        }
                        if (!GetUtils.isEmail(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 360),
                    child: APTextField(
                      controller: controller.passwdController,
                      obscureText: true,
                      hintText: 'Password',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password required';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 360),
                    child: Obx(
                      () => APButton(
                        text: 'Sign Up',
                        onTap: controller.loading.value
                            ? null
                            : () {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  controller.signUp();
                                }
                              },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 360),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Get.toNamed('/signin'),
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
