import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:myblog/app/utils/constans/color.dart';
import 'package:myblog/app/utils/constans/sizes.dart';
import 'package:myblog/app/utils/device/device_utilty.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../controllers/onboarding_controller.dart';



class OnBoardingDotNagation extends StatelessWidget {
  const OnBoardingDotNagation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.find<OnboardingController>();
    return Positioned(
        top: 480,
        bottom: TDeviceUtils.getBottomNavigationBarHight() * 1,
        left: TSizes.spaceBtwItems,
        right: 0,
        child: Center(
          child: SmoothPageIndicator(
            count: 3,
            controller: controller.pageController,
            onDotClicked: (index){
              controller.pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve:Curves.easeInOut);

              controller.onPageChanged(3);
            },
            
            effect: const ExpandingDotsEffect(
                activeDotColor: TColors.dark, dotHeight: 6),
          ),
        ));
  }
}

// class OnBoardingController {
// }



 