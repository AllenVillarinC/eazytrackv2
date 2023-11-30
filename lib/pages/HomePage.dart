import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:eazytrackv2/components/CompanyLogo.dart';
import 'package:eazytrackv2/components/ScreenScale.dart';
import 'package:eazytrackv2/components/Controllers.dart';
import 'package:eazytrackv2/components/Methods.dart';
import 'package:eazytrackv2/components/BigTextWidget.dart';
import 'package:eazytrackv2/components/SmallTextWidget.dart';
import 'package:eazytrackv2/components/SmallUserInputWidget.dart';
import 'package:eazytrackv2/components/BigUserInputWidget.dart';
import 'package:eazytrackv2/components/BarChart.dart';
import 'package:eazytrackv2/components/PieChart.dart';
import 'package:eazytrackv2/components/Sven.dart';
import 'package:eazytrackv2/pages/EditProfilePage.dart';
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
  DateTime _month = DateTime.now();
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
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Lottie.asset(
                  'assets/lottie/Animation - 1701142774656.json',
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Visibility(
                          visible: isVisibleCompanyLogo,
                          child: const CompanyName()
                              .animate()
                              .shimmer(
                                  delay: 500.milliseconds,
                                  duration: 500.milliseconds)
                              .fade()),
                      const SizedBox(height: 10),
                      Visibility(
                        visible: isVisibleSven1,
                        child: svenTutorial1(activateButton1, context)
                            .animate()
                            .shimmer(
                                delay: 500.milliseconds,
                                duration: 500.milliseconds)
                            .fade(),
                      ),
                      Visibility(
                        visible: isVisibleSven4,
                        child: svenTutorial4(activateButton2, context)
                            .animate()
                            .shimmer(
                                delay: 1000.milliseconds,
                                duration: 500.milliseconds)
                            .fade(),
                      ),
                      Visibility(
                        visible: isVisibleSven5,
                        child: svenTutorial5(context)
                            .animate()
                            .shimmer(
                                delay: 1000.milliseconds,
                                duration: 500.milliseconds)
                            .fade(),
                      ),
                      Visibility(
                        visible: isVisibleSven6,
                        child: svenTutorial6(activateButtons, context)
                            .animate()
                            .shimmer(
                                delay: 1000.milliseconds,
                                duration: 500.milliseconds)
                            .fade(),
                      ),
                      Visibility(
                        visible: userButtonVisiblity,
                        child: Center(
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
                            width: 400 * screenScaling(context),
                            height: 55,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditProfilePage()),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 55,
                                    width: 55,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: const ClipOval(
                                      child: RiveAnimation.asset(
                                        'assets/rive/2063-4080-flutter-puzzle-hack-project.riv',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  SizedBox(
                                    height: 55,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: BigTextWidget(
                                            text: '${fname.text} ${lname.text}',
                                            weight: FontWeight.bold,
                                            fontsize: 35,
                                          ),
                                        ),
                                        SmallTextWidget(
                                            text: emailaddress.text,
                                            fontWeight: FontWeight.normal,
                                            textColor: 0xffffffff,
                                            fontsize: 18)
                                      ],
                                    ),
                                  ),
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
                                fontsize: 25,
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
                                height: 35 * screenScaling(context),
                                decoration: BoxDecoration(
                                    gradient: SweepGradient(
                                      colors: [
                                        const Color(0xff1f2c25)
                                            .withOpacity(0.8),
                                        const Color(0xffc9ff99).withOpacity(0.8)
                                      ],
                                      stops: const [0.2, 0.75],
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
                                      isVisibleSven3 = false;
                                      isVisibleSven3 = false;
                                      isVisibleCalculations = false;
                                      isVisibleGenerateEazyBudgetForm = false;
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
                              )
                                  .animate()
                                  .shimmer(
                                      delay: 500.milliseconds,
                                      duration: 500.milliseconds)
                                  .fade(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Visibility(
                        visible: isVisibleSven2,
                        child: svenTutorial2(context)
                            .animate()
                            .shimmer(
                                delay: 500.milliseconds,
                                duration: 500.milliseconds)
                            .fade(),
                      ),
                      Visibility(
                        visible: isVisibleSven3,
                        child: svenTutorial3(context)
                            .animate()
                            .shimmer(
                                delay: 500.milliseconds,
                                duration: 500.milliseconds)
                            .fade(),
                      ),
                      Visibility(
                        visible: isVisibleSven3Correction1,
                        child: svenTutorial3NewBudgetValues1(context)
                            .animate()
                            .shimmer(
                                delay: 500.milliseconds,
                                duration: 500.milliseconds)
                            .fade(),
                      ),
                      Visibility(
                        visible: isVisibleSven3Correction2,
                        child: svenTutorial3NewBudgetValues2(context)
                            .animate()
                            .shimmer(
                                delay: 500.milliseconds,
                                duration: 500.milliseconds)
                            .fade(),
                      ),
                      Visibility(
                        visible: isVisibleEazyBudgetProgressBar,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                        height: 35 * screenScaling(context),
                                        decoration: BoxDecoration(
                                            gradient: SweepGradient(
                                              colors: [
                                                const Color(0xff1f2c25)
                                                    .withOpacity(0.8),
                                                const Color(0xffc9ff99)
                                                    .withOpacity(0.8)
                                              ],
                                              stops: const [0.2, 0.75],
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
                                              tutorialContinueVisibility =
                                                  false;
                                              continueButtonVisibility = true;
                                              isVisibleGenerateEazyBudget2 =
                                                  true;
                                              cancelGenerateNewEazyBudgetVisiblity =
                                                  true;
                                              generateNewEazyBudgetVisiblity =
                                                  false;
                                              viewDetailsVisiblity = false;
                                              viewDetailsButtonVisiblity = true;
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
                                      )
                                          .animate()
                                          .shimmer(
                                              delay: 500.milliseconds,
                                              duration: 500.milliseconds)
                                          .fade(),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          height: 15,
                                          width: 270 * screenScaling(context),
                                          decoration: BoxDecoration(
                                            color: const Color(0xff151515)
                                                .withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        Visibility(
                                          visible: isVisiblePercentageBar,
                                          child: Container(
                                            height: 15,
                                            width: barWidth *
                                                screenScaling(context),
                                            decoration: BoxDecoration(
                                              gradient: SweepGradient(
                                                colors: [
                                                  const Color(0xff1f2c25),
                                                  Color(progressBarColor)
                                                ],
                                                stops: const [0.2, 0.75],
                                                center: Alignment.topRight,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          )
                                              .animate()
                                              .shimmer(
                                                  delay: 500.milliseconds,
                                                  duration: 500.milliseconds)
                                              .fade(),
                                        ),
                                      ],
                                    ),
                                    SmallTextWidget(
                                      text:
                                          '\$ ${calculateEazyBudget().toStringAsFixed(2)}',
                                      fontWeight: FontWeight.normal,
                                      textColor: 0xffffffff,
                                      fontsize: 25,
                                    ),
                                  ],
                                ),
                              ],
                            )
                                .animate()
                                .shimmer(
                                    delay: 500.milliseconds,
                                    duration: 500.milliseconds)
                                .fade(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Visibility(
                        visible: isVisibleGenerateEazyBudgetForm,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.15),
                              borderRadius:
                                  BorderRadiusDirectional.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              children: [
                                Visibility(
                                  visible: errorMessage3,
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 10),
                                      Container(
                                        decoration: BoxDecoration(
                                          gradient: SweepGradient(
                                            colors: [
                                              const Color(0xff151515)
                                                  .withOpacity(0.5),
                                              const Color(0xffff0505)
                                                  .withOpacity(0.5)
                                            ],
                                            stops: const [0.25, 0.75],
                                            center: Alignment.bottomRight,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.transparent,
                                            elevation: 5.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
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
                                              const Expanded(
                                                child: Text(
                                                  'Missing income input. Please add your income.',
                                                  style: TextStyle(
                                                      color: Color(0xffffffff),
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: 'Poppins'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                      .animate()
                                      .shimmer(
                                          delay: 500.milliseconds,
                                          duration: 500.milliseconds)
                                      .fade(),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SmallTextWidget(
                                        text: 'Monthly income:',
                                        fontWeight: FontWeight.normal,
                                        textColor: 0xffffffff,
                                        fontsize:
                                            screenScalingToInt(context, 30)),
                                    Row(
                                      children: [
                                        const SmallTextWidget(
                                            text: '\$',
                                            fontWeight: FontWeight.bold,
                                            textColor: 0xffffffff,
                                            fontsize: 20),
                                        const SizedBox(width: 5),
                                        SizedBox(
                                          width: 130 * screenScaling(context),
                                          child: TextField(
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 20 *
                                                    screenScaling(context)),
                                            controller: rent,
                                            keyboardType: TextInputType.number,
                                            maxLength: 8,
                                            textAlign: TextAlign.right,
                                            decoration: InputDecoration(
                                              hintText: '9999.99',
                                              counterText: '',
                                              hintStyle: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize:
                                                    20 * screenScaling(context),
                                                color: const Color(0xff000000)
                                                    .withOpacity(0.7),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Color(0xff0081B3),
                                                    width: 2.0),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Color(0xffffffff),
                                                    width: 2.0),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                          ),
                                        ),
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
                                        gradient: SweepGradient(
                                          colors: [
                                            const Color(0xff1f2c25)
                                                .withOpacity(0.8),
                                            const Color(0xffc9ff99)
                                                .withOpacity(0.8)
                                          ],
                                          stops: const [0.2, 0.75],
                                          center: Alignment.topRight,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    width: 350 * screenScaling(context),
                                    height: 60 * screenScaling(context),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (rent.text == '') {
                                          setState(() {
                                            errorMessage3 = true;
                                          });
                                        } else {
                                          setState(
                                            () {
                                              isVisibleCalculations = true;
                                              isVisibleGenerateEazyBudget2 =
                                                  false;
                                              isVisibleValueCorrection1 = true;
                                              isVisibleSven2 = false;
                                              isVisibleSven3 = true;
                                              calculateMonthlyExpenses();
                                              calculateMiscellaneous();
                                              calculateSavings();
                                              needs = double.tryParse(
                                                      calculateMonthlyExpenses()) ??
                                                  0.0;
                                              wants = double.tryParse(
                                                      calculateMiscellaneous()) ??
                                                  0.0;
                                              calculatePercentBar(total);
                                              errorMessage3 = false;
                                            },
                                          );
                                        }
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
                                          SmallTextWidget(
                                              text: 'Monthly expenses:',
                                              fontWeight: FontWeight.normal,
                                              textColor: 0xffffffff,
                                              fontsize: screenScalingToInt(
                                                  context, 30)),
                                          Row(
                                            children: [
                                              SmallTextWidget(
                                                  text: '\$',
                                                  fontWeight: FontWeight.bold,
                                                  textColor: 0xffffffff,
                                                  fontsize: screenScalingToInt(
                                                      context, 30)),
                                              const SizedBox(width: 5),
                                              SmallTextWidget(
                                                  text:
                                                      calculateMonthlyExpenses(),
                                                  fontWeight: FontWeight.w300,
                                                  textColor: 0xffffffff,
                                                  fontsize: screenScalingToInt(
                                                      context, 30)),
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
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SmallTextWidget(
                                              text: 'Miscellaneous:',
                                              fontWeight: FontWeight.normal,
                                              textColor: 0xffffffff,
                                              fontsize: screenScalingToInt(
                                                  context, 30)),
                                          Row(
                                            children: [
                                              SmallTextWidget(
                                                  text: '\$',
                                                  fontWeight: FontWeight.bold,
                                                  textColor: 0xffffffff,
                                                  fontsize: screenScalingToInt(
                                                      context, 30)),
                                              const SizedBox(width: 5),
                                              SmallTextWidget(
                                                  text:
                                                      calculateMiscellaneous(),
                                                  fontWeight: FontWeight.w300,
                                                  textColor: 0xffffffff,
                                                  fontsize: screenScalingToInt(
                                                      context, 30)),
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
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SmallTextWidget(
                                              text: 'EazyBudget:',
                                              fontWeight: FontWeight.normal,
                                              textColor: 0xffffffff,
                                              fontsize: screenScalingToInt(
                                                  context, 30)),
                                          SmallTextWidget(
                                              text:
                                                  '\$ ${calculateEazyBudget().toStringAsFixed(2)}',
                                              fontWeight: FontWeight.w300,
                                              textColor: 0xffc9ff99,
                                              fontsize: screenScalingToInt(
                                                  context, 30)),
                                        ],
                                      )
                                          .animate()
                                          .shimmer(
                                              delay: 500.milliseconds,
                                              duration: 500.milliseconds)
                                          .fade(),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SmallTextWidget(
                                              text: 'Savings:',
                                              fontWeight: FontWeight.normal,
                                              textColor: 0xffffffff,
                                              fontsize: screenScalingToInt(
                                                  context, 30)),
                                          Row(
                                            children: [
                                              SmallTextWidget(
                                                  text: '\$',
                                                  fontWeight: FontWeight.bold,
                                                  textColor: 0xffffffff,
                                                  fontsize: screenScalingToInt(
                                                      context, 30)),
                                              const SizedBox(width: 5),
                                              SmallTextWidget(
                                                  text: calculateSavings(),
                                                  fontWeight: FontWeight.w300,
                                                  textColor: 0xffffffff,
                                                  fontsize: screenScalingToInt(
                                                      context, 30)),
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
                                        visible: isVisibleValueCorrection1,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              gradient: SweepGradient(
                                                colors: [
                                                  const Color(0xff1f2c25)
                                                      .withOpacity(0.8),
                                                  const Color(0xffc9ff99)
                                                      .withOpacity(0.8)
                                                ],
                                                stops: const [0.2, 0.75],
                                                center: Alignment.topRight,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          width: 350 * screenScaling(context),
                                          height: 60 * screenScaling(context),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              if (rent.text == '') {
                                                setState(() {
                                                  errorMessage3 = true;
                                                });
                                              } else {
                                                setState(
                                                  () {
                                                    isVisibleSven3 = false;
                                                    isVisibleSven3Correction1 =
                                                        true;
                                                    isVisibleSven3Correction2 =
                                                        false;
                                                    isVisibleValueCorrection1 =
                                                        false;
                                                    isVisibleValueCorrection2 =
                                                        true;
                                                    errorMessage3 = false;
                                                    calculateMonthlyExpenses();
                                                    calculateMiscellaneous();
                                                    calculateSavings();
                                                    needs = double.tryParse(
                                                            calculateMonthlyExpenses()) ??
                                                        0.0;
                                                    wants = double.tryParse(
                                                            calculateMiscellaneous()) ??
                                                        0.0;
                                                    calculatePercentBar(total);
                                                  },
                                                );
                                              }
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
                                            child: const Center(
                                              child: SmallTextWidget(
                                                text: 'Generate New EazyBudget',
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
                                        visible: isVisibleValueCorrection2,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              gradient: SweepGradient(
                                                colors: [
                                                  const Color(0xff1f2c25)
                                                      .withOpacity(0.8),
                                                  const Color(0xffc9ff99)
                                                      .withOpacity(0.8)
                                                ],
                                                stops: const [0.2, 0.75],
                                                center: Alignment.topRight,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          width: 350 * screenScaling(context),
                                          height: 60 * screenScaling(context),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              if (rent.text == '') {
                                                setState(() {
                                                  errorMessage3 = true;
                                                });
                                              } else {
                                                setState(
                                                  () {
                                                    isVisibleSven3 = false;
                                                    isVisibleSven3Correction1 =
                                                        false;
                                                    isVisibleSven3Correction2 =
                                                        true;
                                                    isVisibleValueCorrection1 =
                                                        true;
                                                    isVisibleValueCorrection2 =
                                                        false;
                                                    errorMessage3 = false;
                                                    calculateMonthlyExpenses();
                                                    calculateMiscellaneous();
                                                    calculateSavings();
                                                    needs = double.tryParse(
                                                            calculateMonthlyExpenses()) ??
                                                        0.0;
                                                    wants = double.tryParse(
                                                            calculateMiscellaneous()) ??
                                                        0.0;
                                                    calculatePercentBar(total);
                                                  },
                                                );
                                              }
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
                                            child: const Center(
                                              child: SmallTextWidget(
                                                text: 'Generate New EazyBudget',
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
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          width: 350 * screenScaling(context),
                                          height: 60 * screenScaling(context),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              if (rent.text == '') {
                                                setState(() {
                                                  errorMessage3 = true;
                                                });
                                              } else {
                                                setState(
                                                  () {
                                                    isVisibleSven3Correction1 =
                                                        false;
                                                    isVisibleSven3Correction2 =
                                                        false;
                                                    isVisibleValueCorrection1 =
                                                        false;
                                                    isVisibleValueCorrection2 =
                                                        false;
                                                    errorMessage3 = false;
                                                    calculateMonthlyExpenses();
                                                    calculateMiscellaneous();
                                                    calculateSavings();
                                                    isVisibleSven3 = false;
                                                    isVisibleCalculations =
                                                        false;
                                                    isVisibleGenerateEazyBudgetForm =
                                                        false;
                                                    isVisibleFirstMessage =
                                                        true;
                                                    isVisibleEazyBudgetProgressBar =
                                                        true;

                                                    isVisibleSven4 = true;
                                                    generateNewEazyBudgetVisiblity =
                                                        true;
                                                  },
                                                );
                                              }
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
                                            child: const Center(
                                              child: SmallTextWidget(
                                                text: 'Continue',
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
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          width: 350 * screenScaling(context),
                                          height: 60 * screenScaling(context),
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
                                                  isVisibleSven3Correction1 =
                                                      false;
                                                  isVisibleSven3Correction2 =
                                                      false;
                                                  isVisibleSven3 = false;
                                                  continueButtonVisibility =
                                                      false;
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
                                              backgroundColor:
                                                  Colors.transparent,
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
                                        )
                                            .animate()
                                            .shimmer(
                                                delay: 500.milliseconds,
                                                duration: 500.milliseconds)
                                            .fade(),
                                      ),
                                    ],
                                  )
                                      .animate()
                                      .shimmer(
                                          delay: 500.milliseconds,
                                          duration: 500.milliseconds)
                                      .fade(),
                                ),
                                const SizedBox(height: 10)
                              ],
                            )
                                .animate()
                                .shimmer(
                                    delay: 500.milliseconds,
                                    duration: 500.milliseconds)
                                .fade(),
                          ),
                        ),
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
                            height: 60 * screenScaling(context),
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
                                    getMonth.text = '${_month.month}';
                                    digitMonth = int.parse(getMonth.text) - 1;
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
                              .shimmer(
                                  delay: 500.milliseconds,
                                  duration: 500.milliseconds)
                              .fade(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Visibility(
                        visible: isVisibleAddPaymentButton,
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
                            height: 60 * screenScaling(context),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(
                                  () {
                                    isVisiblePaymentForm = true;
                                    isVisibleAddPaymentButton = false;
                                    isVisibleSven4 = false;
                                    isVisibleSven5 = true;
                                    tutorialAddPaymentButton = true;
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
                              .shimmer(
                                  delay: 500.milliseconds,
                                  duration: 500.milliseconds)
                              .fade(),
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
                                  fontsize: 25),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  children: [
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
                                    const SizedBox(height: 5),
                                    Visibility(
                                      visible: viewDetailsVisiblity,
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: BigTextWidget(
                                                text: 'Budget details:',
                                                weight: FontWeight.bold,
                                                fontsize: screenScalingToInt(
                                                    context, 40)),
                                          ),
                                          const SizedBox(height: 10),
                                          sven(context),
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
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                setState(
                                                  () {
                                                    viewDetailsVisiblity =
                                                        false;
                                                    viewDetailsButtonVisiblity =
                                                        true;
                                                  },
                                                );
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
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const SizedBox(height: 10),
                                                    const Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: BigTextWidget(
                                                          text:
                                                              'Eazy bar chart',
                                                          weight:
                                                              FontWeight.bold,
                                                          fontsize: 25),
                                                    ),
                                                    BarChartValues(),
                                                    const SizedBox(height: 10),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SmallTextWidget(
                                                            text: 'Expenses: ',
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            textColor:
                                                                0xffffffff,
                                                            fontsize:
                                                                screenScalingToInt(
                                                                    context,
                                                                    20)),
                                                        Container(
                                                          height: 10,
                                                          width: 20,
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
                                                                    .circular(
                                                                        5),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 5),
                                                        const SmallTextWidget(
                                                            text: ' & ',
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            textColor:
                                                                0xffffffff,
                                                            fontsize: 12),
                                                        const SizedBox(
                                                            width: 5),
                                                        SmallTextWidget(
                                                            text:
                                                                'Miscellaneous: ',
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            textColor:
                                                                0xffffffff,
                                                            fontsize:
                                                                screenScalingToInt(
                                                                    context,
                                                                    20)),
                                                        Container(
                                                          height: 10,
                                                          width: 20,
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
                                                                    .circular(
                                                                        5),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SmallTextWidget(
                                                            text:
                                                                'Must not pass under the ',
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            textColor:
                                                                0xffffffff,
                                                            fontsize:
                                                                screenScalingToInt(
                                                                    context,
                                                                    20)),
                                                        Container(
                                                          height: 10,
                                                          width: 20,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.red,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                        ),
                                                        SmallTextWidget(
                                                            text: ' Line.',
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            textColor:
                                                                0xffffffff,
                                                            fontsize:
                                                                screenScalingToInt(
                                                                    context,
                                                                    20)),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 10),
                                                    const Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: BigTextWidget(
                                                          text:
                                                              'Eazy Pie Chart',
                                                          weight:
                                                              FontWeight.bold,
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
                                                                  text:
                                                                      'Expenses: ',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  textColor:
                                                                      0xffffffff,
                                                                  fontsize: 12),
                                                              Container(
                                                                height: 10,
                                                                width: 20,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color:
                                                                      ColorTween(
                                                                    begin: const Color(
                                                                        0xff151515),
                                                                    end: const Color(
                                                                        0xffc9ff99),
                                                                  ).lerp(0.75),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
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
                                                                      FontWeight
                                                                          .normal,
                                                                  textColor:
                                                                      0xffffffff,
                                                                  fontsize: 12),
                                                              Container(
                                                                height: 10,
                                                                width: 20,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color:
                                                                      ColorTween(
                                                                    begin: const Color(
                                                                        0xff151515),
                                                                    end: const Color(
                                                                        0xffc3a9ff),
                                                                  ).lerp(0.75),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              const SmallTextWidget(
                                                                  text:
                                                                      'Savings: ',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  textColor:
                                                                      0xffffffff,
                                                                  fontsize: 12),
                                                              Container(
                                                                height: 10,
                                                                width: 20,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color:
                                                                      ColorTween(
                                                                    begin: const Color(
                                                                        0xff151515),
                                                                    end: const Color(
                                                                        0xff8dffe4),
                                                                  ).lerp(0.75),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(height: 15),
                                                    SmallTextWidget(
                                                        text:
                                                            'Tap to close details.',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        textColor: 0xffc9ff99,
                                                        fontsize:
                                                            screenScalingToInt(
                                                                context, 30)),
                                                    const SizedBox(height: 12),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                          .animate()
                                          .shimmer(
                                              delay: 500.milliseconds,
                                              duration: 500.milliseconds)
                                          .fade(),
                                    ),
                                    Visibility(
                                      visible: viewDetailsButtonVisiblity,
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
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          width: 350 * screenScaling(context),
                                          height: 60 * screenScaling(context),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              setState(
                                                () {
                                                  viewDetailsVisiblity = true;
                                                  viewDetailsButtonVisiblity =
                                                      false;
                                                },
                                              );
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
                                            child: const Center(
                                              child: SmallTextWidget(
                                                text: 'View details',
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
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          width: 350 * screenScaling(context),
                                          height: 60 * screenScaling(context),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              setState(
                                                () {
                                                  svenReportsVisiblity = true;
                                                  reportsButtonVisiblity =
                                                      false;
                                                  listLength =
                                                      createListLength(total);
                                                },
                                              );
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
                                            child: const Center(
                                              child: SmallTextWidget(
                                                text: 'Reports',
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
                                    ),
                                    Visibility(
                                      visible: svenReportsVisiblity,
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              BigTextWidget(
                                                  text: 'Budget reports:',
                                                  weight: FontWeight.bold,
                                                  fontsize: screenScalingToInt(
                                                      context, 30)),
                                              SmallTextWidget(
                                                  text:
                                                      'Tap Sven to close details.',
                                                  fontWeight: FontWeight.bold,
                                                  textColor: 0xffc9ff99,
                                                  fontsize: screenScalingToInt(
                                                      context, 20))
                                            ],
                                          ),
                                          const SizedBox(height: 10),
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
                                            width: 430,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  svenReportsVisiblity = false;
                                                  reportsButtonVisiblity = true;
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
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 60,
                                                    width: 60,
                                                    decoration:
                                                        const BoxDecoration(
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
                                                          'Here are some tips to save more and prevent you from spending over your EazyBudget.',
                                                          textStyle:
                                                              const TextStyle(
                                                            color: Color(
                                                                0xffffffff),
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontFamily:
                                                                'Poppins',
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
                                            width: 430 * screenScaling(context),
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount: listLength,
                                              itemBuilder: (context, index) {
                                                return SizedBox(
                                                  width: 380,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: Column(
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child:
                                                                  AnimatedTextKit(
                                                                animatedTexts: [
                                                                  TypewriterAnimatedText(
                                                                    tips[index]
                                                                        [0],
                                                                    speed: const Duration(
                                                                        milliseconds:
                                                                            20),
                                                                    textStyle:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize: 18 *
                                                                          screenScaling(
                                                                              context),
                                                                      color: const Color(
                                                                          0xffc9ff99),
                                                                    ),
                                                                  ),
                                                                ],
                                                                totalRepeatCount:
                                                                    1,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 10),
                                                            Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child:
                                                                  AnimatedTextKit(
                                                                animatedTexts: [
                                                                  TypewriterAnimatedText(
                                                                    tips[index]
                                                                        [1],
                                                                    speed: const Duration(
                                                                        milliseconds:
                                                                            10),
                                                                    textStyle:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontSize: 15 *
                                                                          screenScaling(
                                                                              context),
                                                                      color: const Color(
                                                                          0xffffffff),
                                                                    ),
                                                                  ),
                                                                ],
                                                                totalRepeatCount:
                                                                    1,
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
                                      )
                                          .animate()
                                          .shimmer(
                                              delay: 500.milliseconds,
                                              duration: 500.milliseconds)
                                          .fade(),
                                    ),
                                  ],
                                )
                                    .animate()
                                    .shimmer(
                                        delay: 500.milliseconds,
                                        duration: 500.milliseconds)
                                    .fade(),
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
                                    fontsize: 25),
                                Stack(
                                  children: [
                                    Visibility(
                                      visible: addPaymentVisiblity,
                                      child: Container(
                                        width: 180 * screenScaling(context),
                                        height: 35 * screenScaling(context),
                                        decoration: BoxDecoration(
                                            gradient: SweepGradient(
                                              colors: [
                                                const Color(0xff1f2c25)
                                                    .withOpacity(0.8),
                                                const Color(0xffc9ff99)
                                                    .withOpacity(0.8)
                                              ],
                                              stops: const [0.2, 0.75],
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
                                              viewDetailsButtonVisiblity = true;
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
                                      )
                                          .animate()
                                          .shimmer(
                                              delay: 500.milliseconds,
                                              duration: 500.milliseconds)
                                          .fade(),
                                    ),
                                    Visibility(
                                      visible: cancelAddPaymentVisibility,
                                      child: Container(
                                        width: 180 * screenScaling(context),
                                        height: 35 * screenScaling(context),
                                        decoration: BoxDecoration(
                                            gradient: SweepGradient(
                                              colors: [
                                                const Color(0xff1f2c25)
                                                    .withOpacity(0.8),
                                                const Color(0xffc9ff99)
                                                    .withOpacity(0.8)
                                              ],
                                              stops: const [0.2, 0.75],
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
                                      )
                                          .animate()
                                          .shimmer(
                                              delay: 500.milliseconds,
                                              duration: 500.milliseconds)
                                          .fade(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Visibility(
                              visible: cardListVisibility,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(10)),
                                width: 430 * screenScaling(context),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: paymentCardList.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Container(
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
                                              double subtractTotal =
                                                  double.tryParse(
                                                          paymentCardList[index]
                                                              [1]) ??
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
                                              viewDetailsVisiblity = false;
                                              viewDetailsButtonVisiblity = true;
                                              barWidth =
                                                  calculatePercentBar(total);
                                              progressBarColor = 0xffC3A9FF;
                                              createListLength(total);
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
                                                            FontWeight.bold,
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
                                                    SmallTextWidget(
                                                        text: 'Payment amount:',
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        textColor: 0xffffffff,
                                                        fontsize:
                                                            screenScalingToInt(
                                                                context, 30)),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          Icons
                                                              .attach_money_rounded,
                                                          size: 18,
                                                          color:
                                                              Color(0xffc9ff99),
                                                        ),
                                                        const SizedBox(
                                                            width: 3),
                                                        SmallTextWidget(
                                                            text:
                                                                paymentCardList[
                                                                    index][1],
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            textColor:
                                                                0xffc9ff99,
                                                            fontsize:
                                                                screenScalingToInt(
                                                                    context,
                                                                    30)),
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
                                                    SmallTextWidget(
                                                        text: 'Payment due:',
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        textColor: 0xffffffff,
                                                        fontsize:
                                                            screenScalingToInt(
                                                                context, 30)),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          Icons.calendar_today,
                                                          size: 15,
                                                          color: Colors.white,
                                                        ),
                                                        const SizedBox(
                                                            width: 5),
                                                        Text(
                                                          paymentCardList[index]
                                                              [2],
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 20 *
                                                                screenScaling(
                                                                    context),
                                                            fontStyle: FontStyle
                                                                .italic,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color(
                                                                0xffc9ff99),
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                            decorationColor: Color(
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
                                                    SmallTextWidget(
                                                        text:
                                                            'Tap to remove card',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        textColor: 0xffc9ff99,
                                                        fontsize:
                                                            screenScalingToInt(
                                                                context, 25)),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
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
                                                          paymentCardList[index]
                                                              [3],
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 20 *
                                                                screenScaling(
                                                                    context),
                                                            fontStyle: FontStyle
                                                                .italic,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color(
                                                                0xffc9ff99),
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                            decorationColor: Color(
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
                                    );
                                  },
                                ),
                              ),
                            )
                                .animate()
                                .shimmer(
                                    delay: 500.milliseconds,
                                    duration: 500.milliseconds)
                                .fade(),
                          ],
                        )
                            .animate()
                            .shimmer(
                                delay: 500.milliseconds,
                                duration: 500.milliseconds)
                            .fade(),
                      ),
                      Visibility(
                        visible: isVisiblePaymentForm,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Visibility(
                                      visible: errorMessageVisiblity2,
                                      child: Container(
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
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.transparent,
                                            elevation: 5.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 60,
                                                width: 60,
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
                                                child: Text(
                                                  errorMessage,
                                                  style: const TextStyle(
                                                      color: Color(0xffffffff),
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily: 'Poppins'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                          .animate()
                                          .shimmer(
                                              delay: 500.milliseconds,
                                              duration: 500.milliseconds)
                                          .fade(),
                                    ),
                                    const SizedBox(height: 10),
                                    UserInput(
                                        label: 'Payment title',
                                        hiddenLabel: 'Title',
                                        controllerName: paymentTitle,
                                        regExp: r'[a-zA-Z0-9 ]'),
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
                                            SizedBox(
                                              width:
                                                  130 * screenScaling(context),
                                              child: TextField(
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 20 *
                                                        screenScaling(context)),
                                                controller: payment,
                                                keyboardType:
                                                    TextInputType.number,
                                                maxLength: 8,
                                                textAlign: TextAlign.right,
                                                decoration: InputDecoration(
                                                  hintText: '9999.99',
                                                  counterText: '',
                                                  hintStyle: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 20 *
                                                        screenScaling(context),
                                                    color:
                                                        const Color(0xff000000)
                                                            .withOpacity(0.5),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Color(
                                                                0xff0081B3),
                                                            width: 2.0),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Color(
                                                                0xffffffff),
                                                            width: 2.0),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
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
                                                width: 150 *
                                                    screenScaling(context),
                                                height:
                                                    35 * screenScaling(context),
                                                decoration: BoxDecoration(
                                                    gradient: SweepGradient(
                                                      colors: [
                                                        const Color(0xff1f2c25)
                                                            .withOpacity(0.8),
                                                        const Color(0xffc9ff99)
                                                            .withOpacity(0.8)
                                                      ],
                                                      stops: const [0.2, 0.75],
                                                      center:
                                                          Alignment.topRight,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      isVisibleTableCalendar =
                                                          true;
                                                      isVisibleSelectDate =
                                                          false;
                                                      isVisibleDueDate = false;
                                                      selectedDate.text = '';
                                                    });
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    elevation: 5,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                  ),
                                                  child: const SmallTextWidget(
                                                      text: 'Select date',
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      textColor: 0xffffffff,
                                                      fontsize: 15),
                                                ),
                                              )
                                                  .animate()
                                                  .shimmer(
                                                      delay: 500.milliseconds,
                                                      duration:
                                                          500.milliseconds)
                                                  .fade(),
                                            ),
                                            Visibility(
                                              visible: isVisibleConfirmDueDate,
                                              child: Container(
                                                width: 150 *
                                                    screenScaling(context),
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    gradient: SweepGradient(
                                                      colors: [
                                                        const Color(0xff1f2c25)
                                                            .withOpacity(0.8),
                                                        const Color(0xffc9ff99)
                                                            .withOpacity(0.8)
                                                      ],
                                                      stops: const [0.2, 0.75],
                                                      center:
                                                          Alignment.topRight,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      selectedDate.text =
                                                          '${_selectedDay.year}-${_selectedDay.month}-${_selectedDay.day}';
                                                      isVisibleTableCalendar =
                                                          false;
                                                      isVisibleSelectDate =
                                                          true;
                                                      isVisibleConfirmDueDate =
                                                          false;
                                                      isVisibleDueDate = true;
                                                    });
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    elevation: 5,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                  ),
                                                  child: const SmallTextWidget(
                                                      text: 'Confirm',
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      textColor: 0xffffffff,
                                                      fontsize: 15),
                                                ),
                                              )
                                                  .animate()
                                                  .shimmer(
                                                      delay: 500.milliseconds,
                                                      duration:
                                                          500.milliseconds)
                                                  .fade(),
                                            ),
                                          ],
                                        ),
                                        Visibility(
                                          visible: isVisibleDueDate,
                                          child: SmallTextWidget(
                                                  text: selectedDate.text,
                                                  fontWeight: FontWeight.bold,
                                                  textColor: 0xffc9ff99,
                                                  fontsize: 18)
                                              .animate()
                                              .shimmer(
                                                  delay: 500.milliseconds,
                                                  duration: 500.milliseconds)
                                              .fade(),
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
                                          daysOfWeekStyle:
                                              const DaysOfWeekStyle(
                                            weekdayStyle:
                                                TextStyle(color: Colors.white),
                                            weekendStyle: TextStyle(
                                                color: Color(0xffc9ff99)),
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
                                          onDaySelected:
                                              (selectedDay, focusedDay) {
                                            setState(() {
                                              _selectedDay = selectedDay;
                                              _focusedDay = selectedDay;
                                              isVisibleConfirmDueDate = true;
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
                                        )
                                            .animate()
                                            .shimmer(
                                                delay: 500.milliseconds,
                                                duration: 500.milliseconds)
                                            .fade(),
                                      ),
                                    ),
                                  ],
                                )
                                    .animate()
                                    .shimmer(
                                        delay: 500.milliseconds,
                                        duration: 500.milliseconds)
                                    .fade(),
                                Column(
                                  children: [
                                    const Align(
                                      alignment: Alignment.centerLeft,
                                      child: SmallTextWidget(
                                          text:
                                              'When do you want to be reminded?',
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
                                                topLeft:
                                                    const Radius.circular(15),
                                                topRight:
                                                    const Radius.circular(15),
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
                                                    const Color(0xffc9ff99)
                                                        .withOpacity(0.8);
                                                dayButtonColor11 =
                                                    const Color(0xff1f2c25);
                                                dayButtonColor12 =
                                                    const Color(0xffc9ff99)
                                                        .withOpacity(0.8);
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
                                              });
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.transparent,
                                              elevation: 5,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        const Radius.circular(
                                                            15),
                                                    topRight:
                                                        const Radius.circular(
                                                            15),
                                                    bottomLeft: Radius.circular(
                                                        bottomLeftRight3),
                                                    bottomRight:
                                                        Radius.circular(
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
                                                topLeft:
                                                    const Radius.circular(15),
                                                topRight:
                                                    const Radius.circular(15),
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
                                                    const Color(0xffc9ff99)
                                                        .withOpacity(0.8);
                                                dayButtonColor21 =
                                                    const Color(0xff151515);
                                                dayButtonColor22 =
                                                    const Color(0xff1f2c25);
                                                dayButtonColor11 =
                                                    const Color(0xff1f2c25);
                                                dayButtonColor12 =
                                                    const Color(0xffc9ff99)
                                                        .withOpacity(0.8);
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
                                              });
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.transparent,
                                              elevation: 5,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        const Radius.circular(
                                                            15),
                                                    topRight:
                                                        const Radius.circular(
                                                            15),
                                                    bottomLeft: Radius.circular(
                                                        bottomLeftRight2),
                                                    bottomRight:
                                                        Radius.circular(
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
                                                topLeft:
                                                    const Radius.circular(15),
                                                topRight:
                                                    const Radius.circular(15),
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
                                                    const Color(0xffc9ff99)
                                                        .withOpacity(0.8);
                                                dayButtonColor21 =
                                                    const Color(0xff1f2c25);
                                                dayButtonColor22 =
                                                    const Color(0xffc9ff99)
                                                        .withOpacity(0.8);
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
                                              });
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.transparent,
                                              elevation: 5,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        const Radius.circular(
                                                            15),
                                                    topRight:
                                                        const Radius.circular(
                                                            15),
                                                    bottomLeft: Radius.circular(
                                                        bottomLeftRight1),
                                                    bottomRight:
                                                        Radius.circular(
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
                                    .shimmer(
                                        delay: 500.milliseconds,
                                        duration: 500.milliseconds)
                                    .fade(),
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
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 60,
                                            width: 60,
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
                                                  message3,
                                                  textStyle: TextStyle(
                                                      color: const Color(
                                                          0xffffffff),
                                                      fontSize: 15 *
                                                          screenScaling(
                                                              context),
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                  )
                                      .animate()
                                      .shimmer(
                                          delay: 500.milliseconds,
                                          duration: 500.milliseconds)
                                      .fade(),
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
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 60,
                                            width: 60,
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
                                                  message2,
                                                  textStyle: TextStyle(
                                                      color: const Color(
                                                          0xffffffff),
                                                      fontSize: 15 *
                                                          screenScaling(
                                                              context),
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                  )
                                      .animate()
                                      .shimmer(
                                          delay: 500.milliseconds,
                                          duration: 500.milliseconds)
                                      .fade(),
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
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 60,
                                            width: 60,
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
                                                  message1,
                                                  textStyle: TextStyle(
                                                      color: const Color(
                                                          0xffffffff),
                                                      fontSize: 15 *
                                                          screenScaling(
                                                              context),
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                  )
                                      .animate()
                                      .shimmer(
                                          delay: 500.milliseconds,
                                          duration: 500.milliseconds)
                                      .fade(),
                                ),
                                const SizedBox(height: 10),
                                Center(
                                  child: Stack(
                                    children: [
                                      Visibility(
                                        visible: tutorialAddPaymentButton,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              gradient: SweepGradient(
                                                colors: [
                                                  const Color(0xff1f2c25)
                                                      .withOpacity(0.8),
                                                  const Color(0xffc9ff99)
                                                      .withOpacity(0.8)
                                                ],
                                                stops: const [0.2, 0.75],
                                                center: Alignment.topRight,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          width: 350 * screenScaling(context),
                                          height: 60 * screenScaling(context),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              if (paymentTitle.text == '' ||
                                                  payment == '' ||
                                                  selectedDate.text == '' ||
                                                  pickedDay.text == '') {
                                                setState(() {
                                                  errorMessageVisiblity2 = true;
                                                  errorColor = 0xffff0505;
                                                  errorMessage =
                                                      'Missing values. Please check title, amount, confirm date, and select reminder.';
                                                });
                                              } else {
                                                setState(
                                                  () {
                                                    isVisiblePaymentForm =
                                                        false;
                                                    isVisiblePercentageBar =
                                                        true;
                                                    List<String> newCard = [
                                                      paymentTitle.text,
                                                      payment.text,
                                                      selectedDate.text,
                                                      pickedDay.text
                                                    ];
                                                    paymentCardList
                                                        .add(newCard);
                                                    totalExpenditureVisiblity =
                                                        true;
                                                    paymentCardsListVisibility =
                                                        true;
                                                    transactionsListVisiblity =
                                                        true;
                                                    cardListVisibility = true;
                                                    total += double.tryParse(
                                                            payment.text) ??
                                                        0.0;
                                                    totalNeeds +=
                                                        double.tryParse(
                                                                payment.text) ??
                                                            0.0;
                                                    calculatePercentBar(total);
                                                    if (calculatePercentBar(
                                                            total) >=
                                                        270) {
                                                      progressBarColor =
                                                          0xffff0505;
                                                      barWidth = 270;
                                                    } else {
                                                      barWidth =
                                                          calculatePercentBar(
                                                              total);
                                                      progressBarColor =
                                                          0xffC3A9FF;
                                                    }
                                                    paymentTitle.text = '';
                                                    payment.text = '';
                                                    selectedDate.text = '';
                                                    pickedDay.text = '';
                                                    dayButtonColor31 =
                                                        const Color(0xff1f2c25);
                                                    dayButtonColor32 =
                                                        const Color(0xffc9ff99)
                                                            .withOpacity(0.8);
                                                    dayButtonColor21 =
                                                        const Color(0xff1f2c25);
                                                    dayButtonColor22 =
                                                        const Color(0xffc9ff99)
                                                            .withOpacity(0.8);
                                                    dayButtonColor11 =
                                                        const Color(0xff1f2c25);
                                                    dayButtonColor12 =
                                                        const Color(0xffc9ff99)
                                                            .withOpacity(0.8);
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
                                                    isVisibleCompanyLogo = true;

                                                    cancelAddPaymentVisibility =
                                                        false;
                                                    reportsButtonVisiblity =
                                                        true;
                                                    viewDetailsButtonVisiblity =
                                                        true;
                                                    isVisibleSven5 = false;
                                                    isVisibleSven6 = true;
                                                    errorMessageVisiblity2 =
                                                        false;
                                                    errorColor = 0xff1f2c25;
                                                    errorMessage =
                                                        'Complete the form';
                                                    tutorialAddPaymentButton =
                                                        false;
                                                    permanentAddPaymentButton =
                                                        true;
                                                  },
                                                );
                                              }
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
                                      Visibility(
                                        visible: permanentAddPaymentButton,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              gradient: SweepGradient(
                                                colors: [
                                                  const Color(0xff1f2c25)
                                                      .withOpacity(0.8),
                                                  const Color(0xffc9ff99)
                                                      .withOpacity(0.8)
                                                ],
                                                stops: const [0.2, 0.75],
                                                center: Alignment.topRight,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          width: 350 * screenScaling(context),
                                          height: 60 * screenScaling(context),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              if (paymentTitle.text == '' ||
                                                  payment.text == '' ||
                                                  selectedDate.text == '' ||
                                                  pickedDay.text == '') {
                                                setState(() {
                                                  errorMessageVisiblity2 = true;
                                                  errorColor = 0xffff0505;
                                                  errorMessage =
                                                      'Missing values. Please check title, amount, confirm date, and select reminder.';
                                                });
                                              } else {
                                                setState(
                                                  () {
                                                    isVisiblePaymentForm =
                                                        false;
                                                    isVisiblePercentageBar =
                                                        true;
                                                    List<String> newCard = [
                                                      paymentTitle.text,
                                                      payment.text,
                                                      selectedDate.text,
                                                      pickedDay.text
                                                    ];
                                                    paymentCardList
                                                        .add(newCard);
                                                    totalExpenditureVisiblity =
                                                        true;
                                                    paymentCardsListVisibility =
                                                        true;
                                                    transactionsListVisiblity =
                                                        true;
                                                    cardListVisibility = true;
                                                    total += double.tryParse(
                                                            payment.text) ??
                                                        0.0;
                                                    totalNeeds +=
                                                        double.tryParse(
                                                                payment.text) ??
                                                            0.0;
                                                    calculatePercentBar(total);
                                                    if (calculatePercentBar(
                                                            total) >=
                                                        270) {
                                                      progressBarColor =
                                                          0xffff0505;
                                                      barWidth = 270;
                                                    } else {
                                                      barWidth =
                                                          calculatePercentBar(
                                                              total);
                                                      progressBarColor =
                                                          0xffC3A9FF;
                                                    }
                                                    paymentTitle.text = '';
                                                    payment.text = '';
                                                    selectedDate.text = '';
                                                    pickedDay.text = '';
                                                    dayButtonColor31 =
                                                        const Color(0xff1f2c25);
                                                    dayButtonColor32 =
                                                        const Color(0xffc9ff99)
                                                            .withOpacity(0.8);
                                                    dayButtonColor21 =
                                                        const Color(0xff1f2c25);
                                                    dayButtonColor22 =
                                                        const Color(0xffc9ff99)
                                                            .withOpacity(0.8);
                                                    dayButtonColor11 =
                                                        const Color(0xff1f2c25);
                                                    dayButtonColor12 =
                                                        const Color(0xffc9ff99)
                                                            .withOpacity(0.8);
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
                                                    isVisibleCompanyLogo = true;

                                                    cancelAddPaymentVisibility =
                                                        false;
                                                    reportsButtonVisiblity =
                                                        true;
                                                    viewDetailsButtonVisiblity =
                                                        true;
                                                    isVisibleSven5 = false;
                                                    errorMessageVisiblity2 =
                                                        false;
                                                    errorColor = 0xff1f2c25;
                                                    errorMessage =
                                                        'Complete the form';
                                                  },
                                                );
                                              }
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
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: transactionsListVisiblity,
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const BigTextWidget(
                                    text: 'Transaction/s:',
                                    weight: FontWeight.bold,
                                    fontsize: 25),
                                Stack(
                                  children: [
                                    Visibility(
                                      visible:
                                          cancelAddTransactionButtonVisibility,
                                      child: Container(
                                        width: 180 * screenScaling(context),
                                        height: 35 * screenScaling(context),
                                        decoration: BoxDecoration(
                                            gradient: SweepGradient(
                                              colors: [
                                                const Color(0xff1f2c25)
                                                    .withOpacity(0.8),
                                                const Color(0xffc9ff99)
                                                    .withOpacity(0.8)
                                              ],
                                              stops: const [0.2, 0.75],
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
                                      )
                                          .animate()
                                          .shimmer(
                                              delay: 500.milliseconds,
                                              duration: 500.milliseconds)
                                          .fade(),
                                    ),
                                    Visibility(
                                      visible: addTransactionButtonVisibility,
                                      child: Container(
                                        width: 180 * screenScaling(context),
                                        height: 35 * screenScaling(context),
                                        decoration: BoxDecoration(
                                            gradient: SweepGradient(
                                              colors: [
                                                const Color(0xff1f2c25)
                                                    .withOpacity(0.8),
                                                const Color(0xffc9ff99)
                                                    .withOpacity(0.8)
                                              ],
                                              stops: const [0.2, 0.75],
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
                                              viewDetailsButtonVisiblity = true;
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
                                      )
                                          .animate()
                                          .shimmer(
                                              delay: 500.milliseconds,
                                              duration: 500.milliseconds)
                                          .fade(),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            Visibility(
                              visible: addTransactionFormvisibility,
                              child: Container(
                                width: 430 * screenScaling(context),
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: 430 * screenScaling(context),
                                        child: Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                gradient: SweepGradient(
                                                  colors: [
                                                    const Color(0xff151515)
                                                        .withOpacity(0.5),
                                                    Color(errorColor2)
                                                        .withOpacity(0.5)
                                                  ],
                                                  stops: const [0.25, 0.75],
                                                  center: Alignment.bottomRight,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: ElevatedButton(
                                                onPressed: () {},
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  elevation: 5.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 60,
                                                      width: 60,
                                                      decoration:
                                                          const BoxDecoration(
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
                                                      child: Text(
                                                        errorMessage2,
                                                        style: const TextStyle(
                                                            color: Color(
                                                                0xffffffff),
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontFamily:
                                                                'Poppins'),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: SmallTextWidget(
                                                        text:
                                                            'Transaction name',
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        textColor: 0xffffffff,
                                                        fontsize: 15,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 5),
                                                    SmallUserInput(
                                                      hintLabel: 'Name',
                                                      textFieldSize: 200 *
                                                          screenScaling(
                                                              context),
                                                      totalCharacters: 12,
                                                      regExp: r'[a-zA-Z0-9 ]',
                                                      controllerName:
                                                          transactionName,
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start, // Added to align children to the start (left) horizontally
                                                  children: [
                                                    const Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: SmallTextWidget(
                                                        text: 'Amount',
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        textColor: 0xffffffff,
                                                        fontsize: 15,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 5),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          Icons
                                                              .attach_money_rounded,
                                                          color:
                                                              Color(0xffffffff),
                                                        ),
                                                        const SizedBox(
                                                            width: 5),
                                                        SizedBox(
                                                          width: 130 *
                                                              screenScaling(
                                                                  context),
                                                          child: TextField(
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 20 *
                                                                    screenScaling(
                                                                        context)),
                                                            controller:
                                                                transactionAmount,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            maxLength: 8,
                                                            textAlign:
                                                                TextAlign.right,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  '9999.99',
                                                              counterText: '',
                                                              hintStyle:
                                                                  TextStyle(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 20 *
                                                                    screenScaling(
                                                                        context),
                                                                color: const Color(
                                                                        0xff000000)
                                                                    .withOpacity(
                                                                        0.5),
                                                              ),
                                                              filled: true,
                                                              fillColor:
                                                                  Colors.white,
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: const BorderSide(
                                                                    color: Color(
                                                                        0xff0081B3),
                                                                    width: 2.0),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: const BorderSide(
                                                                    color: Color(
                                                                        0xffffffff),
                                                                    width: 2.0),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Center(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    gradient: SweepGradient(
                                                      colors: [
                                                        const Color(0xff1f2c25)
                                                            .withOpacity(0.8),
                                                        const Color(0xffc9ff99)
                                                            .withOpacity(0.8)
                                                      ],
                                                      stops: const [0.2, 0.75],
                                                      center:
                                                          Alignment.topRight,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                width: 350 *
                                                    screenScaling(context),
                                                height:
                                                    60 * screenScaling(context),
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    if (transactionName.text ==
                                                        '') {
                                                      setState(() {
                                                        errorColor2 =
                                                            0xffff0505;
                                                        errorMessage2 =
                                                            'Missing transaction name. Please add a name.';
                                                      });
                                                    }
                                                    if (transactionAmount
                                                            .text ==
                                                        '') {
                                                      setState(() {
                                                        errorColor = 0xffff0505;
                                                        errorMessage =
                                                            'Missing transaction amount. Please add amount.';
                                                      });
                                                    }
                                                    if (transactionName.text ==
                                                            '' &&
                                                        transactionAmount
                                                                .text ==
                                                            '') {
                                                      setState(() {
                                                        errorColor = 0xffff0505;
                                                        errorMessage =
                                                            'Missing transaction name and amount. Please add a name and amount.';
                                                      });
                                                    }
                                                    if (transactionName.text !=
                                                            '' &&
                                                        transactionAmount
                                                                .text !=
                                                            '') {
                                                      setState(
                                                        () {
                                                          List<String>
                                                              newTransaction = [
                                                            transactionName
                                                                .text,
                                                            transactionAmount
                                                                .text
                                                          ];
                                                          transactionList.add(
                                                              newTransaction);
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
                                                          totalWants +=
                                                              double.tryParse(
                                                                      transactionAmount
                                                                          .text) ??
                                                                  0.0;
                                                          calculatePercentBar(
                                                              total);
                                                          if (calculatePercentBar(
                                                                  total) >=
                                                              270) {
                                                            progressBarColor =
                                                                0xffff0505;
                                                            barWidth = 270;
                                                          } else {
                                                            barWidth =
                                                                calculatePercentBar(
                                                                    total);
                                                            progressBarColor =
                                                                0xffC3A9FF;
                                                          }

                                                          transactionName.text =
                                                              '';
                                                          transactionAmount
                                                              .text = '';
                                                        },
                                                      );
                                                    }
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    elevation: 5.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                  ),
                                                  child: const Center(
                                                    child: SmallTextWidget(
                                                      text: 'Add transaction',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      textColor: 0xffffffff,
                                                      fontsize: 16,
                                                    ),
                                                  ),
                                                ),
                                              )
                                                  .animate()
                                                  .shimmer(
                                                      delay: 500.milliseconds,
                                                      duration:
                                                          500.milliseconds)
                                                  .fade(),
                                            ),
                                          ],
                                        ),
                                      )
                                          .animate()
                                          .shimmer(
                                              delay: 500.milliseconds,
                                              duration: 500.milliseconds)
                                          .fade(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(10)),
                              width: 430 * screenScaling(context),
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: transactionList.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Container(
                                      height: 55 * screenScaling(context),
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
                                          setState(() {
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
                                            viewDetailsVisiblity = false;
                                            viewDetailsButtonVisiblity = true;
                                            barWidth =
                                                calculatePercentBar(total);
                                            progressBarColor = 0xffC3A9FF;
                                            createListLength(total);
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
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SmallTextWidget(
                                                text: transactionList[index][0],
                                                fontWeight: FontWeight.normal,
                                                textColor: 0xffffffff,
                                                fontsize: screenScalingToInt(
                                                    context, 25)),
                                            const SmallTextWidget(
                                                text: 'Tap to remove',
                                                fontWeight: FontWeight.bold,
                                                textColor: 0xffffffff,
                                                fontsize: 10),
                                            SmallTextWidget(
                                                text:
                                                    '\$ -${transactionList[index][1]}',
                                                fontWeight: FontWeight.bold,
                                                textColor: 0xffc9ff99,
                                                fontsize: screenScalingToInt(
                                                    context, 25))
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        )
                            .animate()
                            .shimmer(
                                delay: 500.milliseconds,
                                duration: 500.milliseconds)
                            .fade(),
                      ),
                      const SizedBox(height: 20),
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
