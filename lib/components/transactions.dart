import 'package:eazytrackv2/components/T_SmallText.dart';
import 'package:flutter/material.dart';

class Transactions extends StatelessWidget {
  final String transactionName;
  final String transactionAmount;
  const Transactions(
      {super.key,
      required this.transactionName,
      required this.transactionAmount});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 430,
      child: Column(
        children: [
          Container(
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
            height: 48,
            child: ElevatedButton(
              onPressed: () {},
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
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SmallTextWidget(
                                text: transactionName,
                                fontWeight: FontWeight.normal,
                                textColor: 0xffffffff,
                                fontsize: 18),
                            SmallTextWidget(
                                text: '\$ -$transactionAmount',
                                fontWeight: FontWeight.normal,
                                textColor: 0xffffffff,
                                fontsize: 18)
                          ],
                        ),
                        const SizedBox(height: 5),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
