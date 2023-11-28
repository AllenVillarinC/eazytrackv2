import 'dart:ui';

import 'package:eazytrackv2/components/GreenLongButton.dart';
import 'package:eazytrackv2/pages/HomePage.dart';
import 'package:eazytrackv2/pages/OpeningPage.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rive/rive.dart';

import '../components/0_Company.dart';
import '../components/1_ScreenScale.dart';
import '../components/Controllers.dart';
import '../components/Methods.dart';
import '../components/T_BigText.dart';
import '../components/T_SmallText.dart';
import '../components/UI_UserInput.dart';
import '../components/UI_UserInputPassword.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff151515),
        body: Stack(
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
                      const SizedBox(height: 15),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                            );
                          },
                          child: const SmallTextWidget(
                            text: 'Back',
                            fontWeight: FontWeight.bold,
                            textColor: 0xffC0ff99,
                            fontsize: 25,
                          ),
                        ),
                      ),
                      const CompanyName(),
                      Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle, // Use a circular shape
                            ),
                            child: const RiveAnimation.asset(
                                'assets/rive/2063-4080-flutter-puzzle-hack-project.riv'),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '${fname.text} ${lname.text}',
                            style: const TextStyle(
                              fontSize: 30,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Container(
                        height: 1,
                        width: 200,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Profile details:',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              color: Color(0xffc9ff99),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                isScrollControlled:
                                    true, // Added this property to ensure scrolling
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                    ),
                                    width: 430,
                                    height: 800 * screenScaling(context),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 15),
                                          const BigTextWidget(
                                            text: 'Profile details',
                                            weight: FontWeight.bold,
                                            fontsize: 25,
                                          ),
                                          const SizedBox(height: 15),
                                          userInformationForm(context),
                                          SizedBox(
                                            width: 350 * screenScaling(context),
                                            height: 56,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const EditProfilePage()),
                                                );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color(0xffC0ff99),
                                                elevation: 2,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  side: const BorderSide(
                                                    color: Color(0xff000000),
                                                    width: 0.5,
                                                  ),
                                                ),
                                              ),
                                              child: const Center(
                                                child: SmallTextWidget(
                                                  text: 'Save changes',
                                                  fontWeight: FontWeight.bold,
                                                  textColor: 0xff000000,
                                                  fontsize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: const SmallTextWidget(
                                text: 'Edit Profile',
                                fontWeight: FontWeight.bold,
                                textColor: 0xffC0FF99,
                                fontsize: 18),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SmallTextWidget(
                              text: 'First name:',
                              fontWeight: FontWeight.bold,
                              textColor: 0xffffffff,
                              fontsize: 16),
                          SmallTextWidget(
                              text: fname.text,
                              fontWeight: FontWeight.normal,
                              textColor: 0xffc9ff99,
                              fontsize: 16)
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SmallTextWidget(
                              text: 'Last name:',
                              fontWeight: FontWeight.bold,
                              textColor: 0xffffffff,
                              fontsize: 16),
                          SmallTextWidget(
                              text: lname.text,
                              fontWeight: FontWeight.normal,
                              textColor: 0xffc9ff99,
                              fontsize: 16)
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SmallTextWidget(
                              text: 'Address:',
                              fontWeight: FontWeight.bold,
                              textColor: 0xffffffff,
                              fontsize: 16),
                          SmallTextWidget(
                              text: address.text,
                              fontWeight: FontWeight.bold,
                              textColor: 0xffffffff,
                              fontsize: 16),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Container(
                        height: 1,
                        width: 200,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Privacy and safety:',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              color: Color(0xffc9ff99),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                isScrollControlled:
                                    true, // Added this property to ensure scrolling
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                    ),
                                    height: 600 * screenScaling(context),
                                    width: 430,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 15),
                                          const BigTextWidget(
                                            text: 'Privacy and safety',
                                            weight: FontWeight.bold,
                                            fontsize: 25,
                                          ),
                                          const SizedBox(height: 15),
                                          UserInput(
                                            label: 'Email address',
                                            hiddenLabel: 'Your email',
                                            controllerName: emailaddress,
                                            regExp: r'[a-z-0-9\@._]+',
                                          ),
                                          UserInputPassword(
                                            label: 'Password',
                                            hintLabel: 'Password',
                                            controllerName: password,
                                          ),
                                          UserInputPassword(
                                            label: 'Re-enter Password',
                                            hintLabel: 'Re-enter Password',
                                            controllerName: confirmpassword,
                                          ),
                                          SizedBox(
                                            width: 350 * screenScaling(context),
                                            height: 56,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const EditProfilePage()),
                                                );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color(0xffC0ff99),
                                                elevation: 2,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  side: const BorderSide(
                                                    color: Color(0xff000000),
                                                    width: 0.5,
                                                  ),
                                                ),
                                              ),
                                              child: const Center(
                                                  child: SmallTextWidget(
                                                      text: 'Save changes',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      textColor: 0xff000000,
                                                      fontsize: 16)),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: const SmallTextWidget(
                                text: 'Edit Security',
                                fontWeight: FontWeight.bold,
                                textColor: 0xffC0FF99,
                                fontsize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SmallTextWidget(
                              text: 'E-mail:',
                              fontWeight: FontWeight.bold,
                              textColor: 0xffffffff,
                              fontsize: 16),
                          SmallTextWidget(
                              text: emailaddress.text,
                              fontWeight: FontWeight.normal,
                              textColor: 0xffc9ff99,
                              fontsize: 16)
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SmallTextWidget(
                              text: 'Phone number:',
                              fontWeight: FontWeight.bold,
                              textColor: 0xffffffff,
                              fontsize: 16),
                          SmallTextWidget(
                              text: phonenumber.text,
                              fontWeight: FontWeight.normal,
                              textColor: 0xffc9ff99,
                              fontsize: 16),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SmallTextWidget(
                              text: 'Password:',
                              fontWeight: FontWeight.bold,
                              textColor: 0xffffffff,
                              fontsize: 16),
                          SmallTextWidget(
                              text: '*' * password.text.length,
                              fontWeight: FontWeight.normal,
                              textColor: 0xffc9ff99,
                              fontsize: 16)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SmallTextWidget(
                              text: '2-factor authentication:',
                              fontWeight: FontWeight.bold,
                              textColor: 0xffffffff,
                              fontsize: 16),
                          Checkbox(
                            activeColor: const Color(0xffC0FF99),
                            value: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            onChanged:
                                (bool? value) {}, // dark mode always active
                            checkColor: const Color(0xff000000),
                          ),
                        ],
                      ),
                      Container(
                        height: 1,
                        width: 200,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 15),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Development team:',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            color: Color(0xffc9ff99),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallTextWidget(
                              text: 'Team Leader/Scrum Master:',
                              fontWeight: FontWeight.bold,
                              textColor: 0xffffffff,
                              fontsize: 16),
                          SmallTextWidget(
                              text: 'Arora, Stuti',
                              fontWeight: FontWeight.normal,
                              textColor: 0xffC0FF99,
                              fontsize: 16)
                        ],
                      ),
                      const SizedBox(height: 15),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallTextWidget(
                              text: 'Lead Developer:',
                              fontWeight: FontWeight.bold,
                              textColor: 0xffffffff,
                              fontsize: 16),
                          SmallTextWidget(
                              text: 'Villarin, Allen',
                              fontWeight: FontWeight.normal,
                              textColor: 0xffC0FF99,
                              fontsize: 16)
                        ],
                      ),
                      const SizedBox(height: 15),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallTextWidget(
                              text: 'UI/UX Designer:',
                              fontWeight: FontWeight.bold,
                              textColor: 0xffffffff,
                              fontsize: 16),
                          SmallTextWidget(
                              text: 'Narula, Ira',
                              fontWeight: FontWeight.normal,
                              textColor: 0xffC0FF99,
                              fontsize: 16)
                        ],
                      ),
                      const SizedBox(height: 15),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallTextWidget(
                              text: 'Quality Assurance:',
                              fontWeight: FontWeight.bold,
                              textColor: 0xffffffff,
                              fontsize: 16),
                          SmallTextWidget(
                              text: 'Gravito, Johnathan',
                              fontWeight: FontWeight.normal,
                              textColor: 0xffC0FF99,
                              fontsize: 16)
                        ],
                      ),
                      const SizedBox(height: 15),
                      Container(
                        height: 1,
                        width: 200,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 15),
                      const GreenLongButton(
                          text: 'Log out', sendUserTo: OpeningPage()),
                      const SizedBox(height: 20)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}