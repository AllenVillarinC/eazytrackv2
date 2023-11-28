import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../components/0_Company.dart';
import '../components/1_ScreenScale.dart';
import '../components/GreenLongButton.dart';
import '../components/Controllers.dart';
import '../components/T_BigText.dart';
import '../components/T_SmallText.dart';
import '../components/UI_UserInput.dart';
import '../components/UI_UserInputPassword.dart';
import 'AccountSetupPage.dart';
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
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: BigTextWidget(
                        text: 'Let\'s get you started.',
                        weight: FontWeight.w800,
                        fontsize: 25,
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
                    const GreenLongButton(
                      text: 'Create account',
                      sendUserTo: AccountSetupPage(),
                    ),
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
