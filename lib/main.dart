import 'package:eazytrackv2/pages/1HomePage.dart';
import 'package:eazytrackv2/pages/2EazybudgetInput.dart';
import 'package:eazytrackv2/pages/3EazybudgetInputAndValues.dart';
import 'package:eazytrackv2/pages/4HomePageEazyBudget.dart';
import 'package:eazytrackv2/pages/5AddPayment.dart';
import 'package:eazytrackv2/pages/6MainHomePage.dart.dart';
import 'package:eazytrackv2/pages/P_OpeningPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OpeningPage(),
    );
  }
}
