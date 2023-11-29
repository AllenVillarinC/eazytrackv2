import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../components/CompanyLogo.dart';
import '../components/ScreenScale.dart';
import '../components/Controllers.dart';
import '../components/BigTextWidget.dart';
import '../components/SmallTextWidget.dart';
import '../components/BigUserInputWidget.dart';
import '../components/UserPasswordInputWidget.dart';
import 'AccountSetupPage.dart';
import 'SignInPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:eazytrackv2/auth.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  String? errorMessageAuthB = '';
  bool isLogin = true;

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: emailaddress.text,
        password: password.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessageAuthB = e.message;
      });
    }
  }

  Widget _signUpButton(BuildContext context) {
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
        onPressed: () {
          createUserWithEmailAndPassword();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AccountSetupPage()),
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
            text: 'Create account',
            fontWeight: FontWeight.w600,
            textColor: 0xffffffff,
            fontsize: screenScalingToInt(context, 20),
          ),
        ),
      ),
    );
  }

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
              child: Center(
                child: SizedBox(
                  width: 430 * screenScaling(context),
                  child: Column(children: [
                    const SizedBox(height: 20),
                    const CompanyName(),
                    const SizedBox(height: 15),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: BigTextWidget(
                        text: 'Let\'s get you started.',
                        weight: FontWeight.w800,
                        fontsize: screenScalingToInt(context, 50),
                      ),
                    ),
                    const SizedBox(height: 15),
                    UserInput(
                      label: 'Email address',
                      hiddenLabel: 'Your email',
                      controllerName: emailaddress,
                      regExp: r'[a-z-0-9\@._]+',
                    ),
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
                    SizedBox(height: 15),
                    _signUpButton(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SmallTextWidget(
                          text: 'Already have an account?',
                          fontWeight: FontWeight.normal,
                          textColor: 0xffffffff,
                          fontsize: 16,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SigninPage()),
                            );
                          },
                          child: const SmallTextWidget(
                            text: 'Sign In',
                            fontWeight: FontWeight.bold,
                            textColor: 0xffC0FF99,
                            fontsize: 16,
                          ),
                        ),
                      ],
                    )
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
