import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shop/core/constants/image_asset.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        ImageAsset.loading,
        height: 200,
        width: 200,
      ),
    );
  }
}
