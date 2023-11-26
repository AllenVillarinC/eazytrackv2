import 'package:eazytrackv2/pages/user_reports_page.dart';
import 'package:eazytrackv2/pages/view_details_page.dart';
import 'package:flutter/material.dart';
import '1_ScreenScale.dart';
import 'GreenLongButton.dart';
import 'Controllers.dart';
import 'T_BigText.dart';
import 'T_SmallText.dart';
import 'UI_SmallUserInput.dart';
import 'UI_TextFormUserInput.dart';
import 'UI_UserInput.dart';

double calculateTotalExpenses() {
  double rentExpense = double.tryParse(rent.text) ?? 0.0;
  double waterExpense = double.tryParse(water.text) ?? 0.0;
  double electricityExpense = double.tryParse(electricity.text) ?? 0.0;
  double otherExpense = double.tryParse(other.text) ?? 0.0;

  return rentExpense + waterExpense + electricityExpense + otherExpense;
}

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
  return '\$ ${total.toStringAsFixed(2)}';
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
      const SizedBox(height: 15),
      UserInput(
        label: 'Address',
        hiddenLabel: 'Address',
        controllerName: address,
        regExp: r'[a-zA-Z0-9 ,-]',
      ),
      SizedBox(
        width: 430 * screenScaling(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  SmallUserInput(
                    hintLabel: 'City',
                    textFieldSize: 180 * screenScaling(context),
                    totalCharacters: 20,
                    regExp: r'^[a-zA-Z0-9 ]*$',
                    controllerName: city,
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
                      text: 'Province',
                      fontWeight: FontWeight.normal,
                      textColor: 0xffffffff,
                      fontsize: 18,
                    ),
                  ),
                  const SizedBox(height: 5),
                  SmallUserInput(
                      hintLabel: 'Province',
                      textFieldSize: 180 * screenScaling(context),
                      totalCharacters: 20,
                      regExp: r'[a-zA-Z]',
                      controllerName: province),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  const SizedBox(height: 5),
                  SizedBox(
                    width: 180 * screenScaling(context),
                    height: 50,
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
                  SmallUserInput(
                      hintLabel: 'Postal Code',
                      textFieldSize: 180 * screenScaling(context),
                      totalCharacters: 8,
                      regExp: r'^[A-Z0-9 ]+',
                      controllerName: postalcode),
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

Column systemGenerateEazyBudget(BuildContext context) {
  return Column(
    children: [
      TextFormUserInput(
        label: 'Rent',
        hiddenLabel: '\$ 0.00',
        controllerName: rent,
        regExp: r'[0-9.]+',
      ),
      TextFormUserInput(
        label: 'Water',
        hiddenLabel: '\$ 0.00',
        controllerName: water,
        regExp: r'[0-9.]+',
      ),
      TextFormUserInput(
        label: 'Electricity',
        hiddenLabel: '\$ 0.00',
        controllerName: electricity,
        regExp: r'[0-9.]+',
      ),
      TextFormUserInput(
        label: 'Other',
        hiddenLabel: '\$ 0.00',
        controllerName: other,
        regExp: r'[0-9.]+',
      ),
      Container(
        height: 1,
        width: 250,
        decoration: const BoxDecoration(color: Colors.white),
      ),
      const SizedBox(height: 15),
      Align(
        alignment: Alignment.center,
        child: SmallTextWidget(
          text:
              'Total expenses: \$ ${calculateTotalExpenses().toStringAsFixed(2)}',
          fontWeight: FontWeight.bold,
          textColor: 0xffffffff,
          fontsize: 13,
        ),
      ),
      const SizedBox(height: 15),
      const SmallTextWidget(
        text: 'Press \'Next\' to generate your EazyBudget',
        fontWeight: FontWeight.bold,
        textColor: 0xffffffff,
        fontsize: 16,
      ),
      const SizedBox(height: 15),
      Row(
        children: [
          const SmallTextWidget(
              text: 'Monthly income:    \$',
              fontWeight: FontWeight.normal,
              textColor: 0xffffffff,
              fontsize: 20),
          const SizedBox(width: 5),
          SmallUserInput(
              hintLabel: 'Monthly income',
              textFieldSize: 180,
              totalCharacters: 7,
              regExp: r'[0-9.]+',
              controllerName: rent)
        ],
      ),
      const SizedBox(height: 15),
    ],
  );
}

Column userEazyBudgetReport(BuildContext context) {
  return Column(
    children: [
      const Align(
        alignment: Alignment.centerLeft,
        child: BigTextWidget(
          text: 'Here is your planned EazyBudget!',
          weight: FontWeight.w800,
          fontsize: 25,
        ),
      ),
      const SizedBox(height: 15),
      TextFormUserInput(
        label: 'Total planned budget',
        hiddenLabel: '\$ 0.00',
        controllerName: totalPlannedBudget,
        regExp: r'[0-9.]+',
      ),
      TextFormUserInput(
        label: 'Personal Savings',
        hiddenLabel: '\$ 0.00',
        controllerName: personalSavings,
        regExp: r'[0-9.]+',
      ),
      TextFormUserInput(
        label: 'Total expenditures',
        hiddenLabel: '\$ 0.00',
        controllerName: totalExpenditures,
        regExp: r'[0-9.]+',
      ),
      TextFormUserInput(
        label: 'Net balance',
        hiddenLabel: '\$ 0.00',
        controllerName: netBalance,
        regExp: r'[0-9.]+',
      ),
      const SizedBox(height: 15),
      Image.asset('assets/images/moneybag.png'),
      const GreenLongButton(
          text: 'View details', sendUserTo: ViewDetailsPage()),
      const SizedBox(height: 15),
      const GreenLongButton(text: 'Reports', sendUserTo: UserReportsPage()),
      const SizedBox(height: 15),
    ],
  );
}
