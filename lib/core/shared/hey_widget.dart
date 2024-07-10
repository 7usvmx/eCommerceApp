import 'package:flutter/material.dart';

class HeyWidget extends StatelessWidget {
  final String name;

  const HeyWidget({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            textAlign: TextAlign.start,
            name,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontSize: 35),
          ),
        ],
      ),
    );
  }
}
