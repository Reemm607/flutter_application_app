import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../../utils/constans/sizes.dart';
import '../../../../utils/device/device_utilty.dart';
import '../../controllers/controllers.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.find<OnboardingController>();
    return Center(
      child: InkWell(
        onTap: () => controller.nextPage(),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 150),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color.fromARGB(255, 13, 103, 176),
          ),
          child: const Text('Next', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
