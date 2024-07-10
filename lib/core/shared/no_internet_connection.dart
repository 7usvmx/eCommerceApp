import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shop/core/constants/image_asset.dart';

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            ImageAsset.noInternet,
            height: 250,
            width: 250,
          ),
          const SizedBox(height: 30),
          Text(
            "No internet connection",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ],
      ),
    );
  }
}
