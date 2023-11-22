import 'package:flutter/material.dart';

import '../components/I_Back.dart';
import '../components/T_BigText.dart';

class EazyBudgetDetails extends StatelessWidget {
  const EazyBudgetDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff151515),
      appBar: AppBar(
        backgroundColor: const Color(0xff151515),
        elevation: 0,
        leading: goBackIconWidget(context),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          children: [
            BigTextWidget(
              text: 'EazyBudget details Sprint 4',
              weight: FontWeight.w800,
              fontsize: 25,
            ),
          ],
        ),
      ),
    );
  }
}
