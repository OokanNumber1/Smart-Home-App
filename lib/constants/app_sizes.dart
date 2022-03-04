import 'package:flutter/material.dart';

class AppSizes {
  static double appHeight(BuildContext context, double heightRatio) =>
      MediaQuery.of(context).size.height * heightRatio;

  static double appWidth(BuildContext context, double widthRatio) =>
      MediaQuery.of(context).size.width * widthRatio;

  static SizedBox spacedHeight(double height) => SizedBox(height: height);

  static SizedBox spacedWidth(double width) => SizedBox(width: width);
}
