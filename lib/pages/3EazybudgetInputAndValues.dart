import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:eazytrackv2/components/0_Company.dart';
import 'package:eazytrackv2/components/1_ScreenScale.dart';
import 'package:eazytrackv2/components/Controllers.dart';
import 'package:eazytrackv2/components/Methods.dart';
import 'package:eazytrackv2/components/PurpleLongButton.dart';
import 'package:eazytrackv2/components/T_SmallText.dart';
import 'package:eazytrackv2/components/UI_SmallUserInput.dart';
import 'package:eazytrackv2/pages/4HomePageEazyBudget.dart';
import 'package:eazytrackv2/pages/P_EditProfile.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

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
              width: 430 * screenScaling(context),
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  const CompanyName(),
                 const SizedBox(height: 15),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: const SweepGradient(
                            colors: [Color(0xff151515), Color(0xff1f2c25)],
                            stops: [0.25, 0.75],
                            center: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: 430 * screenScaling(context),
                        height: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const EditProfilePage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 85,
                                width: 55,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: const ClipOval(
                                  child: RiveAnimation.asset(
                                    'assets/rive/3287-6917-headless-bear.riv',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: AnimatedTextKit(
                                  animatedTexts: [
                                    TyperAnimatedText(
                                      'Here are the amounts of how you should manage your monthly income.',
                                      textStyle: TextStyle(
                                          color: const Color(0xffffffff),
                                          fontSize: 15 * screenScaling(context),
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Poppins'),
                                      speed: const Duration(milliseconds: 30),
                                    ),
                                    TyperAnimatedText(
                                      'If you made a mistake, just type in your income again and I will generate new amounts for you.',
                                      textStyle: TextStyle(
                                          color: const Color(0xffffffff),
                                          fontSize: 15 * screenScaling(context),
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Poppins'),
                                      speed: const Duration(milliseconds: 30),
                                    ),
                                    TyperAnimatedText(
                                      'Whenever you are ready, press the "Continue" button.',
                                      textStyle: TextStyle(
                                          color: const Color(0xffffffff),
                                          fontSize: 15 * screenScaling(context),
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Poppins'),
                                      speed: const Duration(milliseconds: 30),
                                    ),
                                  ],
                                  totalRepeatCount: 1,
                                  pause: const Duration(milliseconds: 2000),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                          height: 1,
                          width: 200,
                          decoration:
                              const BoxDecoration(color: Color(0xffffffff))),
                      const SizedBox(height: 15),
                    ],
                  ),
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
                              textFieldSize: 150,
                              totalCharacters: 10,
                              regExp: r'[0-9.]+',
                              controllerName: rent),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
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
                  const SizedBox(height: 15),
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
                  const SizedBox(height: 15),
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
                  Container(
                    decoration: BoxDecoration(
                        gradient: const SweepGradient(
                          colors: [Color(0xff1f2c25), Color(0xffc9ff99)],
                          stops: [0.2, 0.75],
                          center: Alignment.topRight,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    width: 430 * screenScaling(context),
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        calculateMonthlyExpenses();
                        calculateMiscellaneous();
                        calculateSavings();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) =>
                                const GeneratedEazyBudgetValues()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Center(
                        child: SmallTextWidget(
                          text: 'Generate New Eazybudget',
                          fontWeight: FontWeight.w600,
                          textColor: 0xffffffff,
                          fontsize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const PurpleLongButton(
                    text: 'Continue',
                    sendUserTo: HomePageEazyBudget(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
