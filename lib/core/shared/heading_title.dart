import 'package:flutter/material.dart';
import 'package:shop/core/services/services.dart';

class HeadingWidget extends StatelessWidget {
  final Color color;
  final String head;
  final Services services;
  const HeadingWidget({
    super.key,
    required this.head,
    required this.color,
    required this.services,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Stack(
          children: [
            // headDir(services),

            Positioned(
              top: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
                height: 30,
                width: 30,
              ),
            ),

            Text(
              head,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
