import 'package:flutter/material.dart';

import '1_ScreenScale.dart';

class SmallTextWidget extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final int textColor;
  final int fontsize;
  const SmallTextWidget(
      {super.key,
      required this.text,
      required this.fontWeight,
      required this.textColor, required this.fontsize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: fontWeight,
          fontSize: fontsize * screenScaling(context),
          color: Color(textColor)),
    );
  }
}
