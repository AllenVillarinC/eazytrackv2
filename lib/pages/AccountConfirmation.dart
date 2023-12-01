import 'dart:ui';
import 'package:eazytrackv2/components/BigTextWidget.dart';
import 'package:eazytrackv2/components/CompanyLogo.dart';
import 'package:eazytrackv2/components/Controllers.dart';
import 'package:eazytrackv2/components/GreenLongButton.dart';
import 'package:eazytrackv2/components/ScreenScale.dart';
import 'package:eazytrackv2/components/SmallTextWidget.dart';
import 'package:eazytrackv2/pages/SecurityQuestions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';

class AccountConfirmationPage extends StatefulWidget {
  const AccountConfirmationPage({super.key});

  @override
  State<AccountConfirmationPage> createState() =>
      _AccountConfirmationPageState();
}

class _AccountConfirmationPageState extends State<AccountConfirmationPage> {
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  Widget buildPinPut() {
    return Pinput(
      onCompleted: (pin) => print(pin),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            SingleChildScrollView(
              child: Center(
                child: SizedBox(
                  width: 430 * screenScaling(context),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const CompanyName(),
                      const SizedBox(height: 20),
                      BigTextWidget(
                          text: 'Account Confirmation',
                          weight: FontWeight.bold,
                          fontsize: screenScalingToInt(context, 40)),
                      const SizedBox(height: 10),
                      SmallTextWidget(
                          text:
                              'EazyTrack sent a 4 character code to ${emailaddress.text} and to ${phonenumber.text}. Please input both unique codes.',
                          fontWeight: FontWeight.normal,
                          textColor: 0xffffffff,
                          fontsize: screenScalingToInt(context, 25)),
                      const SizedBox(height: 20),
                      SmallTextWidget(
                          text: 'Enter codes to confirm authentication',
                          fontWeight: FontWeight.bold,
                          textColor: 0xffffffff,
                          fontsize: screenScalingToInt(context, 30)),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 350 * screenScaling(context),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: SmallTextWidget(
                                  text: 'E-mail security code',
                                  fontWeight: FontWeight.normal,
                                  textColor: 0xffffffff,
                                  fontsize: screenScalingToInt(context, 25)),
                            ),
                            const SizedBox(height: 10),
                            buildPinPut(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
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
                              text: 'and',
                              weight: FontWeight.bold,
                              fontsize: screenScalingToInt(context, 30)),
                          Container(
                            height: 1,
                            width: 100,
                            decoration: const BoxDecoration(
                              color: Color(0xffffffff),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 350 * screenScaling(context),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: SmallTextWidget(
                                  text: 'Phone number security code',
                                  fontWeight: FontWeight.normal,
                                  textColor: 0xffffffff,
                                  fontsize: screenScalingToInt(context, 25)),
                            ),
                            const SizedBox(height: 10),
                            buildPinPut(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const GreenLongButton(
                          text: 'Confirm', sendUserTo: SecurityQuestions()),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BigTextWidget(
                              text: 'Not receiving your codes?',
                              weight: FontWeight.normal,
                              fontsize: screenScalingToInt(context, 25)),
                          TextButton(
                            onPressed: () {},
                            child: SmallTextWidget(
                                text: 'Resend',
                                fontWeight: FontWeight.normal,
                                textColor: 0xffc9ff99,
                                fontsize: screenScalingToInt(context, 25)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
