import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:eazytrackv2/components/0_Company.dart';
import 'package:eazytrackv2/components/1_ScreenScale.dart';
import 'package:eazytrackv2/components/GreenLongButton.dart';
import 'package:eazytrackv2/components/Methods.dart';
import 'package:eazytrackv2/components/T_BigText.dart';
import 'package:eazytrackv2/components/T_SmallText.dart';
import 'package:eazytrackv2/pages/5AddPayment.dart';
import 'package:eazytrackv2/pages/2EazybudgetInput.dart';
import 'package:eazytrackv2/pages/P_EditProfile.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class HomePageEazyBudget extends StatefulWidget {
  const HomePageEazyBudget({super.key});

  @override
  State<HomePageEazyBudget> createState() => _HomePageEazyBudget();
}

class _HomePageEazyBudget extends State<HomePageEazyBudget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff151515),
        body: Center(
          child: SizedBox(
            width: 430 * screenScaling(context),
            child: Column(
              children: [
                const SizedBox(height: 15),
                const CompanyName(),
                const SizedBox(height: 15),
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
                    onPressed: () {
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
                                'Below is your EazyBudget. The amount that you should spend every month based on your monthly income.',
                                textStyle: TextStyle(
                                    color: const Color(0xffffffff),
                                    fontSize: 15 * screenScaling(context),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins'),
                                speed: const Duration(milliseconds: 30),
                              ),
                              TyperAnimatedText(
                                'Again, if there is a change of income, an increase or a decrease, you can generate your new EazyBudget anytime by pressing the "Generate New EazyBudget" button.',
                                textStyle: TextStyle(
                                    color: const Color(0xffffffff),
                                    fontSize: 15 * screenScaling(context),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins'),
                                speed: const Duration(milliseconds: 30),
                              ),
                              TyperAnimatedText(
                                'Whenever you are ready, press the "Add payment" button and we can proceed to the second step.',
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
                Column(
                  children: [
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
                          weight: FontWeight.w600,
                          fontsize: 25,
                        )),
                    const SizedBox(height: 15),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SmallTextWidget(
                                text: calculateEazyBudget(),
                                fontWeight: FontWeight.bold,
                                textColor: 0xffffffff,
                                fontsize: 25),
                            Container(
                              width: 270 * screenScaling(context),
                              height: 30,
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
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const GenerateEazyBudget()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: const BorderSide(
                                      color: Color(0xff000000),
                                      width: 0.5,
                                    ),
                                  ),
                                ),
                                child: const SmallTextWidget(
                                    text: 'Generate New EazyBudget',
                                    fontWeight: FontWeight.normal,
                                    textColor: 0xffffffff,
                                    fontsize: 15),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 15,
                                  width: 270,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff1F2C25),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                Container(
                                  height: 15,
                                  width: 0,
                                  decoration: BoxDecoration(
                                    gradient: const SweepGradient(
                                      colors: [
                                        Color(0xff1f2c25),
                                        Color(0xffC3A9FF)
                                      ],
                                      stops: [0.2, 0.75],
                                      center: Alignment.topRight,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ],
                            ),
                            SmallTextWidget(
                                text: calculateEazyBudget(),
                                fontWeight: FontWeight.bold,
                                textColor: 0xffffffff,
                                fontsize: 25)
                          ],
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
                Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: BigTextWidget(
                        text: 'Total payment:',
                        weight: FontWeight.w600,
                        fontsize: 25,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const GreenLongButton(
                        text: 'Add payment', sendUserTo: AddPaymentPage()),
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
                          text: 'Payment details:',
                          weight: FontWeight.w600,
                          fontsize: 25,
                        )),
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
                                  'Add payment for Eazybudget to analyze and remind you when payment is due',
                              fontWeight: FontWeight.normal,
                              textColor: 0xffffffff,
                              fontsize: 12),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
