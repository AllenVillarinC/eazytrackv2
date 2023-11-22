import 'package:eazytrackv2/pages/P_OpeningPage.dart';
import 'package:eazytrackv2/pages/generate_eazybudget_page.dart';
import 'package:eazytrackv2/pages/home_page_eazybudget.dart';
import 'package:eazytrackv2/pages/home_page_newuser.dart';
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
      home: HomePageEazyBudget(),
    );
  }
}
