import 'package:flutter/material.dart'; 
import 'package:get/get.dart'; 
import 'package:get_storage/get_storage.dart';
import '../../../routes/app_pages.dart';
import '../models/models.dart';
import '../models/signup_respons_model.dart';
import '../providers/providers.dart'; 


class SignupController extends GetxController { 
  final storage = GetStorage(); 
  final SignupProvider _provider = Get.find<SignupProvider>(); 
 
  final TextEditingController phoneController = TextEditingController(); 
  final TextEditingController passwordController = TextEditingController(); 
  final TextEditingController passwordConfirmationController = TextEditingController(); 
 
  final RxBool _isLoading = false.obs; 
  final RxBool _isPasswordVisible = false.obs; 
  final RxBool _isPasswordConfirmationVisible = false.obs; 
 
  bool get isLoading => _isLoading.value; 
  bool get isPasswordVisible => _isPasswordVisible.value; 
  bool get isPasswordConfirmationVisible => _isPasswordConfirmationVisible.value; 
 
  @override 
  void onInit() { 
    super.onInit(); 
 
    // if (storage.read("is_sigup") == true) { 
    //   Get.offAllNamed(Routes.PHONE_VERIFICATION); 
    // } 
  } 
 
  @override 
  void onReady() { 
      super.onReady();
    if (storage.read("is_signedup") == true) {
      Get.offAllNamed(Routes.PHONE_VERIFICATION);
    }
  } 
 ///disposeعشان مايرجع
  @override 
  void onClose() { 
    phoneController.dispose(); 
    passwordController.dispose(); 
    passwordConfirmationController.dispose(); 
    super.onClose(); 
  } 
 
  void togglePasswordVisibility() { 
    _isPasswordVisible.value = !_isPasswordVisible.value; 
  } 
 
  void togglePasswordConfirmationVisibility() { 
    _isPasswordConfirmationVisible.value = !_isPasswordConfirmationVisible.value; 
  } 

 // وتاكيد كلمة المرور تحقق من تطابق كلمة المرور
  Future<void> signup() async { 
    if (passwordController.text != passwordConfirmationController.text) { 
      Get.snackbar('خطأ', 'كلمة المرور غير متطابقة'); 
      return; 
    } 

    
 
    _isLoading.value = true; 
 
    SignuprequestModel signupData = SignuprequestModel( 
      phone: phoneController.text, 
      password: passwordController.text, 
      passwordConfirmation: passwordConfirmationController.text, 
    ); 
 
    try { 
      Response<SignupResponsModel> response = await _provider.postSignup(signupData); 
 
      if (response.isOk) { 
        storage.write("phone", phoneController.text); 
        Get.offAllNamed(Routes.PHONE_VERIFICATION); 
      } else { 
        Get.snackbar('Error', response.body?.message ?? 'Unknown error'); 
      } 
    } catch (e) { 
      Get.snackbar('Error', e.toString()); 
    } finally { 
      _isLoading.value = false; 
    } 
  } 
}
