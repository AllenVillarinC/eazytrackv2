import 'package:eazytrackv2/components/Methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '1_ScreenScale.dart';
import 'T_SmallText.dart';

class TextFormUserInput extends StatefulWidget {
  final String label;
  final String hiddenLabel;
  final TextEditingController controllerName;
  final String regExp;

  const TextFormUserInput(
      {super.key,
      required this.label,
      required this.hiddenLabel,
      required this.controllerName,
      required this.regExp});

  @override
  State<TextFormUserInput> createState() => _TextFormUserInputState();
}

class _TextFormUserInputState extends State<TextFormUserInput> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350 * screenScaling(context),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: SmallTextWidget(
              text: widget.label,
              fontWeight: FontWeight.normal,
              textColor: 0xffffffff,
              fontsize: 16,
            ),
          ),
          const SizedBox(height: 5),
          TextFormField(
            controller: widget.controllerName,
            onChanged: (newvalue) {
              calculateTotalExpenses();
            },
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(widget.regExp))
            ],
            decoration: InputDecoration(
              hintText: widget.hiddenLabel,
              hintStyle: TextStyle(
                fontFamily: 'Inter',
                fontSize: 15 * screenScaling(context),
                color: const Color(0xff000000).withOpacity(0.7),
              ),
              filled: true,
              fillColor: const Color(0xffffffff),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xff0081B3), width: 2.0),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xffffffff), width: 2.0),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
