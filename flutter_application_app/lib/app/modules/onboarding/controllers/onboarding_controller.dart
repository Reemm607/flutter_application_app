import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myblog/app/routes/routes.dart';

class OnboardingController extends GetxController {
  final storage = GetStorage();
  final pageController = PageController();
  var currentPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }
  //   // Default value to true if not set yet
  //   if (storage.read("is_displaying_onboarding") == null) {
  //     storage.write("is_displaying_onboarding", true);
  //   }
  //   if (storage.read("is_displaying_onboarding") == false) {
  //     Get.offAllNamed(Routes.SIGNIN);
  //   }
  // }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // pageController.dispose();
    super.onClose();
  }

  void finished() {
    storage.write("is_displaying_onboarding", false);
    // Get.offAllNamed(Routes.SIGNIN);
    if (storage.read("is_signin") == true) {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.offAllNamed(Routes.SIGNIN);
    }
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (pageController.page!.toInt() < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      finished(); //if it's the last page, finish onboarding
    }
  }
}
