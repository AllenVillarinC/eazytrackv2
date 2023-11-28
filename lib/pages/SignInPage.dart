import 'dart:ui';

import 'package:eazytrackv2/components/GreenLongButton.dart';
import 'package:eazytrackv2/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../components/0_Company.dart';
import '../components/1_ScreenScale.dart';
import '../components/Controllers.dart';
import '../components/T_BigText.dart';
import '../components/T_SmallText.dart';
import '../components/UI_UserInput.dart';
import '../components/UI_UserInputPassword.dart';
import 'CreateAccountPage.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff151515),
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
            SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const CompanyName(),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 430 * screenScaling(context),
                      child: const Row(
                        children: [
                          BigTextWidget(
                            text: 'Hi, Welcome back!',
                            weight: FontWeight.w800,
                            fontsize: 25,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    UserInput(
                      label: 'Email address',
                      hiddenLabel: 'Your email',
                      controllerName: emailaddress,
                      regExp: r'^[\w\.-]+@[\w\.-]+\.\w+$',
                    ),
                    UserInputPassword(
                      label: 'Password',
                      hintLabel: 'Password',
                      controllerName: password,
                    ),
                    SizedBox(
                      width: 430 * screenScaling(context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Theme(
                                  data: ThemeData(
                                      unselectedWidgetColor: Colors.white),
                                  child: Checkbox(
                                    activeColor: const Color(0xffC0FF99),
                                    value: isActive,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isActive = value!;
                                      });
                                    },
                                    checkColor: const Color(0xff000000),
                                  ),
                                ),
                                const SmallTextWidget(
                                    text: 'Remember me',
                                    fontWeight: FontWeight.normal,
                                    textColor: 0xffffffff,
                                    fontsize: 16),
                              ]),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                // open dart file for password retrieval
                              },
                              child: const SmallTextWidget(
                                  text: 'Forgot password?',
                                  fontWeight: FontWeight.bold,
                                  textColor: 0xffC0FF99,
                                  fontsize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const GreenLongButton(
                        text: 'Sign in', sendUserTo: HomePage()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SmallTextWidget(
                            text: "Don't have an account?",
                            fontWeight: FontWeight.normal,
                            textColor: 0xffffffff,
                            fontsize: 16),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CreateAccountPage()),
                            );
                          },
                          child: const SmallTextWidget(
                              text: 'Sign up',
                              fontWeight: FontWeight.bold,
                              textColor: 0xffC0FF99,
                              fontsize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}