import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_kit/colors/app_colors.dart';
enum LoginButtonStyle {yandex, vk}
class LoginButtons extends StatelessWidget {
  final LoginButtonStyle style;
  final String text;
  final VoidCallback? onPressed;
  const LoginButtons({
    super.key,
    required this.text,
    required this.style,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 335,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.inputStroke,
            strokeAlign: BorderSide.strokeAlignInside,
            width: 1
          ),
        ),
        child: Center(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.robotoFlex(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
              
            ),
          ),
        ),
      ),
      onTap: () => onPressed,
    );
  }
}