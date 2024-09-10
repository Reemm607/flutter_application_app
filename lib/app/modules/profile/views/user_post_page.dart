import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myblog/app/modules/home/models/post.dart';
import 'package:myblog/app/modules/home/views/home_view.dart';
import 'package:myblog/app/modules/profile/controllers/profile_controller.dart';

class UserPostsPage extends GetView<ProfileController> {
  const UserPostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('منشورات المستخدم')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: controller.posts.length,
          itemBuilder: (context, index) {
            Post post = controller.posts[index];
            return PostCard(post: post);
          },
        );
      }),
    );
  }
}