import 'package:get/get.dart';
import 'package:myblog/app/modules/home/controllers/home_controller.dart';

import '../../auth/controllers/refresh_token.dart';
import '../../root/controllers/root_controller.dart';
import '../providers/all_posts_provider.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
  Get.lazyPut<HomeController>(
      () => HomeController(),
    );
     Get.lazyPut<RootController>(
      () => RootController(),
    );
    // Get.lazyPut<AllPostsController>(() => AllPostsController());
        Get.lazyPut<AllPostsProvider>(() => AllPostsProvider());

            Get.lazyPut(() => RefreshTokenController());


  }
}
