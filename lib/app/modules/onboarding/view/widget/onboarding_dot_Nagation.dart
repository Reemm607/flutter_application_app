import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../controllers/onboarding_controller.dart';



class OnBoardingDotNagation extends StatelessWidget {
  const OnBoardingDotNagation({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.find<OnboardingController>();

    return Center(
      child: SmoothPageIndicator(
        count: 3,
        controller: controller.pageController,
        onDotClicked: (index) {
          controller.pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
          controller.onPageChanged(3);
        },
        effect: const ExpandingDotsEffect(
          activeDotColor: Color.fromARGB(255, 13, 103, 176),
          dotHeight: 6,
        ),
      ),
    );
  }
}



 