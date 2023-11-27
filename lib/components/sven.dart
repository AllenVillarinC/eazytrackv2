import 'dart:js';

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

List<List<String>> tips = [
  [
    "Define your why.",
    "Why did you start budgeting in the first place? What money goals do you want to reach? What will your life look like when you reach them? Dig deep and be honest about the reasons you want to take control of your money once and for all. That’s your why. And when things get tough or boring—remember your why!"
  ],
  [
    "Have an emergency fund.",
    "Your emergency fund has one job: to take care of whatever curve balls life tosses your way without throwing off your budget that month. Start with \$1,000 if you’re in debt, and then save up 3–6 months of expenses once you’re debt-free. And remember: Use it only for real emergencies like a flat tire—a shoe sale doesn’t count."
  ],
  [
    "Automate Your Finances.",
    "Most financial institutions offer online automated banking options that can help make budgeting and saving automatic. Creating automatic deposits into accounts every pay period can help create good saving habits and assist in keeping track of your expenses and payments. Check with your institution for options available to you."
  ],
  [
    "Pay Yourself First.",
    "Treat your savings like an expense or a bill and put it in your budget as a regular ”payment” instead of waiting until you have money left over to put away. Most people find a way to spend any extra; however, paying yourself first makes savings a priority equal to that of a bill payment."
  ],
  [
    "Surround yourself with people who respect your budget.",
    "If you hang out with senseless spenders, you’ll be tempted to pick up their habits. Like-minded people are living reminders of your money goals. They won’t pressure you to do stuff that’s not in your budget. Plus, they’re great resources when you have a question or need a little accountability."
  ],
  [
    "Make your goals visual.",
    "Hang up images around the house that represent your financial goals. Paying off that car? Put a picture of it on your fridge to remember why you’re cooking at home instead of ordering that pizza. You’re adjusting your budget and living by it so you can make big things happen. So, make sure you’re reminding yourself of those big things. Every. Day."
  ],
  [
    "Celebrate wins (big and small).",
    "If you’re motivated by rewards, don’t feel bad. First of all, that’s natural. Second, use that to keep up your money motivation. When you reach a goal—even a small one—celebrate! After you budget three months straight, pay off a debt, or cut extra spending for 30 days, treat yourself to a budget-friendly reward."
  ],
  [
    "Budget for fun.",
    "Another way to lower the risk of budgeting burnout is to make sure you budget for fun. Now, if you’re saving for an emergency fund or paying off debt, that fun money line item will be super small—but just for a season."
  ],
  [
    "Keep moving forward.",
    "The decisions you made yesterday don’t have to determine today. And by “yesterday,” we mean your past and literal yesterday. When you make mistakes with your money (and you will—everyone does) don’t throw a pity party. Keep. Moving. Forward."
  ],
  [
    "Find better ways to deal with stress than spending.",
    "So, if you’re an emotional spender, or if you respond to stress by buying things, you can overcome that habit. But you need to think of budget-friendly replacements for that go-to action. A nice relaxing bath, a walk or run outside, a card game with the fam, a cup of chamomile tea—these are all great ideas."
  ]
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

