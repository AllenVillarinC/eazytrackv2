import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:eazytrackv2/components/0_Company.dart';
import 'package:eazytrackv2/components/1_ScreenScale.dart';
import 'package:eazytrackv2/components/GreenLongButton.dart';
import 'package:eazytrackv2/components/Controllers.dart';
import 'package:eazytrackv2/components/Methods.dart';
import 'package:eazytrackv2/components/T_BigText.dart';
import 'package:eazytrackv2/components/T_SmallText.dart';
import 'package:eazytrackv2/pages/5AddPayment.dart';
import 'package:eazytrackv2/pages/P_EditProfile.dart';
import 'package:eazytrackv2/pages/2EazybudgetInput.dart';
import 'package:eazytrackv2/pages/user_reports_page.dart';
import 'package:eazytrackv2/pages/view_details_page.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePage();
}

class _MainHomePage extends State<MainHomePage> {
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
                const CompanyName(),
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
                                'You are all set up!',
                                textStyle: TextStyle(
                                    color: const Color(0xffffffff),
                                    fontSize: 15 * screenScaling(context),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins'),
                                speed: const Duration(milliseconds: 30),
                              ),
                              TyperAnimatedText(
                                'If you want to view your details or the reports I have based on your spending, press the "View Details" or the "Reports button" for more information.',
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
                                text: calculateBudgetDifference(),
                                fontWeight: FontWeight.bold,
                                textColor: 0xffc9ff99,
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
                                  width: calculatePercentBar(),
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
                SizedBox(
                  width: 430 * screenScaling(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: BigTextWidget(
                              text: 'Total payment:',
                              weight: FontWeight.bold,
                              fontsize: 25,
                            ),
                          ),
                          const SizedBox(height: 15),
                          SmallTextWidget(
                            text: '\$ ${payment.text}',
                            fontWeight: FontWeight.bold,
                            textColor: 0xffc9ff99,
                            fontsize: 25,
                          ),
                          const SizedBox(height: 15),
                          const GreenLongButton(
                            text: 'View Details',
                            sendUserTo: ViewDetailsPage(),
                          ),
                          const SizedBox(height: 10),
                          const GreenLongButton(
                            text: 'Report',
                            sendUserTo: UserReportsPage(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                    height: 1,
                    width: 200,
                    decoration: const BoxDecoration(color: Color(0xffffffff))),
                const SizedBox(height: 15),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: BigTextWidget(
                      text: 'Payment details:',
                      weight: FontWeight.bold,
                      fontsize: 25),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 1,
                        width: 70,
                        decoration:
                            const BoxDecoration(color: Color(0xffffffff))),
                    SmallTextWidget(
                        text: paymentTitle.text,
                        fontWeight: FontWeight.bold,
                        textColor: 0xffc9ff99,
                        fontsize: 20),
                    Container(
                        height: 1,
                        width: 70,
                        decoration:
                            const BoxDecoration(color: Color(0xffffffff))),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SmallTextWidget(
                        text: 'Payment amount:',
                        fontWeight: FontWeight.normal,
                        textColor: 0xffffffff,
                        fontsize: 18),
                    SmallTextWidget(
                        text: '\$ ${payment.text}',
                        fontWeight: FontWeight.bold,
                        textColor: 0xffc9ff99,
                        fontsize: 18),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SmallTextWidget(
                        text: 'Payment due:',
                        fontWeight: FontWeight.normal,
                        textColor: 0xffffffff,
                        fontsize: 18),
                    Text(
                      '${paymentDay.text} / ${paymentMonth.text} / ${paymentYear.text}',
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffc9ff99),
                        decoration: TextDecoration.underline,
                        decorationColor:
                            Color(0xffc9ff99), // Set the underline color
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SmallTextWidget(
                        text: 'Remind me ',
                        fontWeight: FontWeight.normal,
                        textColor: 0xffffffff,
                        fontsize: 18),
                    Text(
                      pickedDay.text,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffc9ff99),
                        decoration: TextDecoration.underline,
                        decorationColor:
                            Color(0xffc9ff99), // Set the underline color
                      ),
                    ),
                    const SmallTextWidget(
                        text: ' prior to due date.',
                        fontWeight: FontWeight.normal,
                        textColor: 0xffffffff,
                        fontsize: 18),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  width: 180 * screenScaling(context),
                  height: 30,
                  decoration: BoxDecoration(
                      gradient: const SweepGradient(
                        colors: [Color(0xff1f2c25), Color(0xffc9ff99)],
                        stops: [0.2, 0.75],
                        center: Alignment.topRight,
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddPaymentPage()),
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
                        text: 'Edit payment',
                        fontWeight: FontWeight.normal,
                        textColor: 0xffffffff,
                        fontsize: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
