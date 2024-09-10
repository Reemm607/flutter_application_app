import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myblog/app/modules/home/views/home_view.dart';
import 'package:myblog/app/modules/profile/controllers/profile_controller.dart';
import 'package:myblog/app/modules/profile/model/liked_posts.dart';

class SavedPostsPage extends GetView<ProfileController> {
  const SavedPostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // تأكد من أنك قد قمت بتسجيل الـ controller في Get.put أو Get.lazyPut
    return Scaffold(
      //appBar: AppBar(title: const Text('المنشورات المحفوظة')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: controller.savedPosts.length,
          itemBuilder: (context, index) {
            LikePost post = controller.savedPosts[index];
            return LikePostCard(post: post);
          },
        );
      }),
    );
  }
}