import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myblog/app/modules/profile/controllers/profile_controller.dart';

class FollowersListPage extends GetView<ProfileController> {
  const FollowersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The follower'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.followingProfiles.isEmpty) {
          return const Center(child: Text('لا يوجد متابعون.'));
        }

        return ListView.builder(
          itemCount: controller.followingProfiles.length,
          itemBuilder: (context, index) {
            final follower = controller.followingProfiles[index];

            return ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              title: Text(follower?.username ?? 'Unknown User'),
              subtitle: Text(follower?.name ?? 'No Name'),
              onTap: () {
                if (follower != null) {
                }
              },
            );
          },
        );
      }),
    );
  }
}

            