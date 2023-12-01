import 'dart:ui';

import 'package:eazytrackv2/components/BigTextWidget.dart';
import 'package:eazytrackv2/components/CompanyLogo.dart';
import 'package:eazytrackv2/components/ScreenScale.dart';
import 'package:eazytrackv2/components/SmallTextWidget.dart';
import 'package:eazytrackv2/pages/EmailValidation.dart';
import 'package:eazytrackv2/pages/PhoneValidation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SendCodeTo extends StatefulWidget {
  const SendCodeTo({super.key});

  @override
  State<SendCodeTo> createState() => _SendCodeToState();
}

class _SendCodeToState extends State<SendCodeTo> {
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
                        text: 'Account security',
                        weight: FontWeight.bold,
                        fontsize: screenScalingToInt(context, 40)),
                    const SizedBox(height: 20),
                    SmallTextWidget(
                        text:
                            'As part our security, EazyTrack will send a 4 digit authentication code to verify and authenticate the identity of users during login or sensitive transactions. This additional layer of security ensures that only authorized individuals have access to EazyTrack\'s platform, reinforcing our commitment to safeguarding your information and providing you with a secure and reliable experience.',
                        fontWeight: FontWeight.normal,
                        textColor: 0xffffffff,
                        fontsize: screenScalingToInt(context, 25)),
                    const SizedBox(height: 20),
                    SmallTextWidget(
                        text:
                            'Please choose where EazyTrack should send the verification code.',
                        fontWeight: FontWeight.bold,
                        textColor: 0xffffffff,
                        fontsize: screenScalingToInt(context, 25)),
                    const SizedBox(height: 20),
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
                                builder: (context) => const EmailValidationPage()),
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
                            text: 'Send code to e-mail',
                            fontWeight: FontWeight.w600,
                            textColor: 0xffffffff,
                            fontsize: screenScalingToInt(context, 20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 1,
                          width: 100,
                          decoration: const BoxDecoration(
                            color: Color(0xffffffff),
                          ),
                        ),
                        BigTextWidget(
                            text: 'or',
                            weight: FontWeight.bold,
                            fontsize: screenScalingToInt(context, 25)),
                        Container(
                          height: 1,
                          width: 100,
                          decoration: const BoxDecoration(
                            color: Color(0xffffffff),
                          ),
                        ),
                      ],
                    ),
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
                                builder: (context) => const PhoneValidationPage()),
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
                            text: 'Send code to phone number',
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
            ),
          ],
        ),
      ),
    );
  }
}
