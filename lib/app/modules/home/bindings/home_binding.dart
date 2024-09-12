import 'package:get/get.dart';
import '../../auth/controllers/refresh_token.dart';
import '../controllers/post_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.put(RefreshTokenController());
    // Get.lazyPut<ProfileController>(() =>
    //     ProfileController(HomeProvider(), profileProvider: ProfileProvider()));
    Get.put(HomeController());
    
  }
}

