import 'package:flutter/material.dart';


import '../../../../utils/constans/sizes.dart';
import '../../controllers/onboarding_controller.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
    top:20,
    right:TSizes.defoultspace,
    child: TextButton(
    onPressed: () => OnboardingController(),
       child: const Text('Skip'),
       ),
       );
  }
}