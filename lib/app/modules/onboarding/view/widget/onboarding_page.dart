
import 'package:flutter/material.dart';

import '../../../../utils/constans/sizes.dart';


// 
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
    return Padding(
      padding: const EdgeInsets.all(TSizes.spaceBtwSections),
      child: Column(
        children: [
          SizedBox(height: 40),
          Image(
            width:300
            ,
            height: 290,

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
