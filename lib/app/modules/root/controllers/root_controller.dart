
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../create_post/views/create_post_view.dart';

import '../../home/views/home_view.dart'; // تأكد من استيراد HomeView بدلاً من HomeController
import '../../profile/views/profile_view.dart';

class RootController extends GetxController {
  final RxInt _selectedIndex = 0.obs;

  int get selectedIndex => _selectedIndex.value;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onTap(int index) {
    _selectedIndex.value = index;
  }

  final List<Widget>  screens = [
   const HomeView (), // استخدم HomeView بدلاً من HomeController

        CreatePostView(),


     ProfilePage(),
  ];
}