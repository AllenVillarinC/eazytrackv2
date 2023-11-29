import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ScreenScale.dart';


class SmallUserInput extends StatelessWidget {
  final String hintLabel;
  final double textFieldSize;
  final int totalCharacters;
  final String regExp;
  final TextEditingController controllerName;

  const SmallUserInput(
      {super.key,
      required this.hintLabel,
      required this.textFieldSize,
      required this.totalCharacters,
      required this.regExp,
      required this.controllerName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: textFieldSize * screenScaling(context),
      height: 35,
      child: SizedBox(height: 40,
        child: TextField(
          controller: controllerName,
          maxLength: totalCharacters,
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(regExp))],
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: hintLabel,
            counterText:
                '', // maxlength has a default text counter. this disables that
            hintStyle: TextStyle(
              fontFamily: 'Inter',
              fontSize: 15 * screenScaling(context),
              color: const Color(0xff000000).withOpacity(0.7),
            ),
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xff0081B3), width: 2.0),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffffffff), width: 2.0),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
