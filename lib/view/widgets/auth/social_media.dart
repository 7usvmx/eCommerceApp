import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constants/colors.dart';

class SocialMediaAuth extends StatelessWidget {
  final String image;
  final Color color;

  const SocialMediaAuth({super.key, required this.image, required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: TextColors.detailsColor.withOpacity(0.5),
        ),
        padding: const EdgeInsets.all(20),
        child: SvgPicture.asset(
          image,
          // ignore: deprecated_member_use
          color: color,
          fit: BoxFit.fill,
          height: 30,
          width: 30,
        ),
      ),
    );
  }
}
