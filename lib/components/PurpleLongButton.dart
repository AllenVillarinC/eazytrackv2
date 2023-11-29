import 'package:flutter/material.dart';
import 'ScreenScale.dart';
import 'SmallTextWidget.dart';

class PurpleLongButton extends StatelessWidget {
  final String text;
  final Widget sendUserTo;

  const PurpleLongButton({
    super.key,
    required this.text,
    required this.sendUserTo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: const SweepGradient(
            colors: [Color(0xff1f2c25), Color(0xffC3A9FF)],
            stops: [0.2, 0.75],
            center: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(15)),
      width: 350 * screenScaling(context),
      height: 60 * screenScaling(context),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => sendUserTo),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Center(
          child: SmallTextWidget(
            text: text,
            fontWeight: FontWeight.w600,
            textColor: 0xffffffff,
            fontsize: screenScalingToInt(context, 20),
          ),
        ),
      ),
    );
  }
}
