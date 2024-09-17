import 'dart:io';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myblog/app/modules/home/models/post.dart';
import 'package:myblog/app/modules/profile/model/liked_posts.dart';
import 'package:myblog/app/modules/profile/model/profile_model.dart';
import 'package:myblog/app/modules/profile/model/profile_response_model.dart';

import '../provider/profile_provider.dart';

class ProfileController extends GetxController {
  var profile = Rxn<ProfileModel>();
  var profileResponse = Rxn<ProfileResponseModel>();
  var isLoading = true.obs;
  var hasProfile = false.obs;
  var likedPosts = <LikePost>[].obs;
  var savedPosts = <LikePost>[].obs;
  var posts = <Post>[].obs;
  var image = Rxn<File>();
  var followersCount = 0.obs;
  var followingCount = 0.obs;


  var followingProfiles = <ProfileResponseModel?>[].obs;
  var followersProfiles = <ProfileResponseModel?>[].obs;

  final ProfileProvider profileProvider;
  // final HomeProvider homeProvider;
  final GetStorage storage = GetStorage();
  final ImagePicker _picker = ImagePicker();

  ProfileController({required this.profileProvider});
  void pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchFollowing();
    fetchFollowers();
    // followUser();
    fetchLikedPosts();
    fetchSavedPosts();
    fetchPosts();
    if (storage.read('user_id') != null) {
      fetchProfileByUserId(storage.read('user_id'));
    }
  }

  void fetchProfileByUserId(int userId) async {
    isLoading(true);
    try {
      final fetchedProfile = await profileProvider.fetchProfileByUserId(userId);
      if (fetchedProfile != null) {
        profileResponse.value = fetchedProfile;
        hasProfile(true);
        print(profileResponse.value);
        print("this is profiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiil");
      } else {
        hasProfile(false);
        print("falllllllllllllllllllllllllllllllllllllllllllllllllse");
      }
    } finally {
      isLoading(false);
    }
  }

  void createProfile(ProfileModel profileData) async {
    isLoading(true);
    try {
      final response = await profileProvider.createProfile(profileData);
      print(response.body);
      if (response.isOk) {
        print("create profilllllllllllllle");
        fetchProfileByUserId(storage.read('user_id'));
        // Fetch profile after creation
      }
    } finally {
      isLoading(false);
    }
  }

  void updateProfile(int id, ProfileModel profileData) async {
    isLoading(true);
    try {
      final response = await profileProvider.updateProfile(
          storage.read('profile_id'), profileData);
      if (response.statusCode == 200) {
        fetchProfileByUserId(
            storage.read('user_id')); // Fetch profile after update
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchLikedPosts() async {
    isLoading(true);
    try {
      final posts = await profileProvider.fetchLikedPosts();
      likedPosts.value = posts;
    } catch (e) {
      print('Error fetching liked posts: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchSavedPosts() async {
    isLoading(true);
    try {
      final posts = await profileProvider.fetchSavePosts();
      savedPosts.value = posts;
    } catch (e) {
      print('Error fetching liked posts: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchFollowing() async {
    isLoading(true);
    try {
      final following= await profileProvider.fetchFollowing();
       followingCount.value = following.length;

      for (int id in following) {
        final followeringProfile = await profileProvider.fetchProfileByUserId(id);
        followingProfiles.add(followeringProfile);
      }
    } catch (e) {
      print('Error fetching liked posts: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchFollowers() async {
    isLoading(true);
    try {
      final followers = await profileProvider.fetchFollows();
      followersCount.value = followers.length;
      followersProfiles.clear();
      for (int id in followers) {
        final followerProfile = await profileProvider.fetchProfileByUserId(id);
        followersProfiles.add(followerProfile);
      }
    } catch (e) {
      print('Error fetching follower posts: $e');
    } finally {
      isLoading(false);
    }
  }


  Future<void> fetchPosts() async {
    try {
      var allPosts = await profileProvider.fetchPosts();
      var userPosts = allPosts
          .where((post) => post.user.id == storage.read('user_id'))
          .toList();
      posts.assignAll(userPosts);
    } catch (e) {
      print("Failed to load posts: $e");
    }
  }
}
