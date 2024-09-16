

import 'package:flutter/material.dart';
import '../../../../utils/constans/sizes.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(TSizes.spaceBtwSections),
      child: Column(
        children: [
          SizedBox(height: screenSize.height * 0.05), // تباعد مرن حسب حجم الشاشة
          Image(
            width: screenSize.width * 0.8,  // عرض مرن للصورة
            height: screenSize.height * 0.35, // ارتفاع مرن للصورة
            image: AssetImage(image),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}