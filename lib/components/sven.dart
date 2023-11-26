import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:eazytrackv2/components/Controllers.dart';
import 'package:eazytrackv2/components/Methods.dart';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

List<String> tutorialMessage = [
  'Nice to finally meet you, ${fname.text}. My name is Sven. EazyTrack\'s virtual assistant.',
  'Whenever you are ready, press the button below to generate your EazyBudget!',
  'First, I need to get your income. Don\'t worry, you do not need to give me the exact amount.',
  'If there are any changes, maybe an increase or a decrease, you can generate your new EazyBudget anytime.',
  'Here are the amounts of how you should manage your monthly income.',
  'If you made a mistake, just type in your income again and I will generate new amounts for you.',
  'Here are your new values. Feel free to change it and I will generate new values.',
  'Step 1 is done and below is a bar to inform you how much you have left of your EazyBudget.',
  'Again, if there is a change of income, an increase or a decrease, you can generate your new EazyBudget anytime by pressing the "Generate New EazyBudget" button.',
  'Whenever you are ready, press the "Add Payment" below.',
  'Below is a form where you can name your payment, type in your payment, when your payment is due, and when do you want me to remind you before the due date.',
  'Once you are done filling up this form, press the "Add payment" button below to complete the setup.',
];

Container svenTutorial1(void Function() function) {
  return Container(
    decoration: BoxDecoration(
      gradient: SweepGradient(
        colors: [
          const Color(0xff151515).withOpacity(0.5),
          const Color(0xff1f2c25).withOpacity(0.5)
        ],
        stops: const [0.25, 0.75],
        center: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(15),
    ),
    width: 370,
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
                  tutorialMessage[0],
                  textStyle: const TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'),
                  speed: const Duration(milliseconds: 25),
                ),
                TyperAnimatedText(
                  tutorialMessage[1],
                  textStyle: const TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'),
                  speed: const Duration(milliseconds: 25),
                ),
              ],
              totalRepeatCount: 1,
              pause: const Duration(milliseconds: 1000),
              onFinished: function,
            ),
          ),
        ],
      ),
    ),
  );
}

Container svenTutorial2() {
  return Container(
    decoration: BoxDecoration(
      gradient: SweepGradient(
        colors: [
          const Color(0xff151515).withOpacity(0.5),
          const Color(0xff1f2c25).withOpacity(0.5)
        ],
        stops: const [0.25, 0.75],
        center: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(15),
    ),
    width: 370,
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
                  tutorialMessage[2],
                  textStyle: const TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'),
                  speed: const Duration(milliseconds: 25),
                ),
                TyperAnimatedText(
                  tutorialMessage[3],
                  textStyle: const TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'),
                  speed: const Duration(milliseconds: 25),
                ),
              ],
              totalRepeatCount: 1,
              pause: const Duration(milliseconds: 1000),
            ),
          ),
        ],
      ),
    ),
  );
}

Container svenTutorial3() {
  return Container(
    decoration: BoxDecoration(
      gradient: SweepGradient(
        colors: [
          const Color(0xff151515).withOpacity(0.5),
          const Color(0xff1f2c25).withOpacity(0.5)
        ],
        stops: const [0.25, 0.75],
        center: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(15),
    ),
    width: 370,
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
                  tutorialMessage[4],
                  textStyle: const TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'),
                  speed: const Duration(milliseconds: 25),
                ),
                TyperAnimatedText(
                  'By the end of each month, you should only spend a total of ${calculateEazyBudget()} and you should save around \$ ${calculateSavings()}.',
                  textStyle: const TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'),
                  speed: const Duration(milliseconds: 25),
                ),
                TyperAnimatedText(
                  tutorialMessage[5],
                  textStyle: const TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'),
                  speed: const Duration(milliseconds: 25),
                ),
              ],
              totalRepeatCount: 1,
              pause: const Duration(milliseconds: 1000),
            ),
          ),
        ],
      ),
    ),
  );
}

Container svenTutorial3NewBudgetValues1() {
  return Container(
    decoration: BoxDecoration(
      gradient: SweepGradient(
        colors: [
          const Color(0xff151515).withOpacity(0.5),
          const Color(0xff1f2c25).withOpacity(0.5)
        ],
        stops: const [0.25, 0.75],
        center: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(15),
    ),
    width: 370,
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
                  tutorialMessage[6],
                  textStyle: const TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'),
                  speed: const Duration(milliseconds: 25),
                ),
                TyperAnimatedText(
                  'By the end of each month, you should only spend a total of ${calculateEazyBudget()} and you should save around \$ ${calculateSavings()}.',
                  textStyle: const TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'),
                  speed: const Duration(milliseconds:25),
                ),
              ],
              totalRepeatCount: 1,
              pause: const Duration(milliseconds: 1000),
            ),
          ),
        ],
      ),
    ),
  );
}

Container svenTutorial3NewBudgetValues2() {
  return Container(
    decoration: BoxDecoration(
      gradient: SweepGradient(
        colors: [
          const Color(0xff151515).withOpacity(0.5),
          const Color(0xff1f2c25).withOpacity(0.5)
        ],
        stops: const [0.25, 0.75],
        center: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(15),
    ),
    width: 370,
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
                  tutorialMessage[6],
                  textStyle: const TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'),
                  speed: const Duration(milliseconds: 25),
                ),
                TyperAnimatedText(
                  'By the end of each month, you should only spend a total of ${calculateEazyBudget()} and you should save around \$ ${calculateSavings()}.',
                  textStyle: const TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'),
                  speed: const Duration(milliseconds: 25),
                ),
              ],
              totalRepeatCount: 1,
              pause: const Duration(milliseconds: 1000),
            ),
          ),
        ],
      ),
    ),
  );
}

Container svenTutorial4(void Function() function) {
  return Container(
    decoration: BoxDecoration(
      gradient: SweepGradient(
        colors: [
          const Color(0xff151515).withOpacity(0.5),
          const Color(0xff1f2c25).withOpacity(0.5)
        ],
        stops: const [0.25, 0.75],
        center: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(15),
    ),
    width: 370,
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
                  tutorialMessage[7],
                  textStyle: const TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'),
                  speed: const Duration(milliseconds: 25),
                ),
                TyperAnimatedText(
                  tutorialMessage[8],
                  textStyle: const TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'),
                  speed: const Duration(milliseconds: 25),
                ),
                TyperAnimatedText(
                  tutorialMessage[9],
                  textStyle: const TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'),
                  speed: const Duration(milliseconds: 25),
                ),
              ],
              onFinished: function,
              totalRepeatCount: 1,
              pause: const Duration(milliseconds: 1000),
            ),
          ),
        ],
      ),
    ),
  );
}

Container svenTutorial5() {
  return Container(
    decoration: BoxDecoration(
      gradient: SweepGradient(
        colors: [
          const Color(0xff151515).withOpacity(0.5),
          const Color(0xff1f2c25).withOpacity(0.5)
        ],
        stops: const [0.25, 0.75],
        center: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(15),
    ),
    width: 370,
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
                  tutorialMessage[10],
                  textStyle: const TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'),
                  speed: const Duration(milliseconds: 25),
                ),
                TyperAnimatedText(
                  tutorialMessage[11],
                  textStyle: const TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'),
                  speed: const Duration(milliseconds: 25),
                ),
              ],
              totalRepeatCount: 1,
              pause: const Duration(milliseconds: 1000),
            ),
          ),
        ],
      ),
    ),
  );
}
