import 'package:flutter/material.dart';

double screenScaling(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double sizeScale = 1;

  if (screenWidth <= 360) {
    sizeScale = 0.85;
  } else {
    sizeScale = 0.90;
  }

  return sizeScale;
}

// when creating a page, create a contianer first to identify the device's screen size