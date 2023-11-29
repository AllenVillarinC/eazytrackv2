import 'package:flutter/material.dart';

import 'ScreenScale.dart';

class BigTextWidget extends StatelessWidget {
  final String text;
  final FontWeight weight;
  final int fontsize;

  const BigTextWidget({super.key, required this.text, required this.weight, required this.fontsize});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: weight,
            fontSize: fontsize * screenScaling(context),
            color: const Color(0xffffffff),
          ),
        ),
      ],
    );
  }
}
