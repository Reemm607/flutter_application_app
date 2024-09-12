import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myblog/app/modules/profile/views/followers_list_page.dart';
import 'package:myblog/app/modules/profile/views/following_list.page.dart';
import 'package:myblog/app/modules/profile/views/liked_posts_page.dart';
import 'package:myblog/app/modules/profile/views/saved_posts_page.dart';
import 'package:myblog/app/modules/profile/views/user_post_page.dart';
import 'package:myblog/app/routes/app_pages.dart';
import '../controllers/profile_controller.dart';
import '../model/profile_model.dart';
import '../model/profile_response_model.dart';

class ProfilePage extends GetView<ProfileController> {
  ProfilePage({super.key});

  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ProfileDetailsPage(profile: controller.profileResponse.value);
        }
      }),
    );
  }
}

class ProfileDetailsPage extends GetView<ProfileController> {
  final ProfileResponseModel? profile;
  final storage = GetStorage();

  ProfileDetailsPage({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' '),
        leading: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'signOut') {
              storage.erase();
              Get.offAllNamed(Routes.SIGNIN);
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'signOut',
              child: Text('Sign Out'),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Obx(
                      () => GestureDetector(
                        onTap: () => controller.pickImage(),
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(38),
                            image: controller.image.value != null
                                ? DecorationImage(
                                    image: FileImage(controller.image.value!),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                            border: Border.all(
                              color: Color.fromARGB(255, 247, 248, 250)
                                  .withOpacity(0.5),
                              width: 2,
                            ),
                          ),
                          child: controller.image.value == null
                              ? Center(
                                  child: CircleAvatar(
                                    // radius: 40,
                                    backgroundColor: Colors.grey.shade300,
                                    child: GestureDetector(
                                      onTap: () => controller.pickImage(),
                                      child: const Icon(
                                        Icons.control_point_rounded,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (profile != null) ...[
                      Text(
                        profile!.username,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        profile!.name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        profile!.email,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300),
                      ),
                    ] else ...[
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Align(
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(() => CreateProfilePage());
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: const BorderSide(color: Colors.black, width: 1),
                                ),
                              ),
                              child: const Text(
                                'Create Profile',
                                style: TextStyle(fontSize: 13, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: 2),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              // padding: const EdgeInsets.all(5.0)
              padding: const EdgeInsets.only(left: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Obx(() => Text(
                            '${controller.followersProfiles.length}', // الرقم
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                      InkWell(
                        onTap: () => Get.to(()=>const FollowersListPage()),
                        child: const Text(
                          'Followers', // النص
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 30),
                  Column(
                    children: [
                      Obx(() => Text(
                            '${controller.followingProfiles.length}', // الرقم
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                      InkWell(
                   onTap: () => Get.to(()=>const FollowingListPage ()),
                        child: const Text(
                          'Following', // النص
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                    tabs: [
                      Tab(text: 'Posts'),
                      Tab(text: 'Saved'),
                      Tab(text: 'Liked'),
                    ],
                    indicatorColor: Colors.blueAccent,
                    labelColor: Colors.blueAccent,
                    unselectedLabelColor: Colors.black,
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        UserPostsPage(),
                        SavedPostsPage(),
                        LikedPostsPage(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}

class CreateProfilePage extends GetView<ProfileController> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  CreateProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField('Username', usernameController, Icons.person),
              const SizedBox(height: 20),
              _buildTextField('Name', nameController, Icons.person),
              const SizedBox(height: 20),
              _buildTextField('Email', emailController, Icons.email),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newProfile = ProfileModel(
                      username: usernameController.text,
                      name: nameController.text,
                      email: emailController.text,
                    );
                    controller.createProfile(newProfile);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Create Profile',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, IconData icon) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.blueAccent),
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }
}

class EditProfilePage extends GetView<ProfileController> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find();
    final profile = controller.profile.value;

    if (profile != null) {
      _nameController.text = profile.name;
      _emailController.text = profile.email;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField('Name', _nameController, Icons.badge),
              const SizedBox(height: 20),
              _buildTextField('Email', _emailController, Icons.email),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final updatedProfile = ProfileModel(
                      username: profile?.username ?? '',
                      name: _nameController.text,
                      email: _emailController.text,
                    );
                    controller.updateProfile(1, updatedProfile);
                    Get.back();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Save Changes',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, IconData icon) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.blueAccent),
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }

}
