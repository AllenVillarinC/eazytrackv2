import 'dart:ui';
import 'package:eazytrackv2/components/CompanyLogo.dart';
import 'package:eazytrackv2/components/ScreenScale.dart';
import 'package:eazytrackv2/components/GreenLongButton.dart';
import 'package:eazytrackv2/components/BigTextWidget.dart';
import 'package:eazytrackv2/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../components/Methods.dart';

class AccountSetupPage extends StatefulWidget {
  const AccountSetupPage({super.key});

  @override
  State<AccountSetupPage> createState() => _AccountSetupPageState();
}

class _AccountSetupPageState extends State<AccountSetupPage> {
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
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const CompanyName(),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: BigTextWidget(
                          text: 'Let\'s get to know you.',
                          weight: FontWeight.w800,
                          fontsize: screenScalingToInt(context, 50),
                        ),
                      ),
                      const SizedBox(height: 10),
                      userInformationForm(context),
                      const GreenLongButton(
                        text: 'Continue',
                        sendUserTo: HomePage(),
                      ),
                      const SizedBox(height: 20),
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
