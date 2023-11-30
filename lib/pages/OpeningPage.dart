import 'dart:ui';

import 'package:eazytrackv2/components/ScreenScale.dart';
import 'package:eazytrackv2/components/PurpleLongButton.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../components/CompanyLogo.dart';
import '../components/GreenLongButton.dart';
import '../components/SmallTextWidget.dart';
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
                      SmallTextWidget(
                          text: 'Track expenses Eazy!',
                          fontWeight: FontWeight.normal,
                          textColor: 0xffffffff,
                          fontsize: screenScalingToInt(context, 25)),
                      const SizedBox(height: 25),
                      const GreenLongButton(
                          text: 'Sign in', sendUserTo: SigninPage()),
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateAccountPage()),
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
                      )
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
