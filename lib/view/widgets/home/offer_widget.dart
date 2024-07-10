import 'package:flutter/material.dart';
import 'package:shop/core/constants/colors.dart';

class OffersWidget extends StatelessWidget {
  final String title;
  final String subTitle;

  const OffersWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(20),
          ),
          height: 150,
          width: double.infinity,
          margin: const EdgeInsets.all(15),
          child: ListTile(
            title: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            subtitle: Text(
              subTitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
        ),
        Positioned(
          top: -20,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white38,
              shape: BoxShape.circle,
            ),
            height: 160,
            width: 160,
          ),
        ),
      ],
    );
  }
}
