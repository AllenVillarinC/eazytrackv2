import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:eazytrackv2/components/0_Company.dart';
import 'package:eazytrackv2/components/1_ScreenScale.dart';
import 'package:eazytrackv2/components/Controllers.dart';
import 'package:eazytrackv2/components/Methods.dart';
import 'package:eazytrackv2/components/T_BigText.dart';
import 'package:eazytrackv2/components/T_SmallText.dart';
import 'package:eazytrackv2/components/UI_SmallUserInput.dart';
import 'package:eazytrackv2/components/UI_UserInput.dart';
import 'package:eazytrackv2/components/piechart.dart';
import 'package:eazytrackv2/components/sven.dart';
import 'package:eazytrackv2/pages/P_EditProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:rive/rive.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  void activateButton1() {
    setState(() {
      isVisibleGenerateEazyBudgetButton = true;
    });
  }

  void activateButton2() {
    setState(() {
      isVisibleAddPaymentButton = true;
    });
  }

  void activateButtons() {
    setState(() {
      userButtonVisiblity = true;
      isVisibleSven6 = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const SizedBox(
              child: RiveAnimation.asset(
                  'assets/rive/4720-9543-background-effect.riv',
                  fit: BoxFit.cover),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Container(),
            ),
            Center(
              child: SizedBox(
                width: 430 * screenScaling(context),
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Visibility(
                          visible: isVisibleCompanyLogo,
                          child: const CompanyName()
                              .animate()
                              .fadeIn(duration: 1.5.seconds)
                              .shimmer(duration: 1.5.seconds)),
                      const SizedBox(height: 10),
                      Visibility(
                        visible: isVisibleSven1,
                        child: svenTutorial1(activateButton1)
                            .animate()
                            .shimmer(
                                delay: 500.milliseconds,
                                duration: 500.milliseconds)
                            .fade(),
                      ),
                      Visibility(
                        visible: isVisibleSven4,
                        child: svenTutorial4(activateButton2)
                            .animate()
                            .shimmer(
                                delay: 1000.milliseconds,
                                duration: 500.milliseconds)
                            .fade(),
                      ),
                      Visibility(
                        visible: isVisibleSven5,
                        child: svenTutorial5()
                            .animate()
                            .shimmer(
                                delay: 1000.milliseconds,
                                duration: 500.milliseconds)
                            .fade(),
                      ),
                      Visibility(
                        visible: isVisibleSven6,
                        child: svenTutorial6(activateButtons)
                            .animate()
                            .shimmer(
                                delay: 1000.milliseconds,
                                duration: 500.milliseconds)
                            .fade(),
                      ),
                      Visibility(
                        visible: userButtonVisiblity,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: SweepGradient(
                              colors: [
                                const Color(0xff151515).withOpacity(0.5),
                                const Color(0xff1f2c25).withOpacity(0.5)
                              ],
                              stops: const [0.25, 0.75],
                              center: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          width: 370,
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
                                        'assets/rive/2063-4080-flutter-puzzle-hack-project.riv'),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                BigTextWidget(
                                    text: '${fname.text} ${lname.text}',
                                    weight: FontWeight.w400,
                                    fontsize: 25),
                              ],
                            ),
                          ),
                        )
                            .animate()
                            .shimmer(
                                delay: 1000.milliseconds,
                                duration: 500.milliseconds)
                            .fade(),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Visibility(
                            visible: isVisibleFirstMessage,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: const BigTextWidget(
                                text: 'Your EazyBudget:',
                                weight: FontWeight.w800,
                                fontsize: 20,
                              )
                                  .animate()
                                  .shimmer(
                                      delay: 500.milliseconds,
                                      duration: 500.milliseconds)
                                  .fade(),
                            ),
                          ),
                          Visibility(
                            visible: cancelGenerateNewEazyBudgetVisiblity,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 180 * screenScaling(context),
                                height: 30,
                                decoration: BoxDecoration(
                                    gradient: const SweepGradient(
                                      colors: [
                                        Color(0xff1f2c25),
                                        Color(0xffc9ff99)
                                      ],
                                      stops: [0.2, 0.75],
                                      center: Alignment.topRight,
                                    ),
                                    borderRadius: BorderRadius.circular(15)),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      isVisibleEazyBudgetProgressBar = true;
                                      isVisibleGenerateEazyBudgetForm = false;
                                      tutorialContinueVisibility = true;
                                      continueButtonVisibility = false;
                                      isVisibleGenerateEazyBudget2 = false;
                                      cancelGenerateNewEazyBudgetVisiblity =
                                          false;
                                      generateNewEazyBudgetVisiblity = true;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: const SmallTextWidget(
                                      text: 'Cancel',
                                      fontWeight: FontWeight.normal,
                                      textColor: 0xffffffff,
                                      fontsize: 15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Visibility(
                        visible: isVisibleSven2,
                        child: svenTutorial2()
                            .animate()
                            .shimmer(
                                delay: 500.milliseconds,
                                duration: 500.milliseconds)
                            .fade(),
                      ),
                      Visibility(
                        visible: isVisibleSven3,
                        child: svenTutorial3()
                            .animate()
                            .shimmer(
                                delay: 1000.milliseconds,
                                duration: 500.milliseconds)
                            .fade(),
                      ),
                      Visibility(
                        visible: isVisibleSven3Correction1,
                        child: svenTutorial3NewBudgetValues1()
                            .animate()
                            .shimmer(
                                delay: 700.milliseconds,
                                duration: 500.milliseconds)
                            .fade(),
                      ),
                      Visibility(
                        visible: isVisibleSven3Correction2,
                        child: svenTutorial3NewBudgetValues2()
                            .animate()
                            .shimmer(
                                delay: 700.milliseconds,
                                duration: 500.milliseconds)
                            .fade(),
                      ),
                      Visibility(
                        visible: isVisibleEazyBudgetProgressBar,
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SmallTextWidget(
                                    text:
                                        '\$ ${calculateDifference(total, calculateEazyBudget()).toStringAsFixed(2)}',
                                    fontWeight: FontWeight.bold,
                                    textColor: 0xffc9ff99,
                                    fontsize: 25),
                                Visibility(
                                  visible: generateNewEazyBudgetVisiblity,
                                  child: Container(
                                    width: 270 * screenScaling(context),
                                    height: 30,
                                    decoration: BoxDecoration(
                                        gradient: const SweepGradient(
                                          colors: [
                                            Color(0xff1f2c25),
                                            Color(0xffc9ff99)
                                          ],
                                          stops: [0.2, 0.75],
                                          center: Alignment.topRight,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          isVisibleEazyBudgetProgressBar =
                                              false;
                                          isVisibleGenerateEazyBudgetForm =
                                              true;
                                          tutorialContinueVisibility = false;
                                          continueButtonVisibility = true;
                                          isVisibleGenerateEazyBudget2 = true;
                                          cancelGenerateNewEazyBudgetVisiblity =
                                              true;
                                          generateNewEazyBudgetVisiblity =
                                              false;
                                          viewDetailsVisiblity = false;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      child: const SmallTextWidget(
                                          text: 'Generate New EazyBudget',
                                          fontWeight: FontWeight.normal,
                                          textColor: 0xffffffff,
                                          fontsize: 15),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 15,
                                      width: 270,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff1F2C25),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    Visibility(
                                      visible: isVisiblePercentageBar,
                                      child: Container(
                                        height: 15,
                                        width: calculatePercentBar(total) *
                                            screenScaling(context),
                                        // width: calculatePercentBar(),
                                        decoration: BoxDecoration(
                                          gradient: const SweepGradient(
                                            colors: [
                                              Color(0xff1f2c25),
                                              Color(0xffC3A9FF)
                                            ],
                                            stops: [0.2, 0.75],
                                            center: Alignment.topRight,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SmallTextWidget(
                                  text:
                                      '\$ ${calculateEazyBudget().toStringAsFixed(2)}',
                                  fontWeight: FontWeight.normal,
                                  textColor: 0xffffffff,
                                  fontsize: 20,
                                ),
                              ],
                            ),
                          ],
                        ).animate().fadeIn(delay: 0.5.seconds),
                      ),
                      Visibility(
                        visible: isVisibleGenerateEazyBudgetForm,
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SmallTextWidget(
                                    text: 'Monthly income:',
                                    fontWeight: FontWeight.normal,
                                    textColor: 0xffffffff,
                                    fontsize: 18),
                                Row(
                                  children: [
                                    const SmallTextWidget(
                                        text: '\$',
                                        fontWeight: FontWeight.bold,
                                        textColor: 0xffffffff,
                                        fontsize: 20),
                                    const SizedBox(width: 5),
                                    SmallUserInput(
                                        hintLabel: '9,999.99',
                                        textFieldSize: 130,
                                        totalCharacters: 7,
                                        regExp: r'[0-9.]+',
                                        controllerName: rent),
                                  ],
                                ),
                              ],
                            )
                                .animate()
                                .shimmer(
                                    delay: 500.milliseconds,
                                    duration: 500.milliseconds)
                                .fade(),
                            const SizedBox(height: 10),
                            Visibility(
                              visible: isVisibleGenerateEazyBudget2,
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient: const SweepGradient(
                                      colors: [
                                        Color(0xff1f2c25),
                                        Color(0xffc9ff99)
                                      ],
                                      stops: [0.2, 0.75],
                                      center: Alignment.topRight,
                                    ),
                                    borderRadius: BorderRadius.circular(15)),
                                width: 350 * screenScaling(context),
                                height: 56,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(
                                      () {
                                        isVisibleCalculations = true;
                                        isVisibleGenerateEazyBudget2 = false;
                                        isVisibleValueCorrection1 = true;
                                        isVisibleSven2 = false;
                                        isVisibleSven3 = true;
                                        calculateMonthlyExpenses();
                                        calculateMiscellaneous();
                                        calculateSavings();
                                      },
                                    );
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
                                      text: 'Calculate',
                                      fontWeight: FontWeight.w600,
                                      textColor: 0xffffffff,
                                      fontsize: 16,
                                    ),
                                  ),
                                ),
                              )
                                  .animate()
                                  .fadeIn(duration: 700.milliseconds)
                                  .shimmer(delay: 1.seconds),
                            ),
                            Visibility(
                              visible: isVisibleCalculations,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SmallTextWidget(
                                          text: 'Monthly expenses:',
                                          fontWeight: FontWeight.normal,
                                          textColor: 0xffffffff,
                                          fontsize: 18),
                                      Row(
                                        children: [
                                          const SmallTextWidget(
                                              text: '\$',
                                              fontWeight: FontWeight.bold,
                                              textColor: 0xffffffff,
                                              fontsize: 18),
                                          const SizedBox(width: 5),
                                          SmallTextWidget(
                                              text: calculateMonthlyExpenses(),
                                              fontWeight: FontWeight.w300,
                                              textColor: 0xffffffff,
                                              fontsize: 18),
                                        ],
                                      ),
                                    ],
                                  )
                                      .animate()
                                      .fade(delay: 2.50.seconds)
                                      .slideX(delay: 2.50.seconds),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SmallTextWidget(
                                          text: 'Miscellaneous:',
                                          fontWeight: FontWeight.normal,
                                          textColor: 0xffffffff,
                                          fontsize: 18),
                                      Row(
                                        children: [
                                          const SmallTextWidget(
                                              text: '\$',
                                              fontWeight: FontWeight.bold,
                                              textColor: 0xffffffff,
                                              fontsize: 18),
                                          const SizedBox(width: 5),
                                          SmallTextWidget(
                                              text: calculateMiscellaneous(),
                                              fontWeight: FontWeight.w300,
                                              textColor: 0xffffffff,
                                              fontsize: 18),
                                        ],
                                      ),
                                    ],
                                  )
                                      .animate()
                                      .fade(delay: 2.25.seconds)
                                      .slideX(delay: 2.25.seconds),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SmallTextWidget(
                                          text: 'EazyBudget:',
                                          fontWeight: FontWeight.normal,
                                          textColor: 0xffffffff,
                                          fontsize: 18),
                                      SmallTextWidget(
                                          text:
                                              '\$ ${calculateEazyBudget().toStringAsFixed(2)}',
                                          fontWeight: FontWeight.w300,
                                          textColor: 0xffc9ff99,
                                          fontsize: 18),
                                    ],
                                  )
                                      .animate()
                                      .fade(delay: 2.seconds)
                                      .slideX(delay: 2.seconds),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SmallTextWidget(
                                          text: 'Savings:',
                                          fontWeight: FontWeight.normal,
                                          textColor: 0xffffffff,
                                          fontsize: 18),
                                      Row(
                                        children: [
                                          const SmallTextWidget(
                                              text: '\$',
                                              fontWeight: FontWeight.bold,
                                              textColor: 0xffffffff,
                                              fontsize: 18),
                                          const SizedBox(width: 5),
                                          SmallTextWidget(
                                              text: calculateSavings(),
                                              fontWeight: FontWeight.w300,
                                              textColor: 0xffffffff,
                                              fontsize: 18),
                                        ],
                                      ),
                                    ],
                                  )
                                      .animate()
                                      .fade(delay: 1.75.seconds)
                                      .slideX(delay: 1.75.seconds),
                                  const SizedBox(height: 10),
                                  Visibility(
                                    visible: isVisibleValueCorrection1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          gradient: const SweepGradient(
                                            colors: [
                                              Color(0xff1f2c25),
                                              Color(0xffc9ff99)
                                            ],
                                            stops: [0.2, 0.75],
                                            center: Alignment.topRight,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      width: 350 * screenScaling(context),
                                      height: 56,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(
                                            () {
                                              calculateMonthlyExpenses();
                                              calculateMiscellaneous();
                                              calculateSavings();
                                              isVisibleSven3 = false;
                                              isVisibleSven3Correction1 = true;
                                              isVisibleSven3Correction2 = false;
                                              isVisibleValueCorrection1 = false;
                                              isVisibleValueCorrection2 = true;
                                            },
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          elevation: 5.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                        child: const Center(
                                          child: SmallTextWidget(
                                            text: 'Generate New EazyBudget',
                                            fontWeight: FontWeight.w600,
                                            textColor: 0xffffffff,
                                            fontsize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: isVisibleValueCorrection2,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          gradient: const SweepGradient(
                                            colors: [
                                              Color(0xff1f2c25),
                                              Color(0xffc9ff99)
                                            ],
                                            stops: [0.2, 0.75],
                                            center: Alignment.topRight,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      width: 350 * screenScaling(context),
                                      height: 56,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(
                                            () {
                                              calculateMonthlyExpenses();
                                              calculateMiscellaneous();
                                              calculateSavings();
                                              isVisibleSven3 = false;
                                              isVisibleSven3Correction1 = false;
                                              isVisibleSven3Correction2 = true;
                                              isVisibleValueCorrection1 = true;
                                              isVisibleValueCorrection2 = false;
                                            },
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          elevation: 5.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                        child: const Center(
                                          child: SmallTextWidget(
                                            text: 'Generate New EazyBudget',
                                            fontWeight: FontWeight.w600,
                                            textColor: 0xffffffff,
                                            fontsize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Visibility(
                                    visible: tutorialContinueVisibility,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: const SweepGradient(
                                          colors: [
                                            Color(0xff151515),
                                            Color(0xff1f2c25)
                                          ],
                                          stops: [0.25, 0.75],
                                          center: Alignment.bottomRight,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      width: 350 * screenScaling(context),
                                      height: 56,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(
                                            () {
                                              isVisibleCalculations = false;
                                              isVisibleGenerateEazyBudgetForm =
                                                  false;
                                              isVisibleFirstMessage = true;
                                              isVisibleEazyBudgetProgressBar =
                                                  true;
                                              isVisibleSven3Correction1 = false;
                                              isVisibleSven3Correction2 = false;
                                              isVisibleSven3 = false;
                                              isVisibleSven4 = true;
                                              generateNewEazyBudgetVisiblity =
                                                  true;
                                            },
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          elevation: 5.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                        child: const Center(
                                          child: SmallTextWidget(
                                            text: 'Continue',
                                            fontWeight: FontWeight.w600,
                                            textColor: 0xffffffff,
                                            fontsize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: continueButtonVisibility,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: const SweepGradient(
                                          colors: [
                                            Color(0xff151515),
                                            Color(0xff1f2c25)
                                          ],
                                          stops: [0.25, 0.75],
                                          center: Alignment.bottomRight,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      width: 350 * screenScaling(context),
                                      height: 56,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(
                                            () {
                                              isVisibleCalculations = false;
                                              isVisibleGenerateEazyBudgetForm =
                                                  false;
                                              isVisibleFirstMessage = true;
                                              isVisibleEazyBudgetProgressBar =
                                                  true;
                                              isVisibleSven3Correction1 = false;
                                              isVisibleSven3Correction2 = false;
                                              isVisibleSven3 = false;
                                              continueButtonVisibility = false;
                                              cancelGenerateNewEazyBudgetVisiblity =
                                                  false;
                                              generateNewEazyBudgetVisiblity =
                                                  true;
                                              calculateMiscellaneous();
                                              calculateMiscellaneous();
                                              calculateSavings();
                                            },
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          elevation: 5.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                        child: const Center(
                                          child: SmallTextWidget(
                                            text: 'Continue',
                                            fontWeight: FontWeight.w600,
                                            textColor: 0xffffffff,
                                            fontsize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                                  .animate()
                                  .shimmer(delay: 3.seconds)
                                  .slideY(
                                      delay: 1.5.seconds,
                                      duration: 1.25.seconds)
                                  .fadeIn(delay: 1.5.seconds),
                            ),
                            const SizedBox(height: 10)
                          ],
                        ).animate().fadeIn(delay: 5.milliseconds),
                      ),
                      Visibility(
                        visible: isVisibleGenerateEazyBudgetButton,
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: SweepGradient(
                                  colors: [
                                    const Color(0xff1f2c25).withOpacity(0.8),
                                    const Color(0xffc9ff99).withOpacity(0.8)
                                  ],
                                  stops: const [0.2, 0.75],
                                  center: Alignment.topRight,
                                ),
                                borderRadius: BorderRadius.circular(15)),
                            width: 350 * screenScaling(context),
                            height: 56,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(
                                  () {
                                    isVisibleGenerateEazyBudgetButton = false;
                                    isVisibleGenerateEazyBudgetForm = true;
                                    isVisibleGenerateEazyBudget2 = true;
                                    tutorialContinueVisibility = true;
                                    isVisibleSven1 = false;
                                    isVisibleSven2 = true;
                                  },
                                );
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
                                  text: 'Generate EazyBudget',
                                  fontWeight: FontWeight.w600,
                                  textColor: 0xffffffff,
                                  fontsize: 16,
                                ),
                              ),
                            ),
                          )
                              .animate()
                              .fadeIn(duration: 700.milliseconds)
                              .shimmer(delay: 1.seconds),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Visibility(
                        visible: isVisibleAddPaymentButton,
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: const SweepGradient(
                                  colors: [
                                    Color(0xff1f2c25),
                                    Color(0xffc9ff99)
                                  ],
                                  stops: [0.2, 0.75],
                                  center: Alignment.topRight,
                                ),
                                borderRadius: BorderRadius.circular(15)),
                            width: 350 * screenScaling(context),
                            height: 56,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(
                                  () {
                                    isVisiblePaymentForm = true;
                                    isVisibleAddPaymentButton = false;
                                    isVisibleSven4 = false;
                                    isVisibleSven5 = true;
                                  },
                                );
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
                                  text: 'Add Payment',
                                  fontWeight: FontWeight.w600,
                                  textColor: 0xffffffff,
                                  fontsize: 16,
                                ),
                              ),
                            ),
                          )
                              .animate()
                              .shimmer(duration: 1.5.seconds)
                              .fadeIn(duration: 1.seconds),
                        ),
                      ),
                      Visibility(
                        visible: totalExpenditureVisiblity,
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: BigTextWidget(
                                  text: 'Total expenditure:',
                                  weight: FontWeight.bold,
                                  fontsize: 20),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: SmallTextWidget(
                                text:
                                    '\$ ${total.toStringAsFixed(2)}', // should return the total from the lists
                                fontWeight: FontWeight.bold,
                                textColor: 0xffc9ff99,
                                fontsize: 25,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: const SweepGradient(
                                    colors: [
                                      Color(0xff151515),
                                      Color(0xff1f2c25)
                                    ],
                                    stops: [0.25, 0.75],
                                    center: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                width: 350 * screenScaling(context),
                                height: 56,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(
                                      () {
                                        viewDetailsVisiblity = true;
                                        viewDetailsButtonVisiblity = false;
                                      },
                                    );
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
                                      text: 'View details',
                                      fontWeight: FontWeight.w600,
                                      textColor: 0xffffffff,
                                      fontsize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Visibility(
                              visible: viewDetailsVisiblity,
                              child: Column(
                                children: [
                                  const SizedBox(height: 10),
                                  sven(),
                                  const SizedBox(height: 10),
                                  Container(
                                    width: 430,
                                    decoration: BoxDecoration(
                                      gradient: SweepGradient(
                                        colors: [
                                          const Color(0xff151515)
                                              .withOpacity(0.5),
                                          const Color(0xff1f2c25)
                                              .withOpacity(0.5)
                                        ],
                                        stops: const [0.25, 0.75],
                                        center: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(
                                          () {
                                            viewDetailsVisiblity = false;
                                            viewDetailsButtonVisiblity = true;
                                          },
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        elevation: 5.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const SizedBox(height: 10),
                                            const Align(
                                              alignment: Alignment.centerLeft,
                                              child: BigTextWidget(
                                                  text: 'Eazy PieChart',
                                                  weight: FontWeight.bold,
                                                  fontsize: 25),
                                            ),
                                            const PieChartValues(),
                                            SizedBox(
                                              width: 430,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      const SmallTextWidget(
                                                          text: 'Expenses',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          textColor: 0xffffffff,
                                                          fontsize: 12),
                                                      Container(
                                                        height: 30,
                                                        width: 30,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: ColorTween(
                                                            begin: const Color(
                                                                0xff151515),
                                                            end: const Color(
                                                                0xffc9ff99),
                                                          ).lerp(0.75),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      const SmallTextWidget(
                                                          text:
                                                              'Miscellaneous: ',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          textColor: 0xffffffff,
                                                          fontsize: 12),
                                                      Container(
                                                        height: 30,
                                                        width: 30,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: ColorTween(
                                                            begin: const Color(
                                                                0xff151515),
                                                            end: const Color(
                                                                0xffc3a9ff),
                                                          ).lerp(0.75),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      const SmallTextWidget(
                                                          text: 'Savings: ',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          textColor: 0xffffffff,
                                                          fontsize: 12),
                                                      Container(
                                                        height: 30,
                                                        width: 30,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: ColorTween(
                                                            begin: const Color(
                                                                0xff151515),
                                                            end: const Color(
                                                                0xff8dffe4),
                                                          ).lerp(0.75),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            const SmallTextWidget(
                                                text: 'Tap to close details.',
                                                fontWeight: FontWeight.normal,
                                                textColor: 0xffffffff,
                                                fontsize: 10),
                                            const SizedBox(height: 10),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Visibility(
                              visible: reportsButtonVisiblity,
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: const SweepGradient(
                                      colors: [
                                        Color(0xff151515),
                                        Color(0xff1f2c25)
                                      ],
                                      stops: [0.25, 0.75],
                                      center: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  width: 350 * screenScaling(context),
                                  height: 56,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(
                                        () {
                                          svenReportsVisiblity = true;
                                          reportsButtonVisiblity = false;
                                          listLength = createListLength(total);
                                        },
                                      );
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
                                        text: 'Reports',
                                        fontWeight: FontWeight.w600,
                                        textColor: 0xffffffff,
                                        fontsize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: svenReportsVisiblity,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                gradient: SweepGradient(
                                  colors: [
                                    const Color(0xff151515).withOpacity(0.5),
                                    const Color(0xff1f2c25).withOpacity(0.5)
                                  ],
                                  stops: const [0.25, 0.75],
                                  center: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(
                                    () {
                                      svenReportsVisiblity = false;
                                      reportsButtonVisiblity = true;
                                    },
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
                                            'Based on the data I have gathered. Here are some tips to save more and prevent you from spending over your EazyBudget.',
                                            textStyle: const TextStyle(
                                              color: Color(0xffffffff),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Poppins',
                                            ),
                                            speed: const Duration(
                                                milliseconds: 25),
                                          ),
                                        ],
                                        totalRepeatCount: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                gradient: SweepGradient(
                                  colors: [
                                    const Color(0xff151515).withOpacity(0.5),
                                    const Color(0xff1f2c25).withOpacity(0.5)
                                  ],
                                  stops: const [0.25, 0.75],
                                  center: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              width: 430,
                              height: 300,
                              child: ListView.builder(
                                itemCount: listLength,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    width: 380,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: AnimatedTextKit(
                                                  animatedTexts: [
                                                    TypewriterAnimatedText(
                                                      tips[index][0],
                                                      speed: const Duration(
                                                          milliseconds: 20),
                                                      textStyle: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18 *
                                                            screenScaling(
                                                                context),
                                                        color: const Color(
                                                            0xffc9ff99),
                                                      ),
                                                    ),
                                                  ],
                                                  totalRepeatCount: 1,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: AnimatedTextKit(
                                                  animatedTexts: [
                                                    TypewriterAnimatedText(
                                                      tips[index][1],
                                                      speed: const Duration(
                                                          milliseconds: 10),
                                                      textStyle: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 15 *
                                                            screenScaling(
                                                                context),
                                                        color: const Color(
                                                            0xffffffff),
                                                      ),
                                                    ),
                                                  ],
                                                  totalRepeatCount: 1,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: paymentCardsListVisibility,
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const BigTextWidget(
                                    text: 'Payment/s details:',
                                    weight: FontWeight.bold,
                                    fontsize: 20),
                                Stack(
                                  children: [
                                    Visibility(
                                      visible: addPaymentVisiblity,
                                      child: Container(
                                        width: 180 * screenScaling(context),
                                        height: 30,
                                        decoration: BoxDecoration(
                                            gradient: const SweepGradient(
                                              colors: [
                                                Color(0xff1f2c25),
                                                Color(0xffc9ff99)
                                              ],
                                              stops: [0.2, 0.75],
                                              center: Alignment.topRight,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              cardListVisibility = false;
                                              isVisiblePaymentForm = true;
                                              cancelAddPaymentVisibility = true;
                                              addPaymentVisiblity = false;
                                              viewDetailsVisiblity = false;
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.transparent,
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                          child: const SmallTextWidget(
                                              text: 'Add payment',
                                              fontWeight: FontWeight.normal,
                                              textColor: 0xffffffff,
                                              fontsize: 15),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: cancelAddPaymentVisibility,
                                      child: Container(
                                        width: 180 * screenScaling(context),
                                        height: 30,
                                        decoration: BoxDecoration(
                                            gradient: const SweepGradient(
                                              colors: [
                                                Color(0xff1f2c25),
                                                Color(0xffc9ff99)
                                              ],
                                              stops: [0.2, 0.75],
                                              center: Alignment.topRight,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              cardListVisibility = true;
                                              isVisiblePaymentForm = false;
                                              cancelAddPaymentVisibility =
                                                  false;
                                              addPaymentVisiblity = true;
                                              paymentTitle.text = '';
                                              payment.text = '';
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.transparent,
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                          child: const SmallTextWidget(
                                              text: 'Cancel',
                                              fontWeight: FontWeight.normal,
                                              textColor: 0xffffffff,
                                              fontsize: 15),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Visibility(
                              visible: cardListVisibility,
                              child: SizedBox(
                                width: 430,
                                height: cardsListHeight,
                                child: ListView.builder(
                                  itemCount: paymentCardList.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            gradient: SweepGradient(
                                              colors: [
                                                const Color(0xff151515)
                                                    .withOpacity(0.5),
                                                const Color(0xff1f2c25)
                                                    .withOpacity(0.5)
                                              ],
                                              stops: const [0.25, 0.75],
                                              center: Alignment.bottomRight,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          width: 380,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                cardsListHeight -= 165;
                                                double subtractTotal =
                                                    double.tryParse(
                                                            paymentCardList[
                                                                index][1]) ??
                                                        0.0;
                                                total -= subtractTotal;
                                                totalNeeds -= subtractTotal;
                                                paymentCardList.removeAt(index);
                                                if (total < 0) {
                                                  total = 0;
                                                }
                                                if (totalNeeds < 0) {
                                                  totalNeeds = 0;
                                                }
                                              });
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.transparent,
                                              elevation: 5.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        height: 1,
                                                        width: 70,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color:
                                                              Color(0xffffffff),
                                                        ),
                                                      ),
                                                      SmallTextWidget(
                                                          text: paymentCardList[
                                                              index][0],
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          textColor: 0xffc9ff99,
                                                          fontsize: 20),
                                                      Container(
                                                        height: 1,
                                                        width: 70,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color:
                                                              Color(0xffffffff),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const SmallTextWidget(
                                                          text:
                                                              'Payment amount:',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          textColor: 0xffffffff,
                                                          fontsize: 18),
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons
                                                                .attach_money_rounded,
                                                            size: 18,
                                                            color: Color(
                                                                0xffc9ff99),
                                                          ),
                                                          const SizedBox(
                                                              width: 3),
                                                          SmallTextWidget(
                                                              text:
                                                                  paymentCardList[
                                                                      index][1],
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              textColor:
                                                                  0xffc9ff99,
                                                              fontsize: 20),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const SmallTextWidget(
                                                          text: 'Payment due:',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          textColor: 0xffffffff,
                                                          fontsize: 18),
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons
                                                                .calendar_today,
                                                            size: 15,
                                                            color: Colors.white,
                                                          ),
                                                          const SizedBox(
                                                              width: 5),
                                                          Text(
                                                            paymentCardList[
                                                                index][2],
                                                            style:
                                                                const TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 18,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color: Color(
                                                                  0xffc9ff99),
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline,
                                                              decorationColor:
                                                                  Color(
                                                                      0xffc9ff99), // Set the underline color
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const SmallTextWidget(
                                                          text:
                                                              'Tap card to remove',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          textColor: 0xffffffff,
                                                          fontsize: 10),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          const Icon(
                                                            Icons
                                                                .notifications_active,
                                                            size: 15,
                                                            color: Colors.white,
                                                          ),
                                                          const SizedBox(
                                                              width: 5),
                                                          Text(
                                                            paymentCardList[
                                                                index][3],
                                                            style:
                                                                const TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 18,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color: Color(
                                                                  0xffc9ff99),
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline,
                                                              decorationColor:
                                                                  Color(
                                                                      0xffc9ff99), // Set the underline color
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: isVisiblePaymentForm,
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: SweepGradient(
                                      colors: [
                                        const Color(0xff151515)
                                            .withOpacity(0.5),
                                        Color(errorColor).withOpacity(0.5)
                                      ],
                                      stops: const [0.25, 0.75],
                                      center: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {},
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
                                          height: 75,
                                          width: 80,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: ClipOval(
                                            child: Lottie.asset(
                                              'assets/lottie/qBMpUNvnCu.json',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: AnimatedTextKit(
                                            animatedTexts: [
                                              TyperAnimatedText(
                                                errorMessage,
                                                textStyle: const TextStyle(
                                                    color: Color(0xffffffff),
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'Poppins'),
                                                speed: const Duration(
                                                    milliseconds: 25),
                                              ),
                                            ],
                                            totalRepeatCount: 1,
                                            pause: const Duration(
                                                milliseconds: 1000),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                UserInput(
                                    label: 'Payment title',
                                    hiddenLabel: 'Title',
                                    controllerName: paymentTitle,
                                    regExp: r'[a-zA-Z0-9 ]'),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SmallTextWidget(
                                        text: 'Payment amount:',
                                        fontWeight: FontWeight.normal,
                                        textColor: 0xffffffff,
                                        fontsize: 18),
                                    SizedBox(
                                      height: 35,
                                      width: 35,
                                      child: Image.asset(
                                          'assets/images/moneybag.png'),
                                    ),
                                    Row(
                                      children: [
                                        const SmallTextWidget(
                                            text: '\$',
                                            fontWeight: FontWeight.bold,
                                            textColor: 0xffffffff,
                                            fontsize: 20),
                                        const SizedBox(width: 5),
                                        SmallUserInput(
                                            hintLabel: '9,999.99',
                                            textFieldSize: 150,
                                            totalCharacters: 10,
                                            regExp: r'[0-9.]+',
                                            controllerName: payment),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )
                                .animate()
                                .fadeIn(delay: 100.milliseconds)
                                .slideY(delay: 100.milliseconds),
                            const SizedBox(height: 10),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SmallTextWidget(
                                        text: 'Due date:',
                                        fontWeight: FontWeight.normal,
                                        textColor: 0xffffffff,
                                        fontsize: 18),
                                    Stack(
                                      children: [
                                        Visibility(
                                          visible: isVisibleSelectDate,
                                          child: Container(
                                            width: 150 * screenScaling(context),
                                            height: 30,
                                            decoration: BoxDecoration(
                                                gradient: const SweepGradient(
                                                  colors: [
                                                    Color(0xff1f2c25),
                                                    Color(0xffc9ff99)
                                                  ],
                                                  stops: [0.2, 0.75],
                                                  center: Alignment.topRight,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  isVisibleTableCalendar = true;
                                                  isVisibleSelectDate = false;
                                                  isVisibleDueDate = false;
                                                });
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
                                                elevation: 5,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                              ),
                                              child: const SmallTextWidget(
                                                  text: 'Select date',
                                                  fontWeight: FontWeight.normal,
                                                  textColor: 0xffffffff,
                                                  fontsize: 15),
                                            ),
                                          ).animate().fadeIn(
                                              duration: 500.milliseconds),
                                        ),
                                        Visibility(
                                          visible: isVisibleConfirmDueDate,
                                          child: Container(
                                            width: 150 * screenScaling(context),
                                            height: 30,
                                            decoration: BoxDecoration(
                                                gradient: const SweepGradient(
                                                  colors: [
                                                    Color(0xff1f2c25),
                                                    Color(0xffc9ff99)
                                                  ],
                                                  stops: [0.2, 0.75],
                                                  center: Alignment.topRight,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  isVisibleTableCalendar =
                                                      false;
                                                  isVisibleSelectDate = true;
                                                  isVisibleConfirmDueDate =
                                                      false;
                                                  isVisibleDueDate = true;
                                                });
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
                                                elevation: 5,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                              ),
                                              child: const SmallTextWidget(
                                                  text: 'Confirm',
                                                  fontWeight: FontWeight.normal,
                                                  textColor: 0xffffffff,
                                                  fontsize: 15),
                                            ),
                                          ).animate().fadeIn(
                                              duration: 500.milliseconds),
                                        ),
                                      ],
                                    ),
                                    Visibility(
                                      visible: isVisibleDueDate,
                                      child: SmallTextWidget(
                                          text: selectedDate.text,
                                          fontWeight: FontWeight.bold,
                                          textColor: 0xffc9ff99,
                                          fontsize: 18),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: const SweepGradient(
                                      colors: [
                                        Color(0xff151515),
                                        Color(0xff1f2c25),
                                      ],
                                      stops: [0.25, 0.75],
                                      center: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Visibility(
                                    visible: isVisibleTableCalendar,
                                    child: TableCalendar(
                                      firstDay: DateTime.now(),
                                      lastDay: DateTime.utc(2030, 12, 31),
                                      focusedDay: _focusedDay,
                                      headerStyle: const HeaderStyle(
                                        titleCentered: true,
                                        leftChevronIcon: Icon(
                                          Icons.arrow_back_ios,
                                          color: Color(0xffc9ff99),
                                        ),
                                        rightChevronIcon: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Color(0xffc9ff99),
                                        ),
                                        titleTextStyle: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Poppins',
                                          fontSize: 18,
                                        ),
                                        formatButtonVisible: false,
                                      ),
                                      daysOfWeekStyle: const DaysOfWeekStyle(
                                        weekdayStyle:
                                            TextStyle(color: Colors.white),
                                        weekendStyle:
                                            TextStyle(color: Color(0xffc9ff99)),
                                      ),
                                      calendarStyle: const CalendarStyle(
                                        outsideDaysVisible: false,
                                        defaultTextStyle: TextStyle(
                                          color: Color(0xffc9ff99),
                                        ),
                                        outsideTextStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        weekendTextStyle: TextStyle(
                                          color: Color(0xffc9ff99),
                                        ),
                                        selectedDecoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xffc9ff99),
                                        ),
                                        selectedTextStyle: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                      selectedDayPredicate: (day) {
                                        return isSameDay(_selectedDay, day);
                                      },
                                      onDaySelected: (selectedDay, focusedDay) {
                                        setState(() {
                                          _selectedDay = selectedDay;
                                          _focusedDay = selectedDay;
                                          isVisibleConfirmDueDate = true;
                                          selectedDate.text =
                                              '${_selectedDay.year}-${_selectedDay.month}-${_selectedDay.day}';
                                        });
                                      },
                                      calendarFormat: _calendarFormat,
                                      onFormatChanged: (format) {
                                        setState(() {
                                          _calendarFormat = format;
                                        });
                                      },
                                      onPageChanged: (focusedDay) {
                                        setState(() {
                                          _focusedDay = focusedDay;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )
                                .animate()
                                .fadeIn(delay: 250.milliseconds)
                                .slideY(delay: 250.milliseconds),
                            Column(
                              children: [
                                const SizedBox(height: 10),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: SmallTextWidget(
                                      text: 'When do you want to be reminded?',
                                      fontWeight: FontWeight.normal,
                                      textColor: 0xffffffff,
                                      fontsize: 18),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        gradient: SweepGradient(
                                          colors: [
                                            dayButtonColor31,
                                            dayButtonColor32,
                                          ],
                                          stops: const [0.25, 0.75],
                                          center: Alignment.bottomRight,
                                        ),
                                        borderRadius: BorderRadius.only(
                                            topLeft: const Radius.circular(15),
                                            topRight: const Radius.circular(15),
                                            bottomLeft: Radius.circular(
                                                bottomLeftRight3),
                                            bottomRight: Radius.circular(
                                                bottomLeftRight3)),
                                      ),
                                      width: 120 * screenScaling(context),
                                      height: dayheight3,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            dayButtonColor31 =
                                                const Color(0xff151515);
                                            dayButtonColor32 =
                                                const Color(0xff1f2c25);
                                            dayButtonColor21 =
                                                const Color(0xff1f2c25);
                                            dayButtonColor22 =
                                                const Color(0xffc9ff99);
                                            dayButtonColor11 =
                                                const Color(0xff1f2c25);
                                            dayButtonColor12 =
                                                const Color(0xffc9ff99);
                                            dayheight3 = 50;
                                            dayheight2 = 30;
                                            dayheight1 = 30;
                                            bottomLeftRight3 = 0;
                                            bottomLeftRight2 = 15;
                                            bottomLeftRight1 = 15;
                                            isVisible3 = true;
                                            isVisible2 = false;
                                            isVisible1 = false;
                                            pickedDay.text = '3 days';
                                            isVisibleAddPaymentButtonSubmission =
                                                true;
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft:
                                                    const Radius.circular(15),
                                                topRight:
                                                    const Radius.circular(15),
                                                bottomLeft: Radius.circular(
                                                    bottomLeftRight3),
                                                bottomRight: Radius.circular(
                                                    bottomLeftRight3)),
                                          ),
                                        ),
                                        child: const SmallTextWidget(
                                            text: '3 Days',
                                            fontWeight: FontWeight.bold,
                                            textColor: 0xffffffff,
                                            fontsize: 15),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        gradient: SweepGradient(
                                          colors: [
                                            dayButtonColor21,
                                            dayButtonColor22,
                                          ],
                                          stops: const [0.25, 0.75],
                                          center: Alignment.bottomRight,
                                        ),
                                        borderRadius: BorderRadius.only(
                                            topLeft: const Radius.circular(15),
                                            topRight: const Radius.circular(15),
                                            bottomLeft: Radius.circular(
                                                bottomLeftRight2),
                                            bottomRight: Radius.circular(
                                                bottomLeftRight2)),
                                      ),
                                      width: 120 * screenScaling(context),
                                      height: dayheight2,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            dayButtonColor31 =
                                                const Color(0xff1f2c25);
                                            dayButtonColor32 =
                                                const Color(0xffc9ff99);
                                            dayButtonColor21 =
                                                const Color(0xff151515);
                                            dayButtonColor22 =
                                                const Color(0xff1f2c25);
                                            dayButtonColor11 =
                                                const Color(0xff1f2c25);
                                            dayButtonColor12 =
                                                const Color(0xffc9ff99);
                                            dayheight3 = 30;
                                            dayheight2 = 50;
                                            dayheight1 = 30;
                                            bottomLeftRight3 = 15;
                                            bottomLeftRight2 = 0;
                                            bottomLeftRight1 = 15;
                                            isVisible3 = false;
                                            isVisible2 = true;
                                            isVisible1 = false;
                                            pickedDay.text = '2 days';
                                            isVisibleAddPaymentButtonSubmission =
                                                true;
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft:
                                                    const Radius.circular(15),
                                                topRight:
                                                    const Radius.circular(15),
                                                bottomLeft: Radius.circular(
                                                    bottomLeftRight2),
                                                bottomRight: Radius.circular(
                                                    bottomLeftRight2)),
                                          ),
                                        ),
                                        child: const SmallTextWidget(
                                            text: '2 Days',
                                            fontWeight: FontWeight.bold,
                                            textColor: 0xffffffff,
                                            fontsize: 15),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        gradient: SweepGradient(
                                          colors: [
                                            dayButtonColor11,
                                            dayButtonColor12,
                                          ],
                                          stops: const [0.25, 0.75],
                                          center: Alignment.bottomRight,
                                        ),
                                        borderRadius: BorderRadius.only(
                                            topLeft: const Radius.circular(15),
                                            topRight: const Radius.circular(15),
                                            bottomLeft: Radius.circular(
                                                bottomLeftRight1),
                                            bottomRight: Radius.circular(
                                                bottomLeftRight1)),
                                      ),
                                      width: 120 * screenScaling(context),
                                      height: dayheight1,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            dayButtonColor31 =
                                                const Color(0xff1f2c25);
                                            dayButtonColor32 =
                                                const Color(0xffc9ff99);
                                            dayButtonColor21 =
                                                const Color(0xff1f2c25);
                                            dayButtonColor22 =
                                                const Color(0xffc9ff99);
                                            dayButtonColor11 =
                                                const Color(0xff151515);
                                            dayButtonColor12 =
                                                const Color(0xff1f2c25);
                                            dayheight3 = 30;
                                            dayheight2 = 30;
                                            dayheight1 = 50;
                                            bottomLeftRight3 = 15;
                                            bottomLeftRight2 = 15;
                                            bottomLeftRight1 = 0;
                                            isVisible3 = false;
                                            isVisible2 = false;
                                            isVisible1 = true;
                                            pickedDay.text = '1 day';
                                            isVisibleAddPaymentButtonSubmission =
                                                true;
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft:
                                                    const Radius.circular(15),
                                                topRight:
                                                    const Radius.circular(15),
                                                bottomLeft: Radius.circular(
                                                    bottomLeftRight1),
                                                bottomRight: Radius.circular(
                                                    bottomLeftRight1)),
                                          ),
                                        ),
                                        child: const SmallTextWidget(
                                            text: '1 Day',
                                            fontWeight: FontWeight.bold,
                                            textColor: 0xffffffff,
                                            fontsize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                                .animate()
                                .fadeIn(delay: 500.milliseconds)
                                .slideY(delay: 500.milliseconds),
                            Visibility(
                              visible: isVisible3,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: const SweepGradient(
                                    colors: [
                                      Color(0xff151515),
                                      Color(0xff1f2c25)
                                    ],
                                    stops: [0.25, 0.75],
                                    center: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                width: 430 * screenScaling(context),
                                height: 100,
                                child: ElevatedButton(
                                  onPressed: () {},
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
                                              message3,
                                              textStyle: TextStyle(
                                                  color:
                                                      const Color(0xffffffff),
                                                  fontSize: 15 *
                                                      screenScaling(context),
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Poppins'),
                                              speed: const Duration(
                                                  milliseconds: 30),
                                            ),
                                          ],
                                          totalRepeatCount: 1,
                                          pause: const Duration(
                                              milliseconds: 2500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ).animate().fadeIn().slideY(),
                            ),
                            Visibility(
                              visible: isVisible2,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: const SweepGradient(
                                    colors: [
                                      Color(0xff151515),
                                      Color(0xff1f2c25)
                                    ],
                                    stops: [0.25, 0.75],
                                    center: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                width: 430 * screenScaling(context),
                                height: 100,
                                child: ElevatedButton(
                                  onPressed: () {},
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
                                              message2,
                                              textStyle: TextStyle(
                                                  color:
                                                      const Color(0xffffffff),
                                                  fontSize: 15 *
                                                      screenScaling(context),
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Poppins'),
                                              speed: const Duration(
                                                  milliseconds: 30),
                                            ),
                                          ],
                                          totalRepeatCount: 1,
                                          pause: const Duration(
                                              milliseconds: 2500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ).animate().fadeIn().slideY(),
                            ),
                            Visibility(
                              visible: isVisible1,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: const SweepGradient(
                                    colors: [
                                      Color(0xff151515),
                                      Color(0xff1f2c25)
                                    ],
                                    stops: [0.25, 0.75],
                                    center: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                width: 430 * screenScaling(context),
                                height: 100,
                                child: ElevatedButton(
                                  onPressed: () {},
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
                                              message1,
                                              textStyle: TextStyle(
                                                  color:
                                                      const Color(0xffffffff),
                                                  fontSize: 15 *
                                                      screenScaling(context),
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Poppins'),
                                              speed: const Duration(
                                                  milliseconds: 30),
                                            ),
                                          ],
                                          totalRepeatCount: 1,
                                          pause: const Duration(
                                              milliseconds: 2500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ).animate().fadeIn().slideY(),
                            ),
                            const SizedBox(height: 10),
                            Visibility(
                              visible: isVisibleAddPaymentButtonSubmission,
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                      gradient: const SweepGradient(
                                        colors: [
                                          Color(0xff1f2c25),
                                          Color(0xffc9ff99)
                                        ],
                                        stops: [0.2, 0.75],
                                        center: Alignment.topRight,
                                      ),
                                      borderRadius: BorderRadius.circular(15)),
                                  width: 350 * screenScaling(context),
                                  height: 56,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (paymentTitle.text == '') {
                                        setState(() {
                                          errorColor = 0xffff0505;
                                          errorMessage =
                                              'Missing payment title. Please add a title.';
                                        });
                                      } else if (paymentTitle.text == '' &&
                                          payment.text == '') {
                                        setState(() {
                                          errorColor = 0xffff0505;
                                          errorMessage =
                                              'Missing payment title and payment amount. Please add a title and amount.';
                                        });
                                      } else if (paymentTitle.text == '' &&
                                          payment.text == '' &&
                                          selectedDate.text == '') {
                                        errorColor = 0xffff0505;
                                        errorMessage =
                                            'Missing payment title, payment amount, and payment due date. Please add a title, amount, and confirm due date.';
                                      } else if (paymentTitle.text == '' &&
                                          payment.text == '' &&
                                          selectedDate.text == '' &&
                                          pickedDay.text == '') {
                                        errorColor = 0xffff0505;
                                        errorMessage =
                                            'Missing payment title, payment amount, payment due date, and reminder. Please add a title, amount, confirm due date, and set a reminder.';
                                      } else if (payment.text == '') {
                                        errorColor = 0xffff0505;
                                        setState(() {
                                          errorMessage =
                                              'Missing payment amount. Please add amount.';
                                        });
                                      } else if (selectedDate.text == '') {
                                        errorColor = 0xffff0505;
                                        setState(() {
                                          errorMessage =
                                              'Missing due date. Please confirm due date.';
                                        });
                                      } else if (pickedDay.text == '') {
                                        errorColor = 0xffff0505;
                                        setState(() {
                                          errorMessage =
                                              'Missing reminder. Please set a reminder.';
                                        });
                                      } else if (paymentTitle.text == '' &&
                                          selectedDate.text == '') {
                                        errorColor = 0xffff0505;
                                        setState(() {
                                          errorMessage =
                                              'Missing payment title and due date. Please add a title and confirm due date.';
                                        });
                                      } else if (paymentTitle.text == '' &&
                                          pickedDay.text == '') {
                                        errorColor = 0xffff0505;
                                        setState(() {
                                          errorMessage =
                                              'Missing payment title and reminder. Please add a title and set a reminder.';
                                        });
                                      } else if (paymentTitle.text == '' &&
                                          payment.text == '' &&
                                          pickedDay.text == '') {
                                        errorColor = 0xffff0505;
                                        setState(() {
                                          errorMessage =
                                              'Missing payment title, payment amount, and reminder. Please add a title, amount and set a reminder.';
                                        });
                                      } else {
                                        setState(
                                          () {
                                            isVisiblePaymentForm = false;
                                            isVisiblePercentageBar = true;
                                            List<String> newCard = [
                                              paymentTitle.text,
                                              payment.text,
                                              selectedDate.text,
                                              pickedDay.text
                                            ];
                                            paymentCardList.add(newCard);
                                            totalExpenditureVisiblity = true;
                                            paymentCardsListVisibility = true;
                                            transactionsListVisiblity = true;
                                            cardListVisibility = true;
                                            total +=
                                                double.tryParse(payment.text) ??
                                                    0.0;
                                            totalNeeds +=
                                                double.tryParse(payment.text) ??
                                                    0.0;
                                            calculatePercentBar(total);
                                            paymentTitle.text = '';
                                            payment.text = '';
                                            selectedDate.text = '';
                                            pickedDay.text = '';
                                            dayButtonColor31 =
                                                const Color(0xff1f2c25);
                                            dayButtonColor32 =
                                                const Color(0xffc9ff99);
                                            dayButtonColor21 =
                                                const Color(0xff1f2c25);
                                            dayButtonColor22 =
                                                const Color(0xffc9ff99);
                                            dayButtonColor11 =
                                                const Color(0xff1f2c25);
                                            dayButtonColor12 =
                                                const Color(0xffc9ff99);
                                            dayheight3 = 30;
                                            dayheight2 = 30;
                                            dayheight1 = 30;
                                            bottomLeftRight3 = 15;
                                            bottomLeftRight2 = 15;
                                            bottomLeftRight1 = 15;
                                            isVisible3 = false;
                                            isVisible2 = false;
                                            isVisible1 = false;
                                            addTransactionButtonVisibility =
                                                true;
                                            addPaymentVisiblity = true;
                                            isVisibleAddPaymentButtonSubmission =
                                                false;
                                            isVisibleCompanyLogo = true;
                                            cardsListHeight += 165;
                                            cancelAddPaymentVisibility = false;
                                            reportsButtonVisiblity = true;
                                            viewDetailsButtonVisiblity = true;
                                            isVisibleSven6 = true;
                                          },
                                        );
                                      }
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
                                        text: 'Add Payment',
                                        fontWeight: FontWeight.w600,
                                        textColor: 0xffffffff,
                                        fontsize: 16,
                                      ),
                                    ),
                                  ),
                                )
                                    .animate()
                                    .shimmer(duration: 1.5.seconds)
                                    .fadeIn(duration: 1.seconds),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: transactionsListVisiblity,
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const BigTextWidget(
                                    text: 'Transaction/s:',
                                    weight: FontWeight.bold,
                                    fontsize: 20),
                                Stack(
                                  children: [
                                    Visibility(
                                      visible:
                                          cancelAddTransactionButtonVisibility,
                                      child: Container(
                                        width: 180 * screenScaling(context),
                                        height: 30,
                                        decoration: BoxDecoration(
                                            gradient: const SweepGradient(
                                              colors: [
                                                Color(0xff1f2c25),
                                                Color(0xffc9ff99)
                                              ],
                                              stops: [0.2, 0.75],
                                              center: Alignment.topRight,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              addTransactionButtonVisibility =
                                                  true;
                                              cancelAddTransactionButtonVisibility =
                                                  false;
                                              addTransactionFormvisibility =
                                                  false;
                                              transactionName.text = '';
                                              transactionAmount.text = '';
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.transparent,
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                          child: const SmallTextWidget(
                                              text: 'Cancel',
                                              fontWeight: FontWeight.normal,
                                              textColor: 0xffffffff,
                                              fontsize: 15),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: addTransactionButtonVisibility,
                                      child: Container(
                                        width: 180 * screenScaling(context),
                                        height: 30,
                                        decoration: BoxDecoration(
                                            gradient: const SweepGradient(
                                              colors: [
                                                Color(0xff1f2c25),
                                                Color(0xffc9ff99)
                                              ],
                                              stops: [0.2, 0.75],
                                              center: Alignment.topRight,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              cancelAddTransactionButtonVisibility =
                                                  true;
                                              addTransactionButtonVisibility =
                                                  false;
                                              addTransactionFormvisibility =
                                                  true;
                                              viewDetailsVisiblity = false;
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.transparent,
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                          child: const SmallTextWidget(
                                              text: 'Add transaction',
                                              fontWeight: FontWeight.normal,
                                              textColor: 0xffffffff,
                                              fontsize: 15),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            Visibility(
                              visible: addTransactionFormvisibility,
                              child: SizedBox(
                                width: 430 * screenScaling(context),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 160 * screenScaling(context),
                                          child: Column(
                                            children: [
                                              const Align(
                                                alignment: Alignment.centerLeft,
                                                child: SmallTextWidget(
                                                  text: 'Transaction name',
                                                  fontWeight: FontWeight.normal,
                                                  textColor: 0xffffffff,
                                                  fontsize: 15,
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              SmallUserInput(
                                                hintLabel: 'Name',
                                                textFieldSize: 180 *
                                                    screenScaling(context),
                                                totalCharacters: 12,
                                                regExp: r'[a-zA-Z0-9 ]',
                                                controllerName: transactionName,
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 160 * screenScaling(context),
                                          child: Column(
                                            children: [
                                              const Align(
                                                alignment: Alignment.centerLeft,
                                                child: SmallTextWidget(
                                                  text: 'Amount',
                                                  fontWeight: FontWeight.normal,
                                                  textColor: 0xffffffff,
                                                  fontsize: 15,
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              SmallUserInput(
                                                  hintLabel: '9,999.99',
                                                  textFieldSize: 150,
                                                  totalCharacters: 10,
                                                  regExp: r'[0-9.]+',
                                                  controllerName:
                                                      transactionAmount),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            gradient: const SweepGradient(
                                              colors: [
                                                Color(0xff1f2c25),
                                                Color(0xffc9ff99)
                                              ],
                                              stops: [0.2, 0.75],
                                              center: Alignment.topRight,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        width: 350 * screenScaling(context),
                                        height: 56,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(
                                              () {
                                                List<String> newTransaction = [
                                                  transactionName.text,
                                                  transactionAmount.text
                                                ];
                                                transactionList
                                                    .add(newTransaction);
                                                addTransactionFormvisibility =
                                                    false;
                                                cancelAddTransactionButtonVisibility =
                                                    false;
                                                addTransactionButtonVisibility =
                                                    true;
                                                total += double.tryParse(
                                                        transactionAmount
                                                            .text) ??
                                                    0.0;
                                                totalWants += double.tryParse(
                                                        transactionAmount
                                                            .text) ??
                                                    0.0;
                                                calculatePercentBar(total);
                                                transactionListHeight += 48;
                                                transactionName.text = '';
                                                transactionAmount.text = '';
                                              },
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.transparent,
                                            elevation: 5.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                          child: const Center(
                                            child: SmallTextWidget(
                                              text: 'Add transaction',
                                              fontWeight: FontWeight.w600,
                                              textColor: 0xffffffff,
                                              fontsize: 16,
                                            ),
                                          ),
                                        ),
                                      )
                                          .animate()
                                          .shimmer(duration: 1.5.seconds)
                                          .fadeIn(duration: 1.seconds),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: 430,
                              height: transactionListHeight,
                              child: ListView.builder(
                                itemCount: transactionList.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      gradient: SweepGradient(
                                        colors: [
                                          const Color(0xff151515)
                                              .withOpacity(0.5),
                                          const Color(0xff1f2c25)
                                              .withOpacity(0.5)
                                        ],
                                        stops: const [0.25, 0.75],
                                        center: Alignment.bottomRight,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    width: 380,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          transactionListHeight -= 48;
                                          double subtractTotal =
                                              double.tryParse(
                                                      transactionList[index]
                                                          [1]) ??
                                                  0.0;
                                          total -= subtractTotal;
                                          totalWants -= subtractTotal;
                                          transactionList.removeAt(index);
                                          if (total < 0) {
                                            total = 0;
                                          }
                                          if (totalWants < 0) {
                                            totalWants = 0;
                                          }
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        elevation: 5.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SmallTextWidget(
                                                        text: transactionList[
                                                            index][0],
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        textColor: 0xffffffff,
                                                        fontsize: 18),
                                                    const SmallTextWidget(
                                                        text: 'Tap to remove',
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        textColor: 0xffffffff,
                                                        fontsize: 10),
                                                    SmallTextWidget(
                                                        text:
                                                            '\$ -${transactionList[index][1]}',
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        textColor: 0xffffffff,
                                                        fontsize: 18)
                                                  ],
                                                ),
                                                const SizedBox(height: 5),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
