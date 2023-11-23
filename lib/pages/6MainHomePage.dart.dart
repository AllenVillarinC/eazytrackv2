import 'dart:math';

import 'package:eazytrackv2/components/0_Company.dart';
import 'package:eazytrackv2/components/1_ScreenScale.dart';
import 'package:eazytrackv2/components/GreenLongButton.dart';
import 'package:eazytrackv2/components/Controllers.dart';
import 'package:eazytrackv2/components/Methods.dart';
import 'package:eazytrackv2/components/T_BigText.dart';
import 'package:eazytrackv2/components/T_SmallText.dart';
import 'package:eazytrackv2/pages/P_EditProfile.dart';
import 'package:eazytrackv2/pages/2EazybudgetInput.dart';
import 'package:eazytrackv2/pages/user_reports_page.dart';
import 'package:eazytrackv2/pages/view_details_page.dart';
import 'package:flutter/material.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePage();
}

class _MainHomePage extends State<MainHomePage> {
  List<String> imagePaths = [
    'assets/images/Allura UI Windows.png',
    'assets/images/Brazuca Planning.png',
    'assets/images/Charco Mobile Life.png',
    'assets/images/Stuck at Home Brainstorming.png',
    'assets/images/Stuck at Home Stats and Graphs.png',
  ];

  String randomImagePath = '';

  @override
  void initState() {
    super.initState();
    // Set a random image path when the page opens
    setRandomImagePath();
  }

  void setRandomImagePath() {
    // Generate a random index
    int randomIndex = Random().nextInt(imagePaths.length);
    // Set the random image path
    setState(() {
      randomImagePath = imagePaths[randomIndex];
    });
  }

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
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const EditProfilePage()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(20)),
                        height: 70,
                        width: 430 * screenScaling(context),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffc4c4c4),
                                  shape:
                                      BoxShape.circle, // Use a circular shape
                                ),
                                child: Image.asset(randomImagePath),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Welcome, ${fname.text}.',
                              style: TextStyle(
                                fontSize: 28 * screenScaling(context),
                                color: const Color(0xffffffff),
                                fontFamily: 'Poppins',
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
                          weight: FontWeight.bold,
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
                            SizedBox(
                              width: 250 * screenScaling(context),
                              height: 30,
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
                                  backgroundColor: const Color(0xffc9ff99),
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: const BorderSide(
                                      color: Color(0xff000000),
                                      width: 0.5,
                                    ),
                                  ),
                                ),
                                child: const SmallTextWidget(
                                    text: 'Generate New EazyBudget',
                                    fontWeight: FontWeight.bold,
                                    textColor: 0xff000000,
                                    fontsize: 15),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 25,
                                  width: 270,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff1F2C25),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.black),
                                  ),
                                ),
                                Container(
                                  height: 25,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xff1f2c25),
                                        Color(0xffc9ff99)
                                      ],
                                      stops: [0.25, 0.85],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
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
                        weight: FontWeight.bold,
                        fontsize: 25,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmallTextWidget(
                            text: calculateEazyBudget(),
                            fontWeight: FontWeight.bold,
                            textColor: 0xffffffff,
                            fontsize: 25),
                        SizedBox(
                          width: 160 * screenScaling(context),
                          height: 30,
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
                              backgroundColor: const Color(0xffc9ff99),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(
                                  color: Color(0xff000000),
                                  width: 0.5,
                                ),
                              ),
                            ),
                            child: const SmallTextWidget(
                                text: 'Add payment',
                                fontWeight: FontWeight.bold,
                                textColor: 0xff000000,
                                fontsize: 15),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const GreenLongButton(
                      text: 'View Details',
                      sendUserTo: ViewDetailsPage(),
                    ),
                    const SizedBox(height: 15),
                    const GreenLongButton(
                        text: 'Report', sendUserTo: UserReportsPage())
                  ],
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
                const SizedBox(height: 15),
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
                        fontsize: 20),
                    SmallTextWidget(
                        text: '\$ ${payment.text}',
                        fontWeight: FontWeight.bold,
                        textColor: 0xffc9ff99,
                        fontsize: 20),
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
                        fontsize: 20),
                    SmallTextWidget(
                        text:
                            '${paymentDay.text} / ${paymentMonth.text} / ${paymentYear.text}',
                        fontWeight: FontWeight.bold,
                        textColor: 0xffc9ff99,
                        fontsize: 20),
                  ],
                ),
                const SizedBox(height: 15),
                SmallTextWidget(
                    text: 'Remind me ${pickedDay.text} prior to due date',
                    fontWeight: FontWeight.normal,
                    textColor: 0xffffffff,
                    fontsize: 20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
