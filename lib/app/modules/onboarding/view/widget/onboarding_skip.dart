import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constans/sizes.dart';
import '../../controllers/onboarding_controller.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.find<OnboardingController>();
    return Positioned(
      top: 20,
      right: TSizes.defoultspace,
      child: TextButton(
        onPressed: controller.finished,
        child: Text('Skip'),
      ),
    );
  }
}
