import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:eazytrackv2/components/0_Company.dart';
import 'package:eazytrackv2/components/1_ScreenScale.dart';
import 'package:eazytrackv2/components/Controllers.dart';
import 'package:eazytrackv2/components/GreenLongButton.dart';
import 'package:eazytrackv2/components/T_BigText.dart';
import 'package:eazytrackv2/components/T_SmallText.dart';
import 'package:eazytrackv2/pages/2EazybudgetInput.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class HomePageNewUser extends StatefulWidget {
  const HomePageNewUser({super.key});

  @override
  State<HomePageNewUser> createState() => _HomePageNewUser();
}

class _HomePageNewUser extends State<HomePageNewUser> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff151515),
        body: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              width: 430 * screenScaling(context),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  const CompanyName(),
                  const SizedBox(height: 15),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: const SweepGradient(
                            colors: [Color(0xff151515), Color(0xff1f2c25)],
                            stops: [0.25, 0.75],
                            center: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: 430 * screenScaling(context),
                        height: 100,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 85,
                                width: 55,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: const ClipOval(
                                  child: RiveAnimation.asset(
                                    'assets/rive/3287-6917-headless-bear.riv',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: AnimatedTextKit(
                                  animatedTexts: [
                                    TyperAnimatedText(
                                      'Nice to finally meet you, ${fname.text}. My name is Sven. EazyTrack\'s virtual assistant.',
                                      textStyle: TextStyle(
                                          color: const Color(0xffffffff),
                                          fontSize: 15 * screenScaling(context),
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Poppins'),
                                      speed: const Duration(milliseconds: 30),
                                    ),
                                    TyperAnimatedText(
                                      'Whenever you are ready, press the "Generate EazyBudget" button to get your EazyBudget!',
                                      textStyle: TextStyle(
                                          color: const Color(0xffffffff),
                                          fontSize: 15 * screenScaling(context),
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Poppins'),
                                      speed: const Duration(milliseconds: 30),
                                    ),
                                  ],
                                  totalRepeatCount: 1,
                                  pause: const Duration(milliseconds: 2500),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                          height: 1,
                          width: 200,
                          decoration:
                              const BoxDecoration(color: Color(0xffffffff))),
                      const SizedBox(height: 15),
                    ],
                  ),
                  Column(
                    children: [
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: BigTextWidget(
                            text: 'Your remaining EazyBudget:',
                            weight: FontWeight.w800,
                            fontsize: 25,
                          )),
                      const SizedBox(height: 15),
                      Container(
                        decoration: BoxDecoration(
                            gradient: const SweepGradient(
                              colors: [Color(0xff1f2c25), Color(0xffc9ff99)],
                              stops: [0.2, 0.75],
                              center: Alignment.topRight,
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        width: 430 * screenScaling(context),
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {
                            // add here
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
                              text: 'Generate EazyBudget',
                              fontWeight: FontWeight.w600,
                              textColor: 0xffffffff,
                              fontsize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                          height: 1,
                          width: 200,
                          decoration:
                              const BoxDecoration(color: Color(0xffffffff))),
                      const SizedBox(height: 15),
                    ],
                  ),
                  Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: BigTextWidget(
                          text: 'Total payment:',
                          weight: FontWeight.w800,
                          fontsize: 25,
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Row(
                        children: [
                          SizedBox(
                            height: 50,
                            child: Icon(
                              Icons.priority_high,
                              color: Color(0xffc9ff99),
                            ),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: SmallTextWidget(
                                text:
                                    'Generate Eazybudget first before adding your payment',
                                fontWeight: FontWeight.normal,
                                textColor: 0xffffffff,
                                fontsize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Container(
                          height: 1,
                          width: 200,
                          decoration:
                              const BoxDecoration(color: Color(0xffffffff))),
                      const SizedBox(height: 15),
                    ],
                  ),
                  const Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: BigTextWidget(
                            text: 'Payment details:',
                            weight: FontWeight.w800,
                            fontsize: 25,
                          )),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          SizedBox(
                            height: 50,
                            child: Icon(
                              Icons.priority_high,
                              color: Color(0xffc9ff99),
                            ),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: SmallTextWidget(
                                text:
                                    'Generate Eazybudget first and add your payment for EazyBudget to analyze your spending pattern and remind you when payment is due',
                                fontWeight: FontWeight.normal,
                                textColor: 0xffffffff,
                                fontsize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 400 * screenScaling(context),
                    height: 400 * screenScaling(context),
                    child: const RiveAnimation.asset(
                      'assets/rive/5613-11021-404-cat.riv',
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
