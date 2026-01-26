import 'package:flutter/material.dart';
import 'package:ui_kit/colors/app_colors.dart';

class AppFonts {

    TextStyle title1Semibold({Color color = AppColors.white}) {
    return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

    TextStyle title1Extrabold({Color color = AppColors.white}) {
    return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w800,
      color: color,
    );
  }

    TextStyle title2Regular({Color color = AppColors.white}) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

    TextStyle title2Extrabold({Color color = AppColors.white}) {
    return TextStyle(
      fontSize: 34,
      fontWeight: FontWeight.w700,
      color: color,
    );
  }


}