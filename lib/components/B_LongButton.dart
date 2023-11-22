import 'package:flutter/material.dart';

import '1_ScreenScale.dart';
import 'T_SmallText.dart';

class LongButton extends StatelessWidget {
  final String text;
  final int textColor;
  final int buttonColor;
  final int buttonBorderColor;
  final Widget sendUserTo;

  const LongButton({
    super.key,
    required this.text,
    required this.buttonColor,
    required this.textColor,
    required this.sendUserTo,
    required this.buttonBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350 * screenScaling(context),
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => sendUserTo),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(buttonColor),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: Color(buttonBorderColor),
              width: 0.5,
            ),
          ),
        ),
        child: Center(
            child: SmallTextWidget(
          text: text,
          fontWeight: FontWeight.bold,
          textColor: textColor,
          fontsize: 16,
        )),
      ),
    );
  }
}
