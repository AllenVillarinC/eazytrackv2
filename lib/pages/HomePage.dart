import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:eazytrackv2/components/0_Company.dart';
import 'package:eazytrackv2/components/1_ScreenScale.dart';
import 'package:eazytrackv2/components/Controllers.dart';
import 'package:eazytrackv2/components/GreenLongButton.dart';
import 'package:eazytrackv2/components/Methods.dart';
import 'package:eazytrackv2/components/T_BigText.dart';
import 'package:eazytrackv2/components/T_SmallText.dart';
import 'package:eazytrackv2/components/UI_SmallUserInput.dart';
import 'package:eazytrackv2/components/UI_UserInput.dart';
import 'package:eazytrackv2/components/sven.dart';
import 'package:eazytrackv2/pages/user_reports_page.dart';
import 'package:eazytrackv2/pages/view_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:rive/rive.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // bool isVisibleGenerateEazyBudgetButton = false;
  // bool isVisibleAddPaymentButton = false;
  // bool isVisibleFirstMessage = false;
  // bool isVisibleGenerateEazyBudgetForm = false;
  // bool isVisibleCalculations = false;
  // bool isVisibleGenerateEazyBudget2 = false;
  // bool isVisibleEazyBudgetProgressBar = false;
  // bool isVisibleSven1 = true;
  // bool isVisibleSven2 = false;
  // bool isVisibleSven3 = false;
  // bool isVisibleSven3Correction1 = false;
  // bool isVisibleSven3Correction2 = false;
  // bool isVisibleValueCorrection1 = false;
  // bool isVisibleValueCorrection2 = false;
  // bool isVisibleSven4 = false;
  // bool isVisibleSven5 = false;
  // bool isVisibleCompanyLogo = false;
  // bool isVisible3 = false;
  // bool isVisible2 = false;
  // bool isVisible1 = false;
  // bool isVisiblePaymentForm = false;
  // bool isVisibleSecondMessage = false;
  // bool isVisibleAddPaymentButtonSubmission = false;
  // bool isVisibleConfirmDueDate = false;
  // bool isVisibleTableCalendar = false;
  // bool isVisibleSelectDate = true;
  // bool isVisibleDueDate = false;
  // bool isVisiblePercentageBar = false;

  bool isVisibleGenerateEazyBudgetButton = false;
  bool isVisibleAddPaymentButton = false;
  bool isVisibleFirstMessage = false;
  bool isVisibleGenerateEazyBudgetForm = false;
  bool isVisibleCalculations = false;
  bool isVisibleGenerateEazyBudget2 = false;
  bool isVisibleEazyBudgetProgressBar = false;
  bool isVisibleSven1 = false;
  bool isVisibleSven2 = false;
  bool isVisibleSven3 = false;
  bool isVisibleSven3Correction1 = false;
  bool isVisibleSven3Correction2 = false;
  bool isVisibleValueCorrection1 = false;
  bool isVisibleValueCorrection2 = false;
  bool isVisibleSven4 = false;
  bool isVisibleSven5 = false;
  bool isVisibleCompanyLogo = false;
  bool isVisible3 = false;
  bool isVisible2 = false;
  bool isVisible1 = false;
  bool isVisiblePaymentForm = false;
  bool isVisibleSecondMessage = false;
  bool isVisibleAddPaymentButtonSubmission = false;
  bool isVisibleConfirmDueDate = false;
  bool isVisibleTableCalendar = false;
  bool isVisibleSelectDate = false;
  bool isVisibleDueDate = false;
  bool isVisiblePercentageBar = false;

  Color dayButtonColor31 = const Color(0xff1f2c25);
  Color dayButtonColor32 = const Color(0xffc9ff99);
  Color dayButtonColor21 = const Color(0xff1f2c25);
  Color dayButtonColor22 = const Color(0xffc9ff99);
  Color dayButtonColor11 = const Color(0xff1f2c25);
  Color dayButtonColor12 = const Color(0xffc9ff99);

  double dayheight3 = 30;
  double dayheight2 = 30;
  double dayheight1 = 30;

  double bottomLeftRight3 = 15;
  double bottomLeftRight2 = 15;
  double bottomLeftRight1 = 15;

  String message3 = 'Gotcha, I will remind you 3 days before the due date.';
  String message2 = 'Noted, I will remind you 2 days before the due date.';
  String message1 = 'Roger that, I will remind you a day before the due date.';

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
                height: 930,
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
                        child: svenTutorial1(
                          () {
                            activateButton1();
                          },
                        )
                            .animate()
                            .shimmer(
                                delay: 500.milliseconds,
                                duration: 500.milliseconds)
                            .fade(),
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
                      const SizedBox(height: 15),
                      Visibility(
                        visible: isVisibleFirstMessage,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: const BigTextWidget(
                            text: 'Your remaining EazyBudget:',
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
                      const SizedBox(height: 15),
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
                              .scaleXY(duration: 700.milliseconds)
                              .shimmer(delay: 1.seconds),
                        ),
                      ),
                      Visibility(
                        visible: isVisibleGenerateEazyBudgetForm,
                        child: Column(
                          children: [
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
                                  .shimmer(
                                      delay: 500.milliseconds,
                                      duration: 500.milliseconds)
                                  .fade(),
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
                                          text: calculateEazyBudget(),
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
                                  Container(
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
                                ],
                              )
                                  .animate()
                                  .shimmer(delay: 3.seconds)
                                  .slideY(
                                      delay: 1.5.seconds,
                                      duration: 1.25.seconds)
                                  .fadeIn(delay: 1.5.seconds),
                            ),
                          ],
                        ).animate().fadeIn(delay: 5.milliseconds),
                      ),
                      Visibility(
                        visible: isVisibleEazyBudgetProgressBar,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SmallTextWidget(
                                    text: calculateBudgetDifference(),
                                    fontWeight: FontWeight.bold,
                                    textColor: 0xffc9ff99,
                                    fontsize: 25),
                                Container(
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
                                      borderRadius: BorderRadius.circular(15)),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {});
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: const BorderSide(
                                          color: Color(0xff000000),
                                          width: 0.5,
                                        ),
                                      ),
                                    ),
                                    child: const SmallTextWidget(
                                        text: 'Generate New EazyBudget',
                                        fontWeight: FontWeight.normal,
                                        textColor: 0xffffffff,
                                        fontsize: 15),
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
                                        width: calculatePercentBar(),
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
                                  text: calculateEazyBudget(),
                                  fontWeight: FontWeight.bold,
                                  textColor: 0xffffffff,
                                  fontsize: 25,
                                ),
                              ],
                            ),
                          ],
                        ).animate().fadeIn(delay: 0.5.seconds),
                      ),
                      const SizedBox(height: 15),
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
                                    isVisibleSecondMessage = true;
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
                      const SizedBox(height: 10),
                      Visibility(
                        visible: isVisibleSecondMessage,
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: BigTextWidget(
                              text: 'Payment details:',
                              weight: FontWeight.bold,
                              fontsize: 20),
                        ),
                      )
                          .animate()
                          .fadeIn(delay: 80.milliseconds)
                          .slideY(delay: 80.milliseconds),
                      const SizedBox(height: 10),
                      Visibility(
                        visible: isVisiblePaymentForm,
                        child: Column(
                          children: [
                            Column(
                              children: [
                                UserInput(
                                    label: 'Payment title',
                                    hiddenLabel: 'Title',
                                    controllerName: paymentTitle,
                                    regExp: r'[a-zA-Z ]+'),
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
                                              isVisibleConfirmDueDate = true;
                                              isVisibleDueDate = false;
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.transparent,
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              side: const BorderSide(
                                                color: Color(0xff000000),
                                                width: 0.5,
                                              ),
                                            ),
                                          ),
                                          child: const SmallTextWidget(
                                              text: 'Select date',
                                              fontWeight: FontWeight.normal,
                                              textColor: 0xffffffff,
                                              fontsize: 15),
                                        ),
                                      )
                                          .animate()
                                          .fadeIn(duration: 500.milliseconds),
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
                                              isVisibleTableCalendar = false;
                                              isVisibleSelectDate = true;
                                              isVisibleConfirmDueDate = false;
                                              isVisibleDueDate = true;
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.transparent,
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              side: const BorderSide(
                                                color: Color(0xff000000),
                                                width: 0.5,
                                              ),
                                            ),
                                          ),
                                          child: const SmallTextWidget(
                                              text: 'Confirm',
                                              fontWeight: FontWeight.normal,
                                              textColor: 0xffffffff,
                                              fontsize: 15),
                                        ),
                                      )
                                          .animate()
                                          .fadeIn(duration: 500.milliseconds),
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
                            const SizedBox(height: 10),
                            Column(
                              children: [
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
                                      setState(
                                        () {
                                          calculatePercentBar();
                                          isVisiblePaymentForm = false;
                                          // isVisiblePaymentDetails = true;
                                          isVisiblePercentageBar = true;
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
                          ],
                        ),
                      ),
                      const BigTextWidget(
                          text: 'Total expenditure:',
                          weight: FontWeight.bold,
                          fontsize: 20),
                      SmallTextWidget(
                        text: '\$ ${payment.text}',
                        fontWeight: FontWeight.bold,
                        textColor: 0xffc9ff99,
                        fontsize: 25,
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const SweepGradient(
                              colors: [Color(0xff151515), Color(0xff1f2c25)],
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
                                () {},
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
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const SweepGradient(
                              colors: [Color(0xff151515), Color(0xff1f2c25)],
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
                                () {},
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
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const BigTextWidget(
                              text: 'Payment/s details:',
                              weight: FontWeight.bold,
                              fontsize: 20),
                          Container(
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
                                setState(() {});
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: const BorderSide(
                                    color: Color(0xff000000),
                                    width: 0.5,
                                  ),
                                ),
                              ),
                              child: const SmallTextWidget(
                                  text: 'Add payment',
                                  fontWeight: FontWeight.normal,
                                  textColor: 0xffffffff,
                                  fontsize: 15),
                            ),
                          ),
                        ],
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
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      height: 1,
                                      width: 70,
                                      decoration: const BoxDecoration(
                                          color: Color(0xffffffff))),
                                  SmallTextWidget(
                                      text: paymentTitle.text,
                                      fontWeight: FontWeight.bold,
                                      textColor: 0xffc9ff99,
                                      fontsize: 20),
                                  Container(
                                      height: 1,
                                      width: 70,
                                      decoration: const BoxDecoration(
                                          color: Color(0xffffffff))),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SmallTextWidget(
                                      text: 'Payment amount:',
                                      fontWeight: FontWeight.normal,
                                      textColor: 0xffffffff,
                                      fontsize: 18),
                                  SmallTextWidget(
                                      text: '\$ ${payment.text}',
                                      fontWeight: FontWeight.bold,
                                      textColor: 0xffc9ff99,
                                      fontsize: 20),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SmallTextWidget(
                                      text: 'Payment due:',
                                      fontWeight: FontWeight.normal,
                                      textColor: 0xffffffff,
                                      fontsize: 18),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.calendar_today,
                                        color: Color(0xffc9ff99),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        selectedDate.text,
                                        style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 18,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffc9ff99),
                                          decoration: TextDecoration.underline,
                                          decorationColor: Color(
                                              0xffc9ff99), // Set the underline color
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Icon(
                                    Icons.notifications_active,
                                    color: Color(0xffc9ff99),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    pickedDay.text,
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffc9ff99),
                                      decoration: TextDecoration.underline,
                                      decorationColor: Color(
                                          0xffc9ff99), // Set the underline color
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const BigTextWidget(
                              text: 'Transactions:',
                              weight: FontWeight.bold,
                              fontsize: 20),
                          Container(
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
                                setState(() {});
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: const BorderSide(
                                    color: Color(0xff000000),
                                    width: 0.5,
                                  ),
                                ),
                              ),
                              child: const SmallTextWidget(
                                  text: 'Add transaction',
                                  fontWeight: FontWeight.normal,
                                  textColor: 0xffffffff,
                                  fontsize: 15),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallTextWidget(
                              text: 'Walmart',
                              fontWeight: FontWeight.normal,
                              textColor: 0xffffffff,
                              fontsize: 18),
                          SmallTextWidget(
                              text: '-\$ 10.89',
                              fontWeight: FontWeight.normal,
                              textColor: 0xffffffff,
                              fontsize: 18)
                        ],
                      )
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
