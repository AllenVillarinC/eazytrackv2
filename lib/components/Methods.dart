import 'package:eazytrackv2/components/BigTextWidget.dart';
import 'package:eazytrackv2/components/CompanyLogo.dart';
import 'package:eazytrackv2/components/UserPasswordInputWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ScreenScale.dart';
import 'Controllers.dart';
import 'SmallTextWidget.dart';
import 'SmallUserInputWidget.dart';
import 'BigUserInputWidget.dart';

String calculateMonthlyExpenses() {
  double monthlyExpenses = double.tryParse(rent.text) ?? 0.0;
  return (monthlyExpenses * 0.5).toStringAsFixed(2);
}

String calculateMiscellaneous() {
  double miscellaneous = double.tryParse(rent.text) ?? 0.0;
  return (miscellaneous * 0.3).toStringAsFixed(2);
}

String calculateSavings() {
  double savings = double.tryParse(rent.text) ?? 0.0;
  return (savings * 0.2).toStringAsFixed(2);
}

double calculateEazyBudget() {
  double monthlyExpenses = double.tryParse(rent.text) ?? 0.0;
  double miscellaneous = double.tryParse(rent.text) ?? 0.0;
  double budget = (monthlyExpenses * 0.5) + (miscellaneous * 0.3);
  return budget;
}

double calculateDifference(double total, double function) {
  double difference = function - total;
  return difference;
}

String calculateTotalExpenditure() {
  double paymentAmountToAdd = double.tryParse(payment.text) ?? 0.0;
  double transactionAmountToAdd =
      double.tryParse(transactionAmount.text) ?? 0.0;
  double total = paymentAmountToAdd + transactionAmountToAdd;
  if (total < 0) {
    return '\$ 0.00';
  } else {
    return '\$ ${total.toStringAsFixed(2)}';
  }
}

double calculatePercentBar(double total) {
  double monthlyExpenses = double.tryParse(rent.text) ?? 0.0;
  double miscellaneous = double.tryParse(rent.text) ?? 0.0;
  double totalExpenditure = total;
  double budget = (monthlyExpenses * 0.5) + (miscellaneous * 0.3);
  double difference = budget - totalExpenditure;
  double percentageTaken = difference / budget;
  return (1 - percentageTaken) * 270;
}

int createListLength(double total) {
  double monthlyExpenses = double.tryParse(rent.text) ?? 0.0;
  double miscellaneous = double.tryParse(rent.text) ?? 0.0;
  double totalExpenditure = total;
  double budget = (monthlyExpenses * 0.5) + (miscellaneous * 0.3);
  double difference = budget - totalExpenditure;
  double percentageTaken = difference / budget;
  double threshold = percentageTaken * 100;

  if (threshold >= 80 && threshold <= 90) {
    return 1;
  } else if (threshold >= 70 && threshold <= 80) {
    return 2;
  } else if (threshold >= 60 && threshold <= 70) {
    return 3;
  } else if (threshold >= 50 && threshold <= 60) {
    return 4;
  } else if (threshold >= 40 && threshold <= 50) {
    return 5;
  } else if (threshold >= 30 && threshold <= 40) {
    return 6;
  } else if (threshold >= 20 && threshold <= 30) {
    return 7;
  } else if (threshold >= 10 && threshold <= 20) {
    return 8;
  } else if (threshold >= 0 && threshold <= 10) {
    return 9;
  } else {
    return 10;
  }
}

Column userInformationForm(BuildContext context) {
  return Column(
    children: [
      UserInput(
        label: 'First Name',
        hiddenLabel: 'First Name',
        controllerName: fname,
        regExp: r'[a-zA-Z]',
      ),
      UserInput(
        label: 'Last Name',
        hiddenLabel: 'Last Name',
        controllerName: lname,
        regExp: r'[a-zA-Z]',
      ),
      UserInput(
        label: 'Address',
        hiddenLabel: 'Address',
        controllerName: address,
        regExp: r'[a-zA-Z0-9 ,-]',
      ),
      SizedBox(
        width: 430 * screenScaling(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 160 * screenScaling(context),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: SmallTextWidget(
                      text: 'City',
                      fontWeight: FontWeight.normal,
                      textColor: 0xffffffff,
                      fontsize: 18,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SmallUserInput(
                      hintLabel: 'City',
                      textFieldSize: 180 * screenScaling(context),
                      totalCharacters: 20,
                      regExp: r'^[a-zA-Z0-9 ]*$',
                      controllerName: city,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 160 * screenScaling(context),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: SmallTextWidget(
                      text: 'Province code',
                      fontWeight: FontWeight.normal,
                      textColor: 0xffffffff,
                      fontsize: 18,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SmallUserInput(
                        hintLabel: 'Code',
                        textFieldSize: 180 * screenScaling(context),
                        totalCharacters: 2,
                        regExp: r'[a-zA-Z]',
                        controllerName: province),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 15),
      SizedBox(
        width: 430 * screenScaling(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 160 * screenScaling(context),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: SmallTextWidget(
                      text: 'Country',
                      fontWeight: FontWeight.normal,
                      textColor: 0xffffffff,
                      fontsize: 18,
                    ),
                  ),
                  SizedBox(
                    width: 130 * screenScaling(context),
                    child: Image.asset('assets/images/flag_of_canada.png'),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 160 * screenScaling(context),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: SmallTextWidget(
                      text: 'Postal code',
                      fontWeight: FontWeight.normal,
                      textColor: 0xffffffff,
                      fontsize: 18,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SmallUserInput(
                        hintLabel: 'Postal Code',
                        textFieldSize: 180 * screenScaling(context),
                        totalCharacters: 8,
                        regExp: r'^[A-Z0-9 ]+',
                        controllerName: postalcode),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 15)
    ],
  );
}

Column userSecurity(BuildContext context) {
  return Column(
    children: [
      UserInput(
        label: 'Email address',
        hiddenLabel: 'Your email',
        controllerName: emailaddress,
        regExp: r'[a-z-0-9\@._]+',
      ),
      SizedBox(
        width: 430 * screenScaling(context),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SmallTextWidget(
                text: 'Phone number',
                fontWeight: FontWeight.normal,
                textColor: 0xffffffff,
                fontsize: screenScalingToInt(context, 30),
              ),
            ),
            const SizedBox(height: 5),
            TextField(
              keyboardType: TextInputType.number,
              controller: phonenumber,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
              ],
              decoration: InputDecoration(
                hintText: 'Phone number',
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15 * screenScaling(context),
                  color: const Color(0xff000000).withOpacity(0.7),
                ),
                filled: true,
                fillColor: const Color(0xffffffff),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xff0081B3), width: 2.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xffffffff), width: 2.0),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
      UserInputPassword(
        label: 'Password',
        hintLabel: 'Password',
        controllerName: password,
      )
    ],
  );
}
