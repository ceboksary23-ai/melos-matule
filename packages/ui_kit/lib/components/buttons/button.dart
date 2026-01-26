import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_kit/colors/app_colors.dart';

enum AppButtonStyles { primary, inactive, secondary, tetriary }

class Button extends StatefulWidget {
  final String text;
  final AppButtonStyles style;
  final VoidCallback? onPressed;
  final bool isSmall;
  const Button({required this.text, required this.onPressed, required this.style, this.isSmall = false, super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    final Color fontColor;
    final Color backgroundColor;
    final Color borderColor;
    final double width = widget.isSmall ? 96 : 325;
    final double height = widget.isSmall ? 40 : 56;
    

    switch (widget.style) {
      case AppButtonStyles.primary:
        fontColor = AppColors.white;
        backgroundColor = AppColors.accent;
        borderColor = AppColors.accent;
        break;
      case AppButtonStyles.inactive:
        fontColor = AppColors.white;
        backgroundColor = AppColors.accentInactive;
        borderColor = AppColors.accentInactive;
        break;
      case AppButtonStyles.secondary:
        fontColor = AppColors.accent;
        backgroundColor = AppColors.white;
        borderColor = AppColors.accent;
        break;
      case AppButtonStyles.tetriary:
        fontColor = AppColors.black;
        backgroundColor = AppColors.inputBg;
        borderColor = AppColors.cardStroke;
        break;
    }

    return GestureDetector(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: borderColor,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
        child: Center(
          child: Text(
            widget.text,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.robotoFlex(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: fontColor,
              
            ),
          ),
        ),
      ),
      onTap: () => widget.onPressed,
    );
  }
}
