import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/onboarding_controller.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.find<OnboardingController>();
    return TextButton(
      onPressed: controller.finished,
      child: const Text('Skip'),
    );
  }
}