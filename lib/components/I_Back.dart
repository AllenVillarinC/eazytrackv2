import 'package:flutter/material.dart';

import '1_ScreenScale.dart';

Widget goBackIconWidget(BuildContext context) {
  return TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        'Back',
        style: TextStyle(
            fontSize: 18 * screenScaling(context),
            color: const Color(0xffC0FF99)),
      ));
}
