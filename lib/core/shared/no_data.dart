import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:shop/core/constants/image_asset.dart';

class NoData extends StatelessWidget {
  const NoData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        ImageAsset.empty,
        height: 300,
        width: 300,
      ),
    );
  }
}
