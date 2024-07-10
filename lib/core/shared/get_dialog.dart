import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'button.dart';

Future getDialog(
  String buttonText,
  String middleText,
  String titleText,
  Function onPressed,
) async {
  await Get.defaultDialog(
    middleText: middleText,
    title: titleText,
    titlePadding: const EdgeInsets.only(top: 30),
    contentPadding: const EdgeInsets.all(20),
    confirm: Submit(
      text: buttonText,
      isLoading: false,
      onPressed: () {
        onPressed();
      },
    ),
  );
}
