import 'package:get/get.dart';
import 'package:myblog/app/modules/auth/controllers/controllers.dart';
import 'package:myblog/app/modules/auth/providers/providers.dart';

import '../../profile/controllers/profile_controller.dart';



class AuthBinding extends Bindings { 
  @override 
  void dependencies() { 
    Get.lazyPut<AuthController>( 
      () => AuthController(), 
    ); 
    Get.lazyPut<SigninProvider>( 
      () => SigninProvider(), 
    ); 
     Get.lazyPut<SignupProvider>( 
      () => SignupProvider(), 
    ); 
     Get.lazyPut<SignupController>( 
      () => SignupController(), 
    ); 
   Get.lazyPut<PhoneVerificationController>(
    () => PhoneVerificationController(),
   );
   Get.lazyPut<PhoneVerificationProvider>(
    () => PhoneVerificationProvider(),
   );
  //  ProfileController
  Get.lazyPut<ProfileController>(
    () => ProfileController(),
   );
  } 
}
