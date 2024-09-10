import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/controllers.dart';

class PhoneVerificationView extends GetView<PhoneVerificationController> {
  const PhoneVerificationView({super.key});

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
                Text(
                  'رمز التحقق'.tr,
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: controller.codeController,
                  minLines: 1,
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'أدخل رمز التحقق',
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffd9d9d9), width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffd9d9d9), width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    ),
                    hintText: '123456',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'هذا الحقل مطلوب'.tr;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Obx(
                  () => controller.isLoading
                      ? const CircularProgressIndicator()
                      : TextButton(
                          onPressed: controller.submitVerificationCode,
                          child: Text(
                            "تحقق من الهاتف".tr,
                          ),
                        ),
                ),
                const SizedBox(height: 30),
                // الأزرار والعناصر الأخرى في الواجهة...
              ],
            ),
          ),
        ),
  ),
);
}
}
