import 'dart:ui';
import 'package:eazytrackv2/pages/HomePage.dart';
import 'package:eazytrackv2/pages/OpeningPage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rive/rive.dart';
import '../components/CompanyLogo.dart';
import '../components/ScreenScale.dart';
import '../components/Controllers.dart';
import '../components/Methods.dart';
import '../components/BigTextWidget.dart';
import '../components/SmallTextWidget.dart';
import '../components/BigUserInputWidget.dart';
import '../components/UserPasswordInputWidget.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({super.key});

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
                                    height: MediaQuery.of(context).size.height,
                                    width: MediaQuery.of(context).size.width,
                                    child: SingleChildScrollView(
                                      child: SafeArea(
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 50),
                                            const BigTextWidget(
                                              text: 'Profile details',
                                              weight: FontWeight.bold,
                                              fontsize: 25,
                                            ),
                                            const SizedBox(height: 15),
                                            userInformationForm(context),
                                            SizedBox(
                                              width:
                                                  350 * screenScaling(context),
                                              height: 56,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            EditProfilePage()),
                                                  );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      const Color(0xffC0ff99),
                                                  elevation: 2,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
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
                                isScrollControlled: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return ListView(
                                    keyboardDismissBehavior:
                                        ScrollViewKeyboardDismissBehavior
                                            .onDrag,
                                    children: [
                                      SingleChildScrollView(
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                            ),
                                          ),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Column(
                                            children: [
                                              const SizedBox(height: 50),
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
                                                width: 350 *
                                                    screenScaling(context),
                                                height: 56,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            EditProfilePage(),
                                                      ),
                                                    );
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        const Color(0xffC0ff99),
                                                    elevation: 2,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      side: const BorderSide(
                                                        color:
                                                            Color(0xff000000),
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
                                                      fontsize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: const SmallTextWidget(
                              text: 'Edit Security',
                              fontWeight: FontWeight.bold,
                              textColor: 0xffC0FF99,
                              fontsize: 18,
                            ),
                          )
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
                      Container(
                        decoration: BoxDecoration(
                            gradient: const SweepGradient(
                              colors: [Color(0xff1f2c25), Color(0xffc9ff99)],
                              stops: [0.2, 0.75],
                              center: Alignment.topRight,
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        width: 350 * screenScaling(context),
                        height: 60 * screenScaling(context),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Center(
                            child: SmallTextWidget(
                              text: 'Sign out',
                              fontWeight: FontWeight.w600,
                              textColor: 0xffffffff,
                              fontsize: screenScalingToInt(context, 20),
                            ),
                          ),
                        ),
                      ),
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
                                  builder: (context) => OpeningPage()),
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
                              text: 'Sig out',
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
