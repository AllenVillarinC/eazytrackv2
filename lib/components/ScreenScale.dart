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

int screenScalingToInt(BuildContext context, double fontSize) {
  double screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth >= 320 && screenWidth <= 359) {
    return (fontSize * 0.86).round();
  } else if (screenWidth >= 360 && screenWidth <= 374) {
    return (fontSize * 0.71).round();
  } else if (screenWidth >= 375 && screenWidth <= 389) {
    return (fontSize * 0.57).round();
  } else if (screenWidth >= 390 && screenWidth <= 392) {
    return (fontSize * 0.43).round();
  } else if (screenWidth >= 393 && screenWidth <= 413) {
    return (fontSize * 0.29).round();
  } else if (screenWidth >= 414 && screenWidth <= 427) {
    return (fontSize * 0.14).round();
  } else {
    return (fontSize * 1).round();
  }

}
