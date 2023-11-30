import 'dart:ui';

import 'package:eazytrackv2/components/BigTextWidget.dart';
import 'package:eazytrackv2/components/BigUserInputWidget.dart';
import 'package:eazytrackv2/components/CompanyLogo.dart';
import 'package:eazytrackv2/components/Controllers.dart';
import 'package:eazytrackv2/components/ScreenScale.dart';
import 'package:eazytrackv2/components/SmallTextWidget.dart';
import 'package:eazytrackv2/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SignInSecurityQuestionsPage extends StatefulWidget {
  const SignInSecurityQuestionsPage({super.key});

  @override
  State<SignInSecurityQuestionsPage> createState() =>
      _SignInSecurityQuestionsPageState();
}

class _SignInSecurityQuestionsPageState
    extends State<SignInSecurityQuestionsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Lottie.asset('assets/lottie/Animation - 1701142774656.json',
                fit: BoxFit.cover),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Container(),
          ),
          SingleChildScrollView(
            child: SizedBox(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const CompanyName(),
                  const SizedBox(height: 10),
                  BigTextWidget(
                      text: 'Security Questions',
                      weight: FontWeight.bold,
                      fontsize: screenScalingToInt(context, 40)),
                  const SizedBox(height: 20),
                  Stack(
                    children: [
                      Visibility(
                        visible: createdQuestion,
                        child: Column(
                          children: [
                            UserInput(
                                label: firstQuestion.text,
                                hiddenLabel: 'Answer',
                                controllerName: checkAnswer,
                                regExp: r'[a-zA-Z0-9 ]'),
                            const SizedBox(height: 10),
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
                        visible: premadeQuestion,
                        child: Column(
                          children: [
                            UserInput(
                                label: questions[0],
                                hiddenLabel: 'Answer',
                                controllerName: checkAnswer2,
                                regExp: r'[a-zA-Z0-9 ]'),
                            SizedBox(height: 10),
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
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
