import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:shop/core/constants/image_asset.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        ImageAsset.noInternet,
        height: 300,
        width: 300,
      ),
    );
  }
}
