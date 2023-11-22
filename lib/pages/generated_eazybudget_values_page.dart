import 'package:eazytrackv2/components/0_Company.dart';
import 'package:eazytrackv2/components/1_ScreenScale.dart';
import 'package:eazytrackv2/components/B_LongButton.dart';
import 'package:eazytrackv2/components/Controllers.dart';
import 'package:eazytrackv2/components/I_Back.dart';
import 'package:eazytrackv2/components/Methods.dart';
import 'package:eazytrackv2/components/T_SmallText.dart';
import 'package:eazytrackv2/components/UI_SmallUserInput.dart';
import 'package:eazytrackv2/pages/home_page_eazybudget.dart';
import 'package:flutter/material.dart';

class GeneratedEazyBudgetValues extends StatefulWidget {
  const GeneratedEazyBudgetValues({super.key});

  @override
  State<GeneratedEazyBudgetValues> createState() =>
      _GeneratedEazyBudgetValuesState();
}

class _GeneratedEazyBudgetValuesState extends State<GeneratedEazyBudgetValues> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff151515),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: 350 * screenScaling(context),
              child: Column(
                children: [
                  const SizedBox(height: 60),
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
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SmallTextWidget(
                          text: 'Monthly expenses:',
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
                          SmallTextWidget(
                              text: calculateMonthlyExpenses(),
                              fontWeight: FontWeight.bold,
                              textColor: 0xffffffff,
                              fontsize: 20),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SmallTextWidget(
                          text: 'Miscellaneous:',
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
                          SmallTextWidget(
                              text: calculateMiscellaneous(),
                              fontWeight: FontWeight.bold,
                              textColor: 0xffffffff,
                              fontsize: 20),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SmallTextWidget(
                          text: 'Savings:',
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
                          SmallTextWidget(
                              text: calculateSavings(),
                              fontWeight: FontWeight.bold,
                              textColor: 0xffffffff,
                              fontsize: 20),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 350 * screenScaling(context),
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        calculateMonthlyExpenses();
                        calculateMiscellaneous();
                        calculateSavings();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffc9ff99),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(
                            color: Color(0xff000000),
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: const Center(
                          child: SmallTextWidget(
                        text: 'Generate EazyBudget',
                        fontWeight: FontWeight.bold,
                        textColor: 0xff000000,
                        fontsize: 16,
                      )),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const LongButton(
                      text: 'Continue',
                      buttonColor: 0xff1f2c25,
                      textColor: 0xffffffff,
                      sendUserTo: HomePageEazyBudget(),
                      buttonBorderColor: 0xffffffff),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
