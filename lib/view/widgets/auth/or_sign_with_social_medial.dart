import 'package:flutter/material.dart';
import 'package:shop/view/widgets/auth/social_media.dart';
import '../../../core/constants/image_asset.dart';

class OrSignWithSocialMedial extends StatelessWidget {
  const OrSignWithSocialMedial({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Divider(),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text("OR"),
            ),
            Expanded(
              child: Divider(),
            ),
          ],
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SocialMediaAuth(
              image: ImageAsset.facebook,
              color: Colors.blue,
            ),
            SocialMediaAuth(
              image: ImageAsset.google,
              color: Colors.red,
            ),
            SocialMediaAuth(
              image: ImageAsset.twitter,
              color: Colors.blueAccent,
            ),
          ],
        ),
      ],
    );
  }
}
