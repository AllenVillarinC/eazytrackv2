import 'dart:math';

import 'package:eazytrackv2/components/0_Company.dart';
import 'package:eazytrackv2/components/1_ScreenScale.dart';
import 'package:eazytrackv2/components/B_LongButton.dart';
import 'package:eazytrackv2/components/Controllers.dart';
import 'package:eazytrackv2/components/T_BigText.dart';
import 'package:eazytrackv2/components/T_SmallText.dart';
import 'package:eazytrackv2/pages/P_EditProfile.dart';
import 'package:eazytrackv2/pages/P_OpeningPage.dart';
import 'package:eazytrackv2/pages/generate_eazybudget_page.dart';
import 'package:flutter/material.dart';

class HomePageNewUser extends StatefulWidget {
  const HomePageNewUser({super.key});

  @override
  State<HomePageNewUser> createState() => _HomePageNewUser();
}

class _HomePageNewUser extends State<HomePageNewUser> {
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
            width: 368 * screenScaling(context),
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
                    const LongButton(
                        text: 'Generate EazyBudget',
                        buttonColor: 0xffC0FF99,
                        textColor: 0xff000000,
                        sendUserTo: GenerateEazyBudget(),
                        buttonBorderColor: 0xff151515),
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
                      buttonColor: 0xff1f2c25,
                      text: 'Add payment/s',
                      textColor: 0xffffffff,
                      sendUserTo: OpeningPage(), // Change later
                      buttonBorderColor: 0xffffffff,
                    ),
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
                                  'Generate Eazybudget first before adding your payment/s',
                              fontWeight: FontWeight.normal,
                              textColor: 0xffffffff,
                              fontsize: 16),
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
                                  'Generate Eazybudget first and add your payment/s for EazyBudget to analyze your spending pattern and remind you when payment is due',
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
