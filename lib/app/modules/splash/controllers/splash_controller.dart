import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myblog/app/routes/routes.dart';

class SplashController extends GetxController {
  final storage = GetStorage();

  // final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    // Future.delayed(const Duration(seconds: 3),(){
    //   Get.offAllNamed(Routes.ONBOARDING);
    // });
     Future.delayed(const Duration(seconds: 2), () {
      if (storage.read("is_displaying_onboarding") == false) {
        if (storage.read("is_signedin") == true) {
          Get.offAllNamed(Routes.ROOT);
        } else {
          Get.offAllNamed(Routes.PROFILE);
        }
      } else  {
        Get.offAllNamed(Routes.ONBOARDING);
      }
    });
  }

    
  

  @override
  void onClose() {
    super.onClose();
  }
}
  // void increment() => count.value++;

