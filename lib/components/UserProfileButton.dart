import 'dart:math';
import 'package:eazytrackv2/components/1_ScreenScale.dart';
import 'package:eazytrackv2/components/Controllers.dart';
import 'package:eazytrackv2/pages/P_EditProfile.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class UserProfileButton extends StatefulWidget {
  const UserProfileButton({super.key});

  @override
  State<UserProfileButton> createState() => _UserProfileButtonState();
}

class _UserProfileButtonState extends State<UserProfileButton> {
  List<String> imagePaths = [
    'assets/rive/181-339-weather-icon.riv',
    'assets/rive/1952-3880-winter-animation.riv',
    'assets/rive/6860-13189-orbit-animation.riv',
    'assets/rive/809-1634-rocket-demo.riv',
    'assets/rive/6418-12490-anime-girl.riv',
    'assets/rive/3287-6917-headless-bear.riv',
  ];

  List<String> greetings = [
    'Hello,',
    'Hi,',
    'G\'day,',
    'Bonjour,',
    'Hola!',
  ];

  String randomImagePath = '';
  String randomGreeting = '';

  @override
  void initState() {
    super.initState();
    setRandomImagePathAndGreeting();
  }

  void setRandomImagePathAndGreeting() {
    int randomIndex = Random().nextInt(imagePaths.length);
    int randomIndex2 = Random().nextInt(greetings.length);
    setState(
      () {
        randomImagePath = imagePaths[randomIndex];
        randomGreeting = greetings[randomIndex2];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
            MaterialPageRoute(builder: (context) => const EditProfilePage()),
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
              width: 85,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: RiveAnimation.asset(
                  randomImagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              '$randomGreeting ${fname.text}.',
              style: TextStyle(
                  fontSize: 28 * screenScaling(context),
                  color: const Color(0xffffffff),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
