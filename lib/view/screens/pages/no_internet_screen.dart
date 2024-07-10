import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shop/core/constants/image_asset.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "No internet connection",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 40),
              Lottie.asset(ImageAsset.noInternet, height: 300, width: 300),
            ],
          ),
        ),
      ),
    );
  }
}
