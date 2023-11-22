import 'package:eazytrackv2/components/0_Company.dart';
import 'package:eazytrackv2/components/B_LongButton.dart';
import 'package:flutter/material.dart';

import '../components/Methods.dart';
import 'home_page_newuser.dart';

class AccountSetupPage extends StatefulWidget {
  const AccountSetupPage({super.key});

  @override
  State<AccountSetupPage> createState() => _AccountSetupPageState();
}

class _AccountSetupPageState extends State<AccountSetupPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff151515),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const CompanyName(),
                const SizedBox(height: 15),
                userInformationForm(context),
                const SizedBox(height: 15),
                const LongButton(
                    text: 'Continue',
                    buttonColor: 0xffC0FF99,
                    textColor: 0xff000000,
                    sendUserTo: HomePageNewUser(),
                    buttonBorderColor: 0xff000000),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class AccountSetupPage extends StatefulWidget {
//   const AccountSetupPage({super.key});

//   @override
//   State<AccountSetupPage> createState() => _AccountSetupPageState();
// }

// class _AccountSetupPageState extends State<AccountSetupPage> {
//   int _activeStepIndex = 0;
//   List<Step> stepList() => [
//         Step(
//           isActive: _activeStepIndex >= 0,
//           title: const SmallTextWidget(
//               text: 'User Information',
//               fontWeight: FontWeight.bold,
//               textColor: 0xffffffff),
//           content: Column(
//             children: [
//               const BigTextWidget(
//                 text: 'Let\'s get to know you.',
//                 weight: FontWeight.w800,
//               ),
//               const SizedBox(height: 15),
//               userInformationForm(context),
//             ],
//           ),
//         ),

//         Step(
//           isActive: _activeStepIndex >= 1,
//           title: const SmallTextWidget(
//               text: 'Generate EazyBudget',
//               fontWeight: FontWeight.bold,
//               textColor: 0xffffffff),
//           content: Column(
//             children: [
//               const BigTextWidget(
//                 text: 'Now, let\'s generate your EazyBudget.',
//                 weight: FontWeight.w800,
//               ),
//               const SizedBox(height: 15),
//               systemGenerateEazyBudget(context),
//             ],
//           ),
//         ),
//         // CONFIRM USER INPUT. Step to get user data and put into firebase
//         Step(
//           isActive: _activeStepIndex >= 2,
//           title: const SmallTextWidget(
//               text: 'Your EazyBudget',
//               fontWeight: FontWeight.bold,
//               textColor: 0xffffffff),
//           content: userEazyBudgetReport(context),
//         ),
//       ];

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: const Color(0xff151515),
//         body: Theme(
//           data: ThemeData(
//               colorScheme: Theme.of(context)
//                   .colorScheme
//                   .copyWith(primary: const Color(0xff604897))),
//           child: Stepper(
//             currentStep: _activeStepIndex,
//             steps: stepList(),
//             controlsBuilder: (BuildContext context, ControlsDetails details) {
//               return Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: <Widget>[
//                   TextButton(
//                     onPressed: details.onStepCancel,
//                     style: ButtonStyle(
//                       foregroundColor: MaterialStateProperty.all<Color>(
//                           const Color(0xffCA5947)),
//                     ),
//                     child: const SmallTextWidget(
//                         text: 'Return',
//                         fontWeight: FontWeight.bold,
//                         textColor: 0xffC3A9FF),
//                   ),
//                   const SizedBox(
//                     width: 20,
//                   ),
//                   ElevatedButton(
//                     onPressed: details.onStepContinue,
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all<Color>(
//                           const Color(0xffC0FF99)),
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20.0),
//                         ),
//                       ),
//                       fixedSize: MaterialStateProperty.all(const Size(100, 45)),
//                     ),
//                     child: const SmallTextWidget(
//                         text: 'Next',
//                         fontWeight: FontWeight.bold,
//                         textColor: 0xff000000),
//                   ),
//                 ],
//               );
//             },
//             onStepContinue: () {
//               if (_activeStepIndex < (stepList().length - 1)) {
//                 setState(() {
//                   _activeStepIndex += 1;
//                 });
//               } else {
//                 Navigator.of(context).pushReplacement(MaterialPageRoute(
//                   builder: (context) => const UserProfilePage(),
//                 ));
//               }
//             },
//             onStepCancel: () {
//               if (_activeStepIndex > 0) {
//                 setState(() {
//                   _activeStepIndex -= 1;
//                 });
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
