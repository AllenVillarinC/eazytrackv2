import 'package:eazytrackv2/components/T_SmallText.dart';
import 'package:flutter/material.dart';

class PaymentCards extends StatelessWidget {
  final String paymentTitleString;
  final String paymentAmountString;
  final String paymentDueDateString;
  final String paymentReminderString;

  const PaymentCards({
    super.key,
    required this.paymentTitleString,
    required this.paymentAmountString,
    required this.paymentDueDateString,
    required this.paymentReminderString,
   
  });

  @override
  Widget build(BuildContext context) {
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
      width: 380,
      height: 160,
      child: ElevatedButton(
        onPressed: () {
         
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 1,
                    width: 70,
                    decoration: const BoxDecoration(
                      color: Color(0xffffffff),
                    ),
                  ),
                  SmallTextWidget(
                      text: paymentTitleString,
                      fontWeight: FontWeight.normal,
                      textColor: 0xffc9ff99,
                      fontsize: 20),
                  Container(
                    height: 1,
                    width: 70,
                    decoration: const BoxDecoration(
                      color: Color(0xffffffff),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SmallTextWidget(
                      text: 'Payment amount:',
                      fontWeight: FontWeight.normal,
                      textColor: 0xffffffff,
                      fontsize: 18),
                  Row(
                    children: [
                      const Icon(
                        Icons.attach_money_rounded,
                        size: 18,
                        color: Color(0xffc9ff99),
                      ),
                      const SizedBox(width: 3),
                      SmallTextWidget(
                          text: paymentAmountString,
                          fontWeight: FontWeight.normal,
                          textColor: 0xffc9ff99,
                          fontsize: 20),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SmallTextWidget(
                      text: 'Payment due:',
                      fontWeight: FontWeight.normal,
                      textColor: 0xffffffff,
                      fontsize: 18),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 15,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        paymentDueDateString,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.normal,
                          color: Color(0xffc9ff99),
                          decoration: TextDecoration.underline,
                          decorationColor:
                              Color(0xffc9ff99), // Set the underline color
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SmallTextWidget(
                      text: 'Tap card to remove',
                      fontWeight: FontWeight.normal,
                      textColor: 0xffffffff,
                      fontsize: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.notifications_active,
                        size: 15,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        paymentReminderString,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.normal,
                          color: Color(0xffc9ff99),
                          decoration: TextDecoration.underline,
                          decorationColor:
                              Color(0xffc9ff99), // Set the underline color
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
