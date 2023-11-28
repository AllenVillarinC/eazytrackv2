import 'package:flutter/material.dart';

double screenScaling(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth >= 320 && screenWidth <= 359) {
    return 0.86;
  } else if (screenWidth >= 360 && screenWidth <= 374) {
    return 0.71;
  } else if (screenWidth >= 375 && screenWidth <= 389) {
    return 0.57;
  } else if (screenWidth >= 390 && screenWidth <= 392) {
    return 0.43;
  } else if (screenWidth >= 393 && screenWidth <= 413) {
    return 0.29;
  } else if (screenWidth >= 414 && screenWidth <= 427) {
    return 0.14;
  } else {
    return 1;
  }
}

// when creating a page, create a contianer first to identify the device's screen size

// 430 1
// 428 0.86
// 414 0.71
// 393 0.57
// 390 0.43
// 375 (both instances) 0.29
// 360 (both instances) 0.14
// 320