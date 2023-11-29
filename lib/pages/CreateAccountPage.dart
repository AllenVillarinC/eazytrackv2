import 'dart:ui';
import 'package:eazytrackv2/components/GreenLongButton.dart';
import 'package:eazytrackv2/pages/AccountConfirmation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../components/CompanyLogo.dart';
import '../components/ScreenScale.dart';
import '../components/Controllers.dart';
import '../components/BigTextWidget.dart';
import '../components/SmallTextWidget.dart';
import '../components/BigUserInputWidget.dart';
import '../components/UserPasswordInputWidget.dart';
import 'SignInPage.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
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
                      UserInput(
                          label: 'Phone number',
                          hiddenLabel: 'Your number',
                          controllerName: phonenumber,
                          regExp: 'r[0-9]'),
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
                      GreenLongButton(
                          text: 'Sign up',
                          sendUserTo: AccountConfirmationPage()),
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
      ),
    );
  }
}
