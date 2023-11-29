import 'dart:ui';
import 'package:eazytrackv2/components/GreenLongButton.dart';
import 'package:eazytrackv2/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../components/CompanyLogo.dart';
import '../components/ScreenScale.dart';
import '../components/Controllers.dart';
import '../components/BigTextWidget.dart';
import '../components/SmallTextWidget.dart';
import '../components/BigUserInputWidget.dart';
import '../components/UserPasswordInputWidget.dart';
import 'CreateAccountPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:eazytrackv2/auth.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  String? errorMessageAuthA = '';
  bool isLogin = true;

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: emailaddress.text,
        password: password.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessageAuthA = e.message;
      });
    }
  }

  Widget errorMessageSignIn() {
    return Text(errorMessageAuthA == '' ? '' : 'Humm ? $errorMessageAuthA');
  }

  Widget _signInButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const SweepGradient(
          colors: [Color(0xff1f2c25), Color(0xffc9ff99)],
          stops: [0.2, 0.75],
          center: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      width: 350 * screenScaling(context),
      height: 60 * screenScaling(context),
      child: ElevatedButton(
        onPressed: signInWithEmailAndPassword,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Center(
          child: SmallTextWidget(
            text: 'Sign in',
            fontWeight: FontWeight.w600,
            textColor: 0xffffffff,
            fontsize: screenScalingToInt(context, 20),
          ),
        ),
      ),
    );
  }

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
                    _signInButton(context),
                    const SizedBox(height: 5),
                    errorMessageSignIn(),
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
