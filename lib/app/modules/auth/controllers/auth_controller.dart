import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/routes.dart';
import '../models/signin_request_model.dart';
import '../providers/signin_provider.dart';

class AuthController extends GetxController {
  final GetStorage storage = GetStorage();
  final provider = Get.find<SigninProvider>();

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxBool _isLoading = false.obs;

  var isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  get isLoading => _isLoading;

  @override
  void onInit() {
    super.onInit();
    // Check if already signed in
    if (storage.read("is_signedin") == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.offAllNamed(Routes.ROOT);
      });
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    phoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void signin() {
    _isLoading.value = true;
    SigninRequestModel signinModel = SigninRequestModel(
        phone: phoneController.text, password: passwordController.text);
    provider.postSignin(signinModel).then((response) {
      if (response.isOk) {
        storage.write("jwt_token", response.body?.data?.token);
        storage.write("is_signedin", true);
        storage.write("user_id", response.body?.data?.id);

        Get.offAllNamed(Routes.ROOT);
      } else {
        Get.snackbar('Error', response.body?.message ?? 'Unknown error');
      }
      _isLoading.value = false;
    }).catchError((error) {
      Get.snackbar('Error', error.toString());
      _isLoading.value = false;
    });
  }

  void signout() {
    storage.erase();
    Get.offAllNamed(Routes.SIGNIN); // Navigate to login after signout
  }
}
