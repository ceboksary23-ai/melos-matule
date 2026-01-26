import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    String? source;
    switch (style) {
      case LoginButtonStyle.vk:
      source = 'assets/icons/VK.svg';
      case LoginButtonStyle.yandex:
      source = 'assets/icons/Yandex.svg';
    }
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
          
          child: Row( 
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            SvgPicture.asset(
              source,
              height: 32,
              width: 32,
            ),
            Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.robotoFlex(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
            
          ),
          ],
            
          )
        ),
      ),
      onTap: () => onPressed,
    );
  }
}