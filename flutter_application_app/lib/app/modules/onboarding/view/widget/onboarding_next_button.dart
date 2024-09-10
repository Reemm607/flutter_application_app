import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../../utils/constans/sizes.dart';
import '../../../../utils/device/device_utilty.dart';
import '../../controllers/controllers.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.find<OnboardingController>();
    return Positioned(
      top: 320,
      right: TSizes.spaceBtwSections,
      bottom: TDeviceUtils.getBottomNavigationBarHight(),
      child: Center(
        child: InkWell(
           onTap: ()=> controller.nextPage(),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 150),
            // margin: EdgeInsets.all(80),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Color.fromARGB(255, 13, 103, 176),
            ),
            child: Text('Next', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
      
    );
  }
}
