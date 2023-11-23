import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:eazytrackv2/components/0_Company.dart';
import 'package:eazytrackv2/components/1_ScreenScale.dart';
import 'package:eazytrackv2/components/GreenLongButton.dart';
import 'package:eazytrackv2/components/Controllers.dart';
import 'package:eazytrackv2/components/T_SmallText.dart';
import 'package:eazytrackv2/components/UI_SmallUserInput.dart';
import 'package:eazytrackv2/pages/3EazybudgetInputAndValues.dart';
import 'package:eazytrackv2/pages/P_EditProfile.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

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
        ),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: 430 * screenScaling(context),
              child: Column(
                children: [
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
                                      'To get started, I will need your monthly income. Don\'t worry, it does not have to be the exact amount.',
                                      textStyle: TextStyle(
                                          color: const Color(0xffffffff),
                                          fontSize: 15 * screenScaling(context),
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Poppins'),
                                      speed: const Duration(milliseconds: 30),
                                    ),
                                    TyperAnimatedText(
                                      'If there are any changes of income, maybe an increase or a decrease, you can easily set a new EazyBudget anytime.',
                                      textStyle: TextStyle(
                                          color: const Color(0xffffffff),
                                          fontSize: 15 * screenScaling(context),
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Poppins'),
                                      speed: const Duration(milliseconds: 30),
                                    ),
                                    TyperAnimatedText(
                                      'Go ahead, and type in your income.',
                                      textStyle: TextStyle(
                                          color: const Color(0xffffffff),
                                          fontSize: 15 * screenScaling(context),
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Poppins'),
                                      speed: const Duration(milliseconds: 30),
                                    ),
                                  ],
                                  totalRepeatCount: 1,
                                  pause: const Duration(milliseconds: 2500),
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
                  const GreenLongButton(
                    text: 'Generate Eazybudget',
                    sendUserTo: GeneratedEazyBudgetValues(),
                  ),
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
