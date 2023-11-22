import 'package:eazytrackv2/components/0_Company.dart';
import 'package:eazytrackv2/components/1_ScreenScale.dart';
import 'package:eazytrackv2/components/B_LongButton.dart';
import 'package:eazytrackv2/components/Controllers.dart';
import 'package:eazytrackv2/components/I_Back.dart';
import 'package:eazytrackv2/components/T_SmallText.dart';
import 'package:eazytrackv2/components/UI_SmallUserInput.dart';
import 'package:eazytrackv2/pages/generated_eazybudget_values_page.dart';
import 'package:flutter/material.dart';

class GenerateEazyBudget extends StatefulWidget {
  const GenerateEazyBudget({super.key});

  @override
  State<GenerateEazyBudget> createState() => _GenerateEazyBudgetState();
}

class _GenerateEazyBudgetState extends State<GenerateEazyBudget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff151515),
        appBar: AppBar(
          backgroundColor: const Color(0xff151515),
          elevation: 0,
          leading: goBackIconWidget(context),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: 350 * screenScaling(context),
              child: Column(
                children: [
                  const CompanyName(),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SmallTextWidget(
                          text: 'Monthly income:',
                          fontWeight: FontWeight.normal,
                          textColor: 0xffffffff,
                          fontsize: 20),
                      Row(
                        children: [
                          const SmallTextWidget(
                              text: '\$',
                              fontWeight: FontWeight.bold,
                              textColor: 0xffffffff,
                              fontsize: 20),
                          const SizedBox(width: 5),
                          SmallUserInput(
                              hintLabel: 'Income',
                              textFieldSize: 120,
                              totalCharacters: 7,
                              regExp: r'[0-9.]+',
                              controllerName: rent),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  const SizedBox(height: 15),
                  const LongButton(
                      text: 'Generate EazyBudget',
                      buttonColor: 0xffc9ff99,
                      textColor: 0xff000000,
                      sendUserTo: GeneratedEazyBudgetValues(),
                      buttonBorderColor: 0xff000000),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
