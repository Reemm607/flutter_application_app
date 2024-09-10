// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:myblog/app/modules/profile/views/profile_view.dart';
// import '../controllers/post_controller.dart';
// import '../models/post.dart';

// class HomeView extends GetView<HomeController> {
//   const HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Blogger'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.favorite_border),
//             onPressed: () {
//               // Get.to(() => ProfileView());
//             },
//           ),
//           IconButton(
//             icon: Container(
//               decoration: BoxDecoration(
//                 color: Colors.black12,
//                 shape: BoxShape.circle, // لتحديد الشكل كدائرة
//                 // border: Border.all(color: Colors.black), // إضافة حد للدائرة
//               ),
//               padding: EdgeInsets.all(8.0), // لتوفير مسافة داخلية حول الأيقونة
//               child: Icon(Icons.search),
//             ),
//             onPressed: () {
//               // أضف هنا المنطق المطلوب عند الضغط على أيقونة البحث
//             },
//           ),
//         ],
//       ),
//       body: Obx(() {
//         if (controller.isLoading) {
//           return Center(child: CircularProgressIndicator());
//         }

//         if (controller.posts.isEmpty) {
//           return Center(child: Text('No posts available'));
//         }

//         return ListView.builder(
//           itemCount: controller.posts.length,
//           itemBuilder: (context, index) {
//             Post post = controller.posts[index];
//             return PostCard(post: post);
//           },
//         );
//       }),
//     );
//   }
// }

// class PostCard extends StatelessWidget {
//   final Post post;

//   const PostCard({super.key, required this.post});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Expanded(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       post.title,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16, // Use ScreenUtil for font size
//                       ),
//                     ),
//                     SizedBox(height: 10.0),
//                     // Use ScreenUtil for spacing
//                     if (post.image.isNotEmpty)
//                       Container(
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: NetworkImage(
//                                 'http://myblog.mobaen.com/storage/public/${post.image}'),
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                         height: 200.0,
//                         width: double.infinity,
//                       ),

//                     if (post.image.isNotEmpty) SizedBox(height: 5.0),
//                     Text(
//                       post.content,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     SizedBox(height: 5.0), // Use ScreenUtil for spacing
//                     Text(
//                       post.createdAt,
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                     Row(
//                       children: [
//                         Icon(
//                           Icons.favorite_outline,
//                         ),
//                         SizedBox(width: 300),
//                         IconButton(
//                             icon: Icon(
//                               Icons.bookmark_outline_sharp,
//                             ),
//                             onPressed: () {
//                               Get.to(() => ProfileView(initialTabIndex:1));
//                             }),
//                         // Icon(
//                         //   Icons.bookmark_outline_sharp,
//                         // ),
//                         // Icon(Icons.share,)
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               Divider(),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myblog/app/modules/home/controllers/post_controller.dart';
import 'package:myblog/app/modules/home/models/post.dart';

import '../../profile/model/liked_posts.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Blogger')),
      body: Obx(() {
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

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.user.profile?.name ?? 'None',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 5.0),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.isUserFollowed(post.user.id)
                          ? controller.unfollowUser(post.user.id)
                          : controller.followUser(post.user.id);
                    },
                    child: Text(controller.isUserFollowed(post.user.id)
                        ? 'Unfollow'
                        : 'Follow'),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'http://myblog.mobaen.com/storage/public/${post.image}'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 200.0,
                width: double.infinity,
              ),
              SizedBox(height: 10.0),
              Text(
                post.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                post.content,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 5.0),
              Text(
                post.createdAt,
                style: const TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      controller.isPostLiked(post.id)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: controller.isPostLiked(post.id)
                          ? Colors.red
                          : Colors.grey,
                    ),
                    onPressed: () {
                      controller.isPostLiked(post.id)
                          ? controller.unlikePost(post.id)
                          : controller.likePost(post.id);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      controller.isPostFavorited(post.id)
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                      color: controller.isPostFavorited(post.id)
                          ? Colors.blue
                          : Colors.grey,
                    ),
                    onPressed: () {
                      controller.isPostFavorited(post.id)
                          ? controller.unsavePost(post.id)
                          : controller.savePost(post.id);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LikePostCard extends StatelessWidget {
  final LikePost post;

  const LikePostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'None', // Handle null profile
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 5.0),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.isUserFollowed(post.pivot.userId)
                          ? controller.unfollowUser(post.pivot.userId)
                          : controller.followUser(post.pivot.userId);
                    },
                    child: Text(controller.isUserFollowed(post.pivot.userId)
                        ? 'Unfollow'
                        : 'Follow'),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'http://myblog.mobaen.com/storage/public/${post.image}'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 200.0,
                width: double.infinity,
              ),
              SizedBox(height: 10.0),
              Text(
                post.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                post.content,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 5.0),
              Text(
                post.createdAt,
                style: const TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      controller.isPostLiked(post.id)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: controller.isPostLiked(post.id)
                          ? Colors.red
                          : Colors.grey,
                    ),
                    onPressed: () {
                      controller.isPostLiked(post.id)
                          ? controller.unlikePost(post.id)
                          : controller.likePost(post.id);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      controller.isPostFavorited(post.id)
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                      color: controller.isPostFavorited(post.id)
                          ? Colors.blue
                          : Colors.grey,
                    ),
                    onPressed: () {
                      controller.isPostFavorited(post.id)
                          ? controller.unsavePost(post.id)
                          : controller.savePost(post.id);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
