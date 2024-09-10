import 'package:get/get.dart';
import 'package:myblog/app/modules/create_post/controllers/create_post_controller.dart';
import 'package:myblog/app/modules/create_post/provider/create_post_provider.dart';
import 'package:myblog/app/modules/profile/provider/profile_provider.dart';

import '../../auth/controllers/refresh_token.dart';
import '../../home/controllers/post_controller.dart';
import '../../home/providers/post_provider.dart';
import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
 void dependencies() {
    print('ProfileBinding is being executed');
    Get.lazyPut<ProfileController>(() =>
        ProfileController(HomeProvider(), profileProvider: ProfileProvider()));
           Get.lazyPut<PostController>(
        () => PostController(postProvider: PostProvider()));
    Get.put(RefreshTokenController());
    Get.put(HomeController());
  }
}


