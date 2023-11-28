import 'dart:ui';

import 'package:eazytrackv2/components/1_ScreenScale.dart';
import 'package:eazytrackv2/components/PurpleLongButton.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../components/0_Company.dart';
import '../components/GreenLongButton.dart';
import '../components/T_SmallText.dart';
import 'CreateAccountPage.dart';
import 'SignInPage.dart';

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
            Center(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: 430 * screenScaling(context),
                  child: Column(
                    children: [
                      Lottie.asset('assets/lottie/animation_lnypvfyy.json'),
                      const CompanyName(),
                      const SmallTextWidget(
                          text: 'Track expenses Eazy!',
                          fontWeight: FontWeight.normal,
                          textColor: 0xffffffff,
                          fontsize: 20),
                      const SizedBox(height: 25),
                      const GreenLongButton(
                          text: 'Sign in', sendUserTo: SigninPage()),
                      const SizedBox(height: 10),
                      const PurpleLongButton(
                          text: 'Create account',
                          sendUserTo: CreateAccountPage()),
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
