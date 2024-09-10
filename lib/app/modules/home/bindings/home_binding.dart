import 'package:get/get.dart';
import '../../auth/controllers/refresh_token.dart';
import '../../profile/controllers/profile_controller.dart';
import '../../profile/provider/profile_provider.dart';
import '../controllers/post_controller.dart';
import '../providers/post_provider.dart';

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

