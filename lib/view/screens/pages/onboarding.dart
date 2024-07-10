import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/core/constants/colors.dart';
import 'package:shop/core/shared/button.dart';
import 'package:shop/data/datasource/static/onboarding_model.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 18,
              child: PageView.builder(
                itemCount: onboardingData.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Add onboarding Title
                      Text(
                        onboardingData[index].title,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 80),
                      // Add onboarding Image
                      SvgPicture.asset(onboardingData[index].image),
                      const SizedBox(height: 80),
                      // Add onboarding Details
                      Text(
                        onboardingData[index].details,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        onboardingData.length,
                        (index) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 800),
                            width: 5,
                            height: 6,
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: const EdgeInsets.all(5),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Submit(text: "text", isLoading: false, onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
