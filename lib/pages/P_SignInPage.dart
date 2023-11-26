import 'package:flutter/material.dart';
import '../components/0_Company.dart';
import '../components/1_ScreenScale.dart';
import '../components/GreenLongButton.dart';
import '../components/Controllers.dart';
import '../components/T_BigText.dart';
import '../components/T_SmallText.dart';
import '../components/UI_UserInput.dart';
import '../components/UI_UserInputPassword.dart';
import 'P_CreateAccountPage.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff151515),
        body: SingleChildScrollView(
          child: SizedBox(
            child: Column(children: [
              const SizedBox(height: 20),
              const CompanyName(),
              SizedBox(
                width: 353 * screenScaling(context),
                child: const Row(
                  children: [
                    BigTextWidget(
                      text: 'Hi, Welcome back!',
                      weight: FontWeight.w800,
                      fontsize: 25,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              UserInput(
                label: 'Email address',
                hiddenLabel: 'Your email',
                controllerName: emailaddress,
                regExp: r'^[\w\.-]+@[\w\.-]+\.\w+$',
              ),
              UserInputPassword(
                label: 'Password',
                hintLabel: 'Password',
                controllerName: password,
              ),
              SizedBox(
                width: 375 * screenScaling(context),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Theme(
                              data: ThemeData(
                                  unselectedWidgetColor: Colors.white),
                              child: Checkbox(
                                activeColor: const Color(0xffC0FF99),
                                value: isActive,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                onChanged: (bool? value) {
                                  setState(() {
                                    isActive = value!;
                                  });
                                },
                                checkColor: const Color(0xff000000),
                              ),
                            ),
                            const SmallTextWidget(
                                text: 'Remember me',
                                fontWeight: FontWeight.normal,
                                textColor: 0xffffffff,
                                fontsize: 16),
                          ]),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // open dart file for password retrieval
                          },
                          child: const SmallTextWidget(
                              text: 'Forgot password?',
                              fontWeight: FontWeight.bold,
                              textColor: 0xffC0FF99,
                              fontsize: 16),
                        ),
                      ),
                    ]),
              ),
              const SizedBox(height: 15),
              
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SmallTextWidget(
                      text: "Don't have an account?",
                      fontWeight: FontWeight.normal,
                      textColor: 0xffffffff,
                      fontsize: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateAccountPage()),
                      );
                    },
                    child: const SmallTextWidget(
                        text: 'Sign up',
                        fontWeight: FontWeight.bold,
                        textColor: 0xffC0FF99,
                        fontsize: 16),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
