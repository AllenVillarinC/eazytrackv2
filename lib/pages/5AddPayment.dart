import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:eazytrackv2/components/0_Company.dart';
import 'package:eazytrackv2/components/1_ScreenScale.dart';
import 'package:eazytrackv2/components/GreenLongButton.dart';
import 'package:eazytrackv2/components/Controllers.dart';
import 'package:eazytrackv2/components/T_BigText.dart';
import 'package:eazytrackv2/components/T_SmallText.dart';
import 'package:eazytrackv2/components/UI_SmallUserInput.dart';
import 'package:eazytrackv2/components/UI_UserInput.dart';
import 'package:eazytrackv2/pages/P_EditProfile.dart';
import 'package:eazytrackv2/pages/6MainHomePage.dart.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AddPaymentPage extends StatefulWidget {
  const AddPaymentPage({super.key});

  @override
  State<AddPaymentPage> createState() => _AddPaymentPageState();
}

class _AddPaymentPageState extends State<AddPaymentPage> {
  Color dayButtonColor31 = const Color(0xff1f2c25);
  Color dayButtonColor32 = const Color(0xffc9ff99);
  Color dayButtonColor21 = const Color(0xff1f2c25);
  Color dayButtonColor22 = const Color(0xffc9ff99);
  Color dayButtonColor11 = const Color(0xff1f2c25);
  Color dayButtonColor12 = const Color(0xffc9ff99);

  double dayheight3 = 40;
  double dayheight2 = 40;
  double dayheight1 = 40;

  double bottomLeftRight3 = 15;
  double bottomLeftRight2 = 15;
  double bottomLeftRight1 = 15;

  String message3 = 'Gotcha, I will remind you 3 days before the due date.';
  String message2 = 'Noted, I will remind you 2 days before the due date.';
  String message1 = 'Roger that, I will remind you a day before the due date.';

