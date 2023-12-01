import 'dart:ui';

import 'package:eazytrackv2/components/BigTextWidget.dart';
import 'package:eazytrackv2/components/BigUserInputWidget.dart';
import 'package:eazytrackv2/components/CompanyLogo.dart';
import 'package:eazytrackv2/components/Controllers.dart';
import 'package:eazytrackv2/components/ScreenScale.dart';
import 'package:eazytrackv2/components/SmallTextWidget.dart';
import 'package:eazytrackv2/pages/ChangePasswordPage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  TextEditingController recoveryEmail = TextEditingController();
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
                    const CompanyName(),
                    const SizedBox(height: 10),
                    BigTextWidget(
                        text: 'Account recovery',
                        weight: FontWeight.bold,
                        fontsize: screenScalingToInt(context, 40)),
                    const SizedBox(height: 20),
                    SmallTextWidget(
                        text:
                            'As part of our security, type in your e-mail for EazyTrack to send a reset password link.',
                        fontWeight: FontWeight.normal,
                        textColor: 0xffffffff,
                        fontsize: screenScalingToInt(context, 25)),
                    const SizedBox(height: 20),
                    UserInput(
                        label: 'E-mail address',
                        hiddenLabel: 'E-mail address',
                        controllerName: recoveryEmail,
                        regExp: r'^[\w\.-]+@[\w\.-]+\.\w+$'),
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
                          setState(() {
                            password.clear();
                            confirmpassword.clear();
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChangePasswordPage()),
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
                            text: 'Send password link',
                            fontWeight: FontWeight.w600,
                            textColor: 0xffffffff,
                            fontsize: screenScalingToInt(context, 20),
                          ),
                        ),
                      ),
                    ),
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
