import 'package:eazytrackv2/components/Methods.dart';
import 'package:flutter/material.dart';

TextEditingController fname = TextEditingController();
TextEditingController lname = TextEditingController();
TextEditingController phonenumber = TextEditingController();
TextEditingController country = TextEditingController();
TextEditingController address = TextEditingController();
TextEditingController province = TextEditingController();
TextEditingController city = TextEditingController();
TextEditingController postalcode = TextEditingController();
TextEditingController rent = TextEditingController();
TextEditingController emailaddress = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController confirmpassword = TextEditingController();
TextEditingController paymentTitle = TextEditingController();
TextEditingController payment = TextEditingController();
TextEditingController paymentMonth = TextEditingController();
TextEditingController paymentDay = TextEditingController();
TextEditingController paymentYear = TextEditingController();
TextEditingController pickedDay = TextEditingController();
TextEditingController selectedDate = TextEditingController();
TextEditingController transactionName = TextEditingController();
TextEditingController transactionAmount = TextEditingController();
TextEditingController getMonth = TextEditingController();
TextEditingController checkAnswer = TextEditingController();
TextEditingController checkAnswer2 = TextEditingController();

List<List<String>> paymentCardList = [];
List<List<String>> transactionList = [];

List<String> questions = [
  'What is the name of your favorite teacher?',
  'What was your favorite food as a child?',
  'What is the best movie of all time?'
];

bool isVisibleGenerateEazyBudgetButton = false;
bool isVisibleAddPaymentButton = false;
bool isVisibleFirstMessage = false;
bool isVisibleGenerateEazyBudgetForm = false;
bool isVisibleCalculations = false;
bool isVisibleGenerateEazyBudget2 = false;
bool isVisibleEazyBudgetProgressBar = false;
bool isVisibleSven1 = true;
bool isVisibleSven2 = false;
bool isVisibleSven3 = false;
bool isVisibleSven3Correction1 = false;
bool isVisibleSven3Correction2 = false;
bool isVisibleValueCorrection1 = false;
bool isVisibleValueCorrection2 = false;
bool isVisibleSven4 = false;
bool isVisibleSven5 = false;
bool isVisibleCompanyLogo = false;
bool isVisible3 = false;
bool isVisible2 = false;
bool isVisible1 = false;
bool isVisiblePaymentForm = false;
bool isVisibleSecondMessage = false;
bool isVisibleAddPaymentButtonSubmission = false;
bool isVisibleConfirmDueDate = false;
bool isVisibleTableCalendar = false;
bool isVisibleSelectDate = true;
bool isVisibleDueDate = false;
bool isVisiblePercentageBar = false;
bool totalExpenditureVisiblity = false;
bool paymentCardsListVisibility = false;
bool transactionsListVisiblity = false;
bool cardListVisibility = false;
bool cancelAddTransactionButtonVisibility = false;
bool addTransactionButtonVisibility = false;
bool addTransactionFormvisibility = false;
bool tutorialContinueVisibility = false;
bool continueButtonVisibility = false;
bool addPaymentVisiblity = false;
bool cancelAddPaymentVisibility = false;
bool generateNewEazyBudgetVisiblity = false;
bool cancelGenerateNewEazyBudgetVisiblity = false;
bool svenReportsVisiblity = false;
bool reportsButtonVisiblity = false;
bool viewDetailsVisiblity = false;
bool viewDetailsButtonVisiblity = false;
bool isVisibleSven6 = false;
bool userButtonVisiblity = false;
bool errorMessage3 = false;
bool errorMessageVisiblity2 = false;
bool tutorialAddPaymentButton = false;
bool permanentAddPaymentButton = false;
bool privacyAndVisiblityInfo = true;
bool userSecurityForm = false;
bool createdQuestion = false;
bool premadeQuestion = false;

Color dayButtonColor31 = const Color(0xff1f2c25);
Color dayButtonColor32 = const Color(0xffc9ff99);
Color dayButtonColor21 = const Color(0xff1f2c25);
Color dayButtonColor22 = const Color(0xffc9ff99);
Color dayButtonColor11 = const Color(0xff1f2c25);
Color dayButtonColor12 = const Color(0xffc9ff99);

double dayheight3 = 30;
double dayheight2 = 30;
double dayheight1 = 30;

double bottomLeftRight3 = 15;
double bottomLeftRight2 = 15;
double bottomLeftRight1 = 15;

int listLength = 0;

double total = 0;
double totalNeeds = 0;
double totalWants = 0;
double needs = double.tryParse(calculateMonthlyExpenses()) ?? 0.0;
double wants = double.tryParse(calculateMiscellaneous()) ?? 0.0;
double monthlyIncome = double.tryParse(rent.text) ?? 0.0;

String message3 = 'Gotcha, I will remind you 3 days before the due date.';
String message2 = 'Noted, I will remind you 2 days before the due date.';
String message1 = 'Roger that, I will remind you a day before the due date.';

double barWidth = calculatePercentBar(total);

String errorMessage = 'Complete the form';
String errorMessage2 = 'Complete the form';

int errorColor = 0xff1f2c25;
int errorColor2 = 0xff1f2c25;
int progressBarColor = 0xffC3A9FF;

int selectedMonthForBarChart = 0;

int digitMonth = 0;

TextEditingController firstAnswer = TextEditingController();
TextEditingController secondAnswer = TextEditingController();
TextEditingController thirdAnswer = TextEditingController();

TextEditingController firstQuestion = TextEditingController();
TextEditingController secondQuestion = TextEditingController();
TextEditingController thirdQuestion = TextEditingController();
TextEditingController firstAnswer2 = TextEditingController();
TextEditingController secondAnswer2 = TextEditingController();
TextEditingController thirdAnswer2 = TextEditingController();

bool isVisibleAnswerQuestionsButton = true;
bool isVisibleCreateQuestionsButton = true;
bool isVisibleCancelButton1 = false;
bool isVisibleCancelButton2 = false;
bool isVisibleQuestions = false;
bool isVisibleCreatedQuestions = false;
bool isVisibleDivider = true;
