
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/constans/sizes.dart';
import '../../../utils/constans/text_string.dart';
import '../controllers/controllers.dart';

class SigninView extends GetView<AuthController> {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 40, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(
                width: 800,
                height: 140,
                image: AssetImage('assets/images/splash2.png'),
              ),
              Text(
                'Sign In',
                style:
                    const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: controller.phoneController,
                keyboardType: TextInputType.phone,
                minLines: 1,
                maxLines: 1,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xffd9d9d9), width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xffd9d9d9), width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                  ),
                  hintText: '',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              Obx(
                () => TextFormField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: '',
                    fillColor: Colors.white,
                    filled: true,
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                  ),
                  obscureText: !controller.isPasswordVisible.value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(TTexts.forgetPassword),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              SizedBox(
                height: 60,
                child: Center(
                  child: Card(
                    elevation: 5,
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Sign In",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xffffffff),
                              fontSize: 22,
                              letterSpacing: 0.1,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        controller.signin();
                      },
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    TTexts.createAcount,
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  TextButton(
                    onPressed: () {
                      // print('reeedf');
                      Get.offAllNamed(Routes.SIGNUP);
                    },
                    child: const Text(
                      TTexts.createSingup,
                      style: TextStyle(fontSize: 15, color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    
                      TTexts.sigupconditions,
                      style: TextStyle(fontSize: 15),
                    
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    TTexts.sigupprivconditions,
                    style: TextStyle(fontSize: 15, color: Colors.blue[400]),
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
