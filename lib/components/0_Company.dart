import 'package:flutter/material.dart';
import '1_ScreenScale.dart';

class CompanyName extends StatelessWidget {
  const CompanyName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        "Ea",
        style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w800,
          fontSize: 50 * screenScaling(context),
          color: const Color(0xffC0FF99),
        ),
      ),
      Text(
        "zy",
        style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w800,
          fontSize: 50 * screenScaling(context),
          color: const Color(0xffC3A9FF),
        ),
      ),
      Text(
        "Track",
        style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w800,
          fontSize: 40 * screenScaling(context),
          color: const Color(0xffffffff),
        ),
      ),
    ]);
  }
}
