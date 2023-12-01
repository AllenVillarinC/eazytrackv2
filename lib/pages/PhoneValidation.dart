import 'dart:ui';
import 'package:eazytrackv2/components/CompanyLogo.dart';
import 'package:eazytrackv2/components/Controllers.dart';
import 'package:eazytrackv2/components/ScreenScale.dart';
import 'package:eazytrackv2/components/SmallTextWidget.dart';
import 'package:eazytrackv2/pages/EditProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';

class PhoneValidationPage extends StatefulWidget {
  const PhoneValidationPage({super.key});

  @override
  State<PhoneValidationPage> createState() => _PhoneValidationPageState();
}

class _PhoneValidationPageState extends State<PhoneValidationPage> {
  Widget buildPinPut() {
    return Pinput(
      onCompleted: (pin) => print(pin),
    );
  }

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
                                text: 'Phone number security code',
                                fontWeight: FontWeight.normal,
                                textColor: 0xffffffff,
                                fontsize: screenScalingToInt(context, 25)),
                          ),
                          const SizedBox(height: 10),
                          buildPinPut(),
                          const SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                                gradient: const SweepGradient(
                                  colors: [
                                    Color(0xff1f2c25),
                                    Color(0xffc9ff99)
                                  ],
                                  stops: [0.2, 0.75],
                                  center: Alignment.topRight,
                                ),
                                borderRadius: BorderRadius.circular(15)),
                            width: 350 * screenScaling(context),
                            height: 60 * screenScaling(context),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  userSecurityForm = true;
                                  privacyAndVisiblityInfo = false;
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const EditProfilePage()),
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
                                  text: 'Authenticate',
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
