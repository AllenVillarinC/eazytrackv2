import 'package:eazytrackv2/components/0_Company.dart';
import 'package:eazytrackv2/components/GreenLongButton.dart';
import 'package:flutter/material.dart';

import '../components/Methods.dart';

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
                
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


