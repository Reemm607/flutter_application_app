// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// import '../models/post.dart';
// import '../providers/all_posts_provider.dart';

// class HomeController extends GetxController {


//   final storage = GetStorage();
// final AllPostsProvider provider = Get.put(AllPostsProvider());
  
//   final RxList<Post> posts = <Post>[].obs;
//   final RxBool _isLoading = false.obs;

//   bool get isLoading => _isLoading.value;

//   @override
//   void onInit() {
//     allPosts();
//     super.onInit();
//   }

//   void allPosts() async {
//     _isLoading(true);
//     try {
//       final response = await provider.allPosts();
//       posts.assignAll(response); 
//         } catch (e) {
//       print('Error: $e');
//       Get.snackbar('Error', 'An error occurred: $e');
//     } finally {
//       _isLoading(false);
//     }
//   }
// }

