import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:eazytrackv2/components/BigTextWidget.dart';
import 'package:eazytrackv2/components/CompanyLogo.dart';
import 'package:eazytrackv2/components/Controllers.dart';
import 'package:eazytrackv2/components/ScreenScale.dart';
import 'package:eazytrackv2/components/SmallTextWidget.dart';
import 'package:eazytrackv2/components/UserPasswordInputWidget.dart';
import 'package:eazytrackv2/pages/SignInPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_pw_validator/Resource/Strings.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:lottie/lottie.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class PasswordValidatorStrings implements FlutterPwValidatorStrings {
  @override
  final String atLeast = '- At least a minimum of 8 characters.';
  @override
  final String uppercaseLetters = '- At least 1 uppercase letter.';
  @override
  final String numericCharacters = '- At least 1 numeric.';
  @override
  final String specialCharacters = '- At least 1 special character.';
  @override
  final String lowercaseLetters = '';
  @override
  final String normalLetters = '';
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool isCreateAccountButtonVisible = false;
  bool passwordNotMatch = false;
  bool passwordMatch = false;
  bool passwordsEmpty = false;
  bool missingRequirements = false;

  int mininumChar = 0;
  int minimumUpper = 0;
  int minimumNumeric = 0;
  int minimumSpecial = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
            Center(
              child: SizedBox(
                width: 430 * screenScaling(context),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    CompanyName(),
                    const SizedBox(height: 10),
                    BigTextWidget(
                        text: 'Change password',
                        weight: FontWeight.bold,
                        fontsize: screenScalingToInt(context, 40)),
                    const SizedBox(height: 20),
                    SmallTextWidget(
                        text: 'Please enter your new password',
                        fontWeight: FontWeight.normal,
                        textColor: 0xffffffff,
                        fontsize: screenScalingToInt(context, 25)),
                    const SizedBox(height: 20),
                    UserInputPassword(
                      label: 'Password',
                      hintLabel: 'Password',
                      controllerName: password,
                    ),
                    UserInputPassword(
                      label: 'Re-enter Password',
                      hintLabel: 'Re-enter Password',
                      controllerName: confirmpassword,
                    ),
                    const SizedBox(height: 10),
                    Stack(
                      children: [
                        Visibility(
                          visible: passwordNotMatch,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: SweepGradient(
                                colors: [
                                  const Color(0xff151515).withOpacity(0.5),
                                  const Color(0xffff0505).withOpacity(0.5)
                                ],
                                stops: const [0.25, 0.75],
                                center: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(15),
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
                                        'Passwords do not match.',
                                        textStyle: TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize:
                                                15 * screenScaling(context),
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Poppins'),
                                        speed: const Duration(milliseconds: 20),
                                      ),
                                    ],
                                    totalRepeatCount: 1,
                                    pause: const Duration(milliseconds: 2500),
                                  ),
                                ),
                              ],
                            ),
                          )
                              .animate()
                              .shimmer(
                                  delay: 500.milliseconds,
                                  duration: 500.milliseconds)
                              .fade(),
                        ),
                        Visibility(
                          visible: passwordsEmpty,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: SweepGradient(
                                colors: [
                                  const Color(0xff151515).withOpacity(0.5),
                                  const Color(0xffff0505).withOpacity(0.5)
                                ],
                                stops: const [0.25, 0.75],
                                center: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(15),
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
                                const SizedBox(width: 5),
                                Expanded(
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                        'Textfields are empty. Please enter your passwords.',
                                        textStyle: TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize:
                                                15 * screenScaling(context),
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Poppins'),
                                        speed: const Duration(milliseconds: 20),
                                      ),
                                    ],
                                    totalRepeatCount: 1,
                                    pause: const Duration(milliseconds: 2500),
                                  ),
                                ),
                              ],
                            ),
                          )
                              .animate()
                              .shimmer(
                                  delay: 500.milliseconds,
                                  duration: 500.milliseconds)
                              .fade(),
                        ),
                        Visibility(
                          visible: missingRequirements,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: SweepGradient(
                                colors: [
                                  const Color(0xff151515).withOpacity(0.5),
                                  const Color(0xffff0505).withOpacity(0.5)
                                ],
                                stops: const [0.25, 0.75],
                                center: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(15),
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
                                const SizedBox(width: 5),
                                Expanded(
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TyperAnimatedText(
                                        'Missing requirements',
                                        textStyle: TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize:
                                                15 * screenScaling(context),
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Poppins'),
                                        speed: const Duration(milliseconds: 20),
                                      ),
                                    ],
                                    totalRepeatCount: 1,
                                    pause: const Duration(milliseconds: 2500),
                                  ),
                                ),
                              ],
                            ),
                          )
                              .animate()
                              .shimmer(
                                  delay: 500.milliseconds,
                                  duration: 500.milliseconds)
                              .fade(),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    FlutterPwValidator(
                      width: 430 * screenScaling(context),
                      height: 80,
                      minLength: 8,
                      specialCharCount: 1,
                      uppercaseCharCount: 1,
                      numericCharCount: 1,
                      controller: password,
                      onSuccess: () {
                        setState(() {
                          mininumChar = 8;
                          minimumUpper = 1;
                          minimumNumeric = 1;
                          minimumSpecial = 1;
                        });
                      },
                      onFail: () {},
                      strings: FlutterPwValidatorStrings(),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                          gradient: const SweepGradient(
                            colors: [Color(0xff1f2c25), Color(0xffc9ff99)],
                            stops: [0.2, 0.75],
                            center: Alignment.topRight,
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      width: 350 * screenScaling(context),
                      height: 60 * screenScaling(context),
                      child: ElevatedButton(
                        onPressed: () {
                          if ((password.text.isEmpty &&
                                  confirmpassword.text.isEmpty) ||
                              (password.text == '' &&
                                  confirmpassword.text == '')) {
                            setState(() {
                              passwordsEmpty = true;
                              passwordNotMatch = false;
                              missingRequirements = false;
                            });
                          } else if (password.text != confirmpassword.text) {
                            setState(() {
                              passwordsEmpty = false;
                              passwordNotMatch = true;
                              missingRequirements = false;
                            });
                          } else if (mininumChar != 8 &&
                              minimumUpper != 1 &&
                              minimumNumeric != 1 &&
                              minimumSpecial != 1) {
                            setState(() {
                              passwordsEmpty = false;
                              passwordNotMatch = false;
                              missingRequirements = true;
                            });
                          } else if ((password.text == confirmpassword.text) &&
                              (minimumNumeric == 1 &&
                                  minimumSpecial == 1 &&
                                  minimumUpper == 1 &&
                                  mininumChar == 8)) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SigninPage()),
                            );
                            setState(() {
                              password.clear();
                            });
                          }
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
                            text: 'Create account',
                            fontWeight: FontWeight.w600,
                            textColor: 0xffffffff,
                            fontsize: screenScalingToInt(context, 20),
                          ),
                        ),
                      ),
                    )
                        .animate()
                        .shimmer(
                            delay: 500.milliseconds, duration: 500.milliseconds)
                        .fade()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
