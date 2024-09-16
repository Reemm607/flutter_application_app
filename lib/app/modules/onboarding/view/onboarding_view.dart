import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myblog/app/modules/onboarding/view/widget/onboarding_dot_Nagation.dart';
import 'package:myblog/app/modules/onboarding/view/widget/onboarding_next_button.dart';
import 'package:myblog/app/modules/onboarding/view/widget/onboarding_page.dart';
import 'package:myblog/app/modules/onboarding/view/widget/onboarding_skip.dart';
import 'package:myblog/app/utils/constans/image_strings.dart';
import 'package:myblog/app/utils/constans/text_string.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          // Horizontal Scrollable page
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.onPageChanged,
            children: [
              OnboardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              OnboardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              OnboardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),
           /// Skip Button

       Positioned(
  top: screenSize.height * 0.05,
  right: screenSize.width * 0.05,
  child:  const OnBoardingSkip(),
           ),

          /// Dot Navigation smoothPageIndicator
          Positioned(
  bottom: screenSize.height * 0.3,
  left: screenSize.width * 0.34,
  child:  const OnBoardingDotNagation(),
   ),
    
          /// Circular Button
            Positioned(
  bottom: screenSize.height * 0.20,
  right: screenSize.width * 0.09 ,
  child:  const OnBoardingNextButton(),
   ),
          
        ],
      ),
    );
  }
}
