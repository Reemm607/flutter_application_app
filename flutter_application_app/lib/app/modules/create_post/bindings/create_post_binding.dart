import 'package:get/get.dart';
import 'package:myblog/app/modules/create_post/controllers/create_post_controller.dart';
import 'package:myblog/app/modules/create_post/provider/create_post_provider.dart';

import '../../auth/controllers/refresh_token.dart';

class CreatePostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostController>(
        () => PostController());
        Get.lazyPut<PostProvider>(
        () => PostProvider());
    Get.lazyPut<RefreshTokenController>(() => RefreshTokenController());
  }
}