  bool isVisible3 = false;
  bool isVisible2 = false;
  bool isVisible1 = false;
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
                                'Below is a form where you can name your payment, type in your payment, when your payment is due, and when do you want me to remind you before the due date.',
                                textStyle: TextStyle(
                                    color: const Color(0xffffffff),
                                    fontSize: 15 * screenScaling(context),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins'),
                                speed: const Duration(milliseconds: 40),
                              ),
                              TyperAnimatedText(
                                'Once you are done filling up this form, press the "Add payment" button below to complete the setup.',
                                textStyle: TextStyle(
                                    color: const Color(0xffffffff),
                                    fontSize: 15 * screenScaling(context),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins'),
                                speed: const Duration(milliseconds: 30),
                              ),
                            ],
                            totalRepeatCount: 1,
                            pause: const Duration(milliseconds: 3500),
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
                const Align(
                  alignment: Alignment.centerLeft,
                  child: BigTextWidget(
                      text: 'Payment details:',
                      weight: FontWeight.bold,
                      fontsize: 25),
                ),
                const SizedBox(height: 15),
                UserInput(
                    label: 'Payment title',
                    hiddenLabel: 'Title',
                    controllerName: paymentTitle,
                    regExp: r'[a-zA-Z ]+'),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SmallTextWidget(
                        text: 'Payment amount:',
                        fontWeight: FontWeight.normal,
                        textColor: 0xffffffff,
                        fontsize: 18),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Image.asset('assets/images/moneybag.png'),
                    ),
                    Row(
                      children: [
                        const SmallTextWidget(
                            text: '\$',
                            fontWeight: FontWeight.bold,
                            textColor: 0xffffffff,
                            fontsize: 20),
                        const SizedBox(width: 5),
                        SmallUserInput(
                            hintLabel: 'Amount',
                            textFieldSize: 150,
                            totalCharacters: 10,
                            regExp: r'[0-9.]+',
                            controllerName: payment),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: 430 * screenScaling(context),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: SmallTextWidget(
                          text: 'Payment due:',
                          fontWeight: FontWeight.normal,
                          textColor: 0xffffffff,
                          fontsize: 18,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SmallUserInput(
                            hintLabel: 'MM',
                            textFieldSize: 60,
                            totalCharacters: 2,
                            regExp: r'[0-9]',
                            controllerName: paymentMonth,
                          ),
                          const SizedBox(
                            width: 40,
                            child: SmallTextWidget(
                              text: '/',
                              fontWeight: FontWeight.normal,
                              textColor: 0xffffffff,
                              fontsize: 30,
                            ),
                          ),
                          SmallUserInput(
                            hintLabel: 'DD',
                            textFieldSize: 60,
                            totalCharacters: 2,
                            regExp: r'[0-9]',
                            controllerName: paymentDay,
                          ),
                          const SizedBox(
                            width: 40,
                            child: SmallTextWidget(
                              text: '/',
                              fontWeight: FontWeight.normal,
                              textColor: 0xffffffff,
                              fontsize: 30,
                            ),
                          ),
                          SmallUserInput(
                            hintLabel: 'YYYY',
                            textFieldSize: 70,
                            totalCharacters: 4,
                            regExp: r'[0-9]',
                            controllerName: paymentYear,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: SmallTextWidget(
                      text: 'When do you want to be reminded?',
                      fontWeight: FontWeight.normal,
                      textColor: 0xffffffff,
                      fontsize: 18),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: SweepGradient(
                          colors: [
                            dayButtonColor31,
                            dayButtonColor32,
                          ],
                          stops: const [0.25, 0.75],
                          center: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(15),
                            topRight: const Radius.circular(15),
                            bottomLeft: Radius.circular(bottomLeftRight3),
                            bottomRight: Radius.circular(bottomLeftRight3)),
                      ),
                      width: 120 * screenScaling(context),
                      height: dayheight3,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            dayButtonColor31 = const Color(0xff151515);
                            dayButtonColor32 = const Color(0xff1f2c25);
                            dayButtonColor21 = const Color(0xff1f2c25);
                            dayButtonColor22 = const Color(0xffc9ff99);
                            dayButtonColor11 = const Color(0xff1f2c25);
                            dayButtonColor12 = const Color(0xffc9ff99);
                            dayheight3 = 50;
                            dayheight2 = 40;
                            dayheight1 = 40;
                            bottomLeftRight3 = 0;
                            bottomLeftRight2 = 15;
                            bottomLeftRight1 = 15;
                            isVisible3 = true;
                            isVisible2 = false;
                            isVisible1 = false;
                            pickedDay.text = '3 days';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(15),
                                topRight: const Radius.circular(15),
                                bottomLeft: Radius.circular(bottomLeftRight3),
                                bottomRight: Radius.circular(bottomLeftRight3)),
                          ),
                        ),
                        child: const SmallTextWidget(
                            text: '3 Days',
                            fontWeight: FontWeight.bold,
                            textColor: 0xffffffff,
                            fontsize: 15),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: SweepGradient(
                          colors: [
                            dayButtonColor21,
                            dayButtonColor22,
                          ],
                          stops: const [0.25, 0.75],
                          center: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(15),
                            topRight: const Radius.circular(15),
                            bottomLeft: Radius.circular(bottomLeftRight2),
                            bottomRight: Radius.circular(bottomLeftRight2)),
                      ),
                      width: 120 * screenScaling(context),
                      height: dayheight2,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            dayButtonColor31 = const Color(0xff1f2c25);
                            dayButtonColor32 = const Color(0xffc9ff99);
                            dayButtonColor21 = const Color(0xff151515);
                            dayButtonColor22 = const Color(0xff1f2c25);
                            dayButtonColor11 = const Color(0xff1f2c25);
                            dayButtonColor12 = const Color(0xffc9ff99);
                            dayheight3 = 40;
                            dayheight2 = 50;
                            dayheight1 = 40;
                            bottomLeftRight3 = 15;
                            bottomLeftRight2 = 0;
                            bottomLeftRight1 = 15;
                            isVisible3 = false;
                            isVisible2 = true;
                            isVisible1 = false;
                            pickedDay.text = '2 days';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(15),
                                topRight: const Radius.circular(15),
                                bottomLeft: Radius.circular(bottomLeftRight2),
                                bottomRight: Radius.circular(bottomLeftRight2)),
                          ),
                        ),
                        child: const SmallTextWidget(
                            text: '2 Days',
                            fontWeight: FontWeight.bold,
                            textColor: 0xffffffff,
                            fontsize: 15),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: SweepGradient(
                          colors: [
                            dayButtonColor11,
                            dayButtonColor12,
                          ],
                          stops: const [0.25, 0.75],
                          center: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(15),
                            topRight: const Radius.circular(15),
                            bottomLeft: Radius.circular(bottomLeftRight1),
                            bottomRight: Radius.circular(bottomLeftRight1)),
                      ),
                      width: 120 * screenScaling(context),
                      height: dayheight1,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            dayButtonColor31 = const Color(0xff1f2c25);
                            dayButtonColor32 = const Color(0xffc9ff99);
                            dayButtonColor21 = const Color(0xff1f2c25);
                            dayButtonColor22 = const Color(0xffc9ff99);
                            dayButtonColor11 = const Color(0xff151515);
                            dayButtonColor12 = const Color(0xff1f2c25);
                            dayheight3 = 40;
                            dayheight2 = 40;
                            dayheight1 = 50;
                            bottomLeftRight3 = 15;
                            bottomLeftRight2 = 15;
                            bottomLeftRight1 = 0;
                            isVisible3 = false;
                            isVisible2 = false;
                            isVisible1 = true;
                            pickedDay.text = '1 day';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(15),
                                topRight: const Radius.circular(15),
                                bottomLeft: Radius.circular(bottomLeftRight1),
                                bottomRight: Radius.circular(bottomLeftRight1)),
                          ),
                        ),
                        child: const SmallTextWidget(
                            text: '1 Day',
                            fontWeight: FontWeight.bold,
                            textColor: 0xffffffff,
                            fontsize: 15),
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: isVisible3,
                  child: Container(
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
                                  message3,
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
                ),
                Visibility(
                  visible: isVisible2,
                  child: Container(
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
                                  message2,
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
                ),
                Visibility(
                  visible: isVisible1,
                  child: Container(
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
                                  message1,
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
                ),
                const SizedBox(height: 15),
                const GreenLongButton(
                  text: 'Add payment',
                  sendUserTo: MainHomePage(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
