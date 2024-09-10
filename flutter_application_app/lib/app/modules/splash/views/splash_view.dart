import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(value),
      body: Center(
        child: Image.asset('assets/images/splash (2).png'),
      ),
    );
  }
}
