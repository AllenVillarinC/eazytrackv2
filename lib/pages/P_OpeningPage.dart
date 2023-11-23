import 'package:eazytrackv2/components/PurpleLongButton.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../components/0_Company.dart';
import '../components/GreenLongButton.dart';
import '../components/T_SmallText.dart';
import 'P_CreateAccountPage.dart';
import 'P_SignInPage.dart';

class OpeningPage extends StatefulWidget {
  const OpeningPage({super.key});

  @override
  State<OpeningPage> createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff151515),
        body: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              child: Column(
                children: [
                  Lottie.asset('assets/lottie/animation_lnypvfyy.json'),
                  const CompanyName(),
                  const SmallTextWidget(
                      text: 'Track expenses Eazy!',
                      fontWeight: FontWeight.normal,
                      textColor: 0xffffffff,
                      fontsize: 16),
                  const SizedBox(height: 50),
                  const GreenLongButton(
                      text: 'Sign in', sendUserTo: SigninPage()),
                  const SizedBox(height: 20),
                  const PurpleLongButton(
                      text: 'Create account', sendUserTo: CreateAccountPage())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
