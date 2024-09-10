import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/routes.dart';
import '../../../utils/constans/sizes.dart';
import '../../../utils/constans/text_string.dart';
import '../controllers/controllers.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});
  // const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 70),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'Register a new account'.tr,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: controller.phoneController,
                  minLines: 1,
                  maxLines: 1,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Enter Phone',
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
                    hintText: '7333333333',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field is required'.tr;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 10),
                Obx(
                  () => TextFormField(
                    controller: controller.passwordController,
                    decoration: InputDecoration(
                      labelText: 'Enter Pasworrd',
                      hintText: '**********',
                      filled: true,
                      border: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffd9d9d9), width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffd9d9d9), width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: controller.togglePasswordVisibility,
                      ),
                    ),
                    obscureText: !controller.isPasswordVisible,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required'.tr;
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => TextFormField(
                    controller: controller.passwordConfirmationController,
                    decoration: InputDecoration(
                      labelText: 'Enter Confirmation Pasworrd',
                      hintText: '**********',
                      filled: true,
                      border: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffd9d9d9), width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffd9d9d9), width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordConfirmationVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed:
                            controller.togglePasswordConfirmationVisibility,
                      ),
                    ),
                    obscureText: !controller.isPasswordConfirmationVisible,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Confirm Password is required'.tr;
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
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
                          controller.signup();
                        },
                      ),
                      // onPressed: () {
                      //   WidgetsBinding.instance.addPostFrameCallback((_) {
                      //     controller.signup();
                      //   });
                      // },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Get.back();
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(fontSize: 15),
                          ),
                          const SizedBox(width: TSizes.spaceBtwItems),
                          TextButton(
                            onPressed: () {
                              // print('reeedf');
                              Get.offAllNamed(Routes.SIGNIN);
                            },
                            child: const Text(
                              "Signin",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
      ),
    );
  }
}
