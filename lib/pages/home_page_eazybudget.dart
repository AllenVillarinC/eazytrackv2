import 'dart:math';

import 'package:eazytrackv2/components/0_Company.dart';
import 'package:eazytrackv2/components/1_ScreenScale.dart';
import 'package:eazytrackv2/components/B_LongButton.dart';
import 'package:eazytrackv2/components/Controllers.dart';
import 'package:eazytrackv2/components/Methods.dart';
import 'package:eazytrackv2/components/T_BigText.dart';
import 'package:eazytrackv2/components/T_SmallText.dart';
import 'package:eazytrackv2/pages/P_EditProfile.dart';
import 'package:eazytrackv2/pages/P_OpeningPage.dart';
import 'package:eazytrackv2/pages/generate_eazybudget_page.dart';
import 'package:flutter/material.dart';

class HomePageEazyBudget extends StatefulWidget {
  const HomePageEazyBudget({super.key});

  @override
  State<HomePageEazyBudget> createState() => _HomePageEazyBudget();
}

class _HomePageEazyBudget extends State<HomePageEazyBudget> {
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
                        width: 368 * screenScaling(context),
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
                          weight: FontWeight.w200,
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
                              width: 220,
                              height: 25,
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
                        )
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
                        text: 'Total payment/s:',
                        weight: FontWeight.w200,
                        fontsize: 25,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const LongButton(
                      buttonColor: 0xffc9ff99,
                      text: 'Add payment/s',
                      textColor: 0xff000000,
                      sendUserTo: OpeningPage(), // Change later
                      buttonBorderColor: 0xff000000,
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
                          text: 'Payment/s and due dates:',
                          weight: FontWeight.w200,
                          fontsize: 25,
                        )),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset('assets/images/Vector.png'),
                        ),
                        const SizedBox(width: 5),
                        const Expanded(
                          child: SmallTextWidget(
                              text:
                                  'Add payment/s for Eazybudget to analyze andremind you when payment id due',
                              fontWeight: FontWeight.normal,
                              textColor: 0xffffffff,
                              fontsize: 16),
                        ),
                      ],
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
