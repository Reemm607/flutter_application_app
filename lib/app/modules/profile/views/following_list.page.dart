import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myblog/app/modules/profile/controllers/profile_controller.dart';

class FollowingListPage extends GetView<ProfileController> {
  const FollowingListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Following'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.followersProfiles.isEmpty) {  // Use followedProfiles instead of followingProfiles
          return const Center(child: Text('لا يوجد أشخاص تتابعهم.'));
        }

        return ListView.builder(
          itemCount: controller.followersProfiles.length,  // Use followedProfiles instead of followingProfiles
          itemBuilder: (context, index) {
            final following = controller.followersProfiles[index];  // Use followedProfiles instead of followingProfiles

            return ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              title: Text(following?.username ?? 'Unknown User'),
              subtitle: Text(following?.name ?? 'No Name'),
              onTap: () {
                if (following != null) {
                }
              },
            );
          },
        );
      }),
    );
  }
}