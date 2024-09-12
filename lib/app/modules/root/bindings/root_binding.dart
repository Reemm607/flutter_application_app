import 'package:get/get.dart';
import '../../auth/controllers/refresh_token.dart';
import '../../create_post/controllers/create_post_controller.dart';
import '../../create_post/provider/create_post_provider.dart';
import '../../home/controllers/post_controller.dart';
import '../../home/providers/post_provider.dart';
import '../../profile/controllers/profile_controller.dart';
import '../../profile/provider/profile_provider.dart';
import '../../profile/views/profile_view.dart';
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
Get.lazyPut<ProfileController>(() =>
        ProfileController(HomeProvider(), profileProvider: ProfileProvider()));
    Get.lazyPut<PostController>(
        () => PostController(postProvider: PostProvider()));
    Get.lazyPut<ProfilePage>(
      () => ProfilePage(),
    );

        Get.lazyPut<RefreshTokenController>(() => RefreshTokenController());

  }
}
