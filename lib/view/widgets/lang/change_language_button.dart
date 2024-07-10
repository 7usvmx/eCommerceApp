import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class ChangeLangButton extends StatelessWidget {
  final String title;
  final Function onTap;

  const ChangeLangButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.mainColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Text(
          textAlign: TextAlign.center,
          title,
          style: TextStyle(
            fontSize: 30,
            color: TextColors.whiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
