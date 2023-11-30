import 'dart:ui';
import 'package:eazytrackv2/components/BigTextWidget.dart';
import 'package:eazytrackv2/components/BigUserInputWidget.dart';
import 'package:eazytrackv2/components/CompanyLogo.dart';
import 'package:eazytrackv2/components/Controllers.dart';
import 'package:eazytrackv2/components/GreenLongButton.dart';
import 'package:eazytrackv2/components/ScreenScale.dart';
import 'package:eazytrackv2/components/SmallTextWidget.dart';
import 'package:eazytrackv2/pages/AccountSetupPage.dart';
import 'package:eazytrackv2/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class SecurityQuestions extends StatefulWidget {
  const SecurityQuestions({super.key});

  @override
  State<SecurityQuestions> createState() => _SecurityQuestionsState();
}

class _SecurityQuestionsState extends State<SecurityQuestions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
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
            SingleChildScrollView(
              child: Center(
                child: SizedBox(
                  width: 430 * screenScaling(context),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      CompanyName(),
                      const SizedBox(height: 10),
                      BigTextWidget(
                          text: 'Security Questions',
                          weight: FontWeight.bold,
                          fontsize: screenScalingToInt(context, 40)),
                      const SizedBox(height: 20),
                      Stack(
                        children: [
                          Visibility(
                            visible: isVisibleAnswerQuestionsButton,
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
                                  borderRadius: BorderRadius.circular(15)),
                              width: 350 * screenScaling(context),
                              height: 60 * screenScaling(context),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    isVisibleAnswerQuestionsButton = false;
                                    isVisibleQuestions = true;
                                    isVisibleCancelButton1 = true;
                                    isVisibleDivider = false;
                                    isVisibleCreateQuestionsButton = false;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 5.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: Center(
                                  child: SmallTextWidget(
                                    text: 'Answer 3 security questions',
                                    fontWeight: FontWeight.w600,
                                    textColor: 0xffffffff,
                                    fontsize: screenScalingToInt(context, 20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: isVisibleCancelButton1,
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
                                  borderRadius: BorderRadius.circular(15)),
                              width: 350 * screenScaling(context),
                              height: 60 * screenScaling(context),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    isVisibleAnswerQuestionsButton = true;
                                    isVisibleQuestions = false;
                                    isVisibleCancelButton1 = false;
                                    isVisibleDivider = true;
                                    isVisibleCreateQuestionsButton = true;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 5.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: Center(
                                  child: SmallTextWidget(
                                    text: 'Cancel',
                                    fontWeight: FontWeight.w600,
                                    textColor: 0xffffffff,
                                    fontsize: screenScalingToInt(context, 20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Visibility(
                        visible: isVisibleQuestions,
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: BigTextWidget(
                                  text: 'Answer 3 security questions',
                                  weight: FontWeight.bold,
                                  fontsize: screenScalingToInt(context, 30)),
                            ),
                            const SizedBox(height: 10),
                            UserInput(
                                label: questions[0],
                                hiddenLabel: 'Answer',
                                controllerName: firstAnswer,
                                regExp: r'[a-zA-Z0-9]'),
                            UserInput(
                                label: questions[1],
                                hiddenLabel: 'Answer',
                                controllerName: secondAnswer,
                                regExp: r'[a-zA-Z0-9]'),
                            UserInput(
                                label: questions[2],
                                hiddenLabel: 'Answer',
                                controllerName: thirdAnswer,
                                regExp: r'[a-zA-Z0-9]'),
                            Container(
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
                              height: 60 * screenScaling(context),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    createdQuestion = false;
                                    premadeQuestion = true;
                                  });
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 5.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: Center(
                                  child: SmallTextWidget(
                                    text: 'Submit',
                                    fontWeight: FontWeight.w600,
                                    textColor: 0xffffffff,
                                    fontsize: screenScalingToInt(context, 20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: isVisibleDivider,
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 1,
                                  width: 100,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffffffff),
                                  ),
                                ),
                                BigTextWidget(
                                    text: 'or',
                                    weight: FontWeight.bold,
                                    fontsize: screenScalingToInt(context, 25)),
                                Container(
                                  height: 1,
                                  width: 100,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Visibility(
                            visible: isVisibleCreateQuestionsButton,
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
                                  borderRadius: BorderRadius.circular(15)),
                              width: 350 * screenScaling(context),
                              height: 60 * screenScaling(context),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    isVisibleAnswerQuestionsButton = false;
                                    isVisibleAnswerQuestionsButton = false;
                                    isVisibleCancelButton2 = true;
                                    isVisibleCreatedQuestions = true;
                                    isVisibleDivider = false;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 5.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: Center(
                                  child: SmallTextWidget(
                                    text:
                                        'Create and answer security questions',
                                    fontWeight: FontWeight.w600,
                                    textColor: 0xffffffff,
                                    fontsize: screenScalingToInt(context, 20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: isVisibleCancelButton2,
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
                                  borderRadius: BorderRadius.circular(15)),
                              width: 350 * screenScaling(context),
                              height: 60 * screenScaling(context),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    isVisibleAnswerQuestionsButton = true;
                                    isVisibleAnswerQuestionsButton = true;
                                    isVisibleCancelButton2 = false;
                                    isVisibleCreatedQuestions = false;
                                    isVisibleDivider = true;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 5.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: Center(
                                  child: SmallTextWidget(
                                    text: 'Cancel',
                                    fontWeight: FontWeight.w600,
                                    textColor: 0xffffffff,
                                    fontsize: screenScalingToInt(context, 20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Visibility(
                        visible: isVisibleCreatedQuestions,
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: BigTextWidget(
                                  text:
                                      'Create and answer 3 security questions',
                                  weight: FontWeight.bold,
                                  fontsize: screenScalingToInt(context, 30)),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 430 * screenScaling(context),
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 5),
                                        TextField(
                                          controller: firstQuestion,
                                          style: TextStyle(color: Colors.white),
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'[a-zA-Z0-9? ]'))
                                          ],
                                          decoration: InputDecoration(
                                            hintText: 'First question',
                                            hintStyle: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize:
                                                  15 * screenScaling(context),
                                              color: const Color(0xffffffff)
                                                  .withOpacity(0.5),
                                            ),
                                            filled: true,
                                            fillColor:
                                                Colors.black.withOpacity(0.5),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xffc9ff99),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 430 * screenScaling(context),
                                    child: Column(
                                      children: [
                                        TextField(
                                          controller: firstAnswer2,
                                          style: TextStyle(color: Colors.black),
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'[a-zA-Z0-9 ]'))
                                          ],
                                          decoration: InputDecoration(
                                            hintText: 'Answer',
                                            hintStyle: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize:
                                                  15 * screenScaling(context),
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xffc9ff99),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 15),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 430 * screenScaling(context),
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 5),
                                        TextField(
                                          controller: secondQuestion,
                                          style: TextStyle(color: Colors.white),
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'[a-zA-Z0-9? ]'))
                                          ],
                                          decoration: InputDecoration(
                                            hintText: 'Second question',
                                            hintStyle: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize:
                                                  15 * screenScaling(context),
                                              color: const Color(0xffffffff)
                                                  .withOpacity(0.5),
                                            ),
                                            filled: true,
                                            fillColor:
                                                Colors.black.withOpacity(0.5),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xffc9ff99),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 430 * screenScaling(context),
                                    child: Column(
                                      children: [
                                        TextField(
                                          controller: secondAnswer2,
                                          style: TextStyle(color: Colors.black),
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'[a-zA-Z0-9 ]'))
                                          ],
                                          decoration: InputDecoration(
                                            hintText: 'Answer',
                                            hintStyle: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize:
                                                  15 * screenScaling(context),
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xffc9ff99),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 15),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 430 * screenScaling(context),
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 5),
                                        TextField(
                                          controller: thirdQuestion,
                                          style: TextStyle(color: Colors.white),
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'[a-zA-Z0-9? ]'))
                                          ],
                                          decoration: InputDecoration(
                                            hintText: 'Third question',
                                            hintStyle: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize:
                                                  15 * screenScaling(context),
                                              color: const Color(0xffffffff)
                                                  .withOpacity(0.5),
                                            ),
                                            filled: true,
                                            fillColor:
                                                Colors.black.withOpacity(0.5),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xffc9ff99),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 430 * screenScaling(context),
                                    child: Column(
                                      children: [
                                        TextField(
                                          controller: thirdAnswer2,
                                          style: TextStyle(color: Colors.black),
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'[a-zA-Z0-9 ]'))
                                          ],
                                          decoration: InputDecoration(
                                            hintText: 'Answer',
                                            hintStyle: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize:
                                                  15 * screenScaling(context),
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xffc9ff99),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 15),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
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
                              height: 60 * screenScaling(context),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    createdQuestion = true;
                                    premadeQuestion = false;
                                  });
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 5.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: Center(
                                  child: SmallTextWidget(
                                    text: 'Submit',
                                    fontWeight: FontWeight.w600,
                                    textColor: 0xffffffff,
                                    fontsize: screenScalingToInt(context, 20),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
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
