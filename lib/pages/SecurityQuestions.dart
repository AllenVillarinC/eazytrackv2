import 'dart:ui';
import 'package:eazytrackv2/components/BigTextWidget.dart';
import 'package:eazytrackv2/components/BigUserInputWidget.dart';
import 'package:eazytrackv2/components/CompanyLogo.dart';
import 'package:eazytrackv2/components/ScreenScale.dart';
import 'package:eazytrackv2/components/SmallTextWidget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SecurityQuestions extends StatefulWidget {
  const SecurityQuestions({super.key});

  @override
  State<SecurityQuestions> createState() => _SecurityQuestionsState();
}

class _SecurityQuestionsState extends State<SecurityQuestions> {
  TextEditingController firstAnswer = TextEditingController();
  TextEditingController secondAnswer = TextEditingController();
  TextEditingController thirdAnswer = TextEditingController();

  List<String> questions = [
    'What is the name of your favorite teacher?',
    'What was your favorite food as a child?',
    'What is the best movie of all time?'
  ];

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
                      Container(
                        decoration: BoxDecoration(
                            gradient: const SweepGradient(
                              colors: [Color(0xff151515), Color(0xff1f2c25)],
                              stops: [0.25, 0.75],
                              center: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        width: 350 * screenScaling(context),
                        height: 60 * screenScaling(context),
                        child: ElevatedButton(
                          onPressed: () {},
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
                      const SizedBox(height: 10),
                      Column(children: [
                        UserInput(
                            label: questions[0],
                            hiddenLabel: 'Answer',
                            controllerName: firstAnswer,
                            regExp: 'r[a-zA-Z0-9]'),
                        UserInput(
                            label: questions[1],
                            hiddenLabel: 'Answer',
                            controllerName: secondAnswer,
                            regExp: 'r[a-zA-Z0-9]'),
                        UserInput(
                            label: questions[2],
                            hiddenLabel: 'Answer',
                            controllerName: thirdAnswer,
                            regExp: 'r[a-zA-Z0-9]'),
                      ]),
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
                      Container(
                        decoration: BoxDecoration(
                            gradient: const SweepGradient(
                              colors: [Color(0xff151515), Color(0xff1f2c25)],
                              stops: [0.25, 0.75],
                              center: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        width: 350 * screenScaling(context),
                        height: 60 * screenScaling(context),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Center(
                            child: SmallTextWidget(
                              text: 'Create and answer security questions',
                              fontWeight: FontWeight.w600,
                              textColor: 0xffffffff,
                              fontsize: screenScalingToInt(context, 20),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Column(children: [
                        // SizedBox(
                        //   width: 430 * screenScaling(context),
                        //   child: Column(
                        //     children: [
                        //       Align(
                        //         alignment: Alignment.centerLeft,
                        //         child: SmallTextWidget(
                        //           text: widget.label,
                        //           fontWeight: FontWeight.normal,
                        //           textColor: 0xffffffff,
                        //           fontsize: 16,
                        //         ),
                        //       ),
                        //       const SizedBox(height: 5),
                        //       TextField(
                        //         controller: widget.controllerName,
                        //         inputFormatters: [
                        //           FilteringTextInputFormatter.allow(
                        //               RegExp(widget.regExp))
                        //         ],
                        //         decoration: InputDecoration(
                        //           hintText: widget.hiddenLabel,
                        //           hintStyle: TextStyle(
                        //             fontFamily: 'Inter',
                        //             fontSize: 15 * screenScaling(context),
                        //             color: const Color(0xff000000)
                        //                 .withOpacity(0.7),
                        //           ),
                        //           filled: true,
                        //           fillColor: const Color(0xffffffff),
                        //           focusedBorder: OutlineInputBorder(
                        //             borderSide: const BorderSide(
                        //                 color: Color(0xff0081B3), width: 2.0),
                        //             borderRadius: BorderRadius.circular(10),
                        //           ),
                        //           enabledBorder: OutlineInputBorder(
                        //             borderSide: const BorderSide(
                        //                 color: Color(0xffffffff), width: 2.0),
                        //             borderRadius: BorderRadius.circular(10),
                        //           ),
                        //         ),
                        //       ),
                        //       const SizedBox(height: 15),
                        //     ],
                        //   ),
                        // )
                      ]),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
