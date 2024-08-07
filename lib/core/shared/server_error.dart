import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:shop/core/constants/image_asset.dart';

class ServerError extends StatelessWidget {
  const ServerError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        ImageAsset.serverError,
        height: 300,
        width: 300,
      ),
    );
  }
}
