import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GradientText(
          'NanoPlan',
          style: const TextStyle(fontSize: 48),
          colors: [
            Colors.deepPurple.shade700,
            Colors.teal.shade700,
          ],
        ),
      ),
    );
  }
}
