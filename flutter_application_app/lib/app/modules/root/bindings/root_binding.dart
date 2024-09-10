import 'package:get/get.dart';
import 'package:myblog/app/modules/home/controllers/home_controller.dart';


import '../../auth/controllers/refresh_token.dart';
import '../../create_post/controllers/create_post_controller.dart';

import '../../profile/controllers/profile_controller.dart';
import '../controllers/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(
      () => RootController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
   
     Get.lazyPut<PostController>(
      () => PostController(),
    );
   
     Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
        Get.lazyPut<RefreshTokenController>(() => RefreshTokenController());

  }
}
