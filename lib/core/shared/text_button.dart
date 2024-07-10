import 'package:flutter/material.dart';
import 'package:shop/core/constants/colors.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  const CustomTextButton(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(TextColors.detailsColor),
      ),
      child: Text(title),
    );
  }
}
