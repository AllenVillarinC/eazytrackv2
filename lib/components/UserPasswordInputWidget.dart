import 'package:flutter/material.dart';

import 'ScreenScale.dart';
import 'SmallTextWidget.dart';

class UserInputPassword extends StatefulWidget {
  final String label;
  final String hintLabel;
  final TextEditingController controllerName;
  const UserInputPassword(
      {super.key,
      required this.label,
      required this.hintLabel,
      required this.controllerName});

  @override
  State<UserInputPassword> createState() => _UserInputPasswordState();
}

class _UserInputPasswordState extends State<UserInputPassword> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 430 * screenScaling(context),
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
          TextField(
            controller: widget.controllerName,
            obscureText: _obscureText,
            decoration: InputDecoration(
              hintText: widget.hintLabel,
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
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: const Color(0xff000000).withOpacity(0.6),
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
