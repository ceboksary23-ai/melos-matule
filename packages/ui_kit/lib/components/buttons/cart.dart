import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_kit/colors/app_colors.dart';
import 'package:ui_kit/gen/app_icons.dart';

class Cart extends StatelessWidget {
  final String label;
  final int price;
  final VoidCallback onPressed;
  const Cart({
    super.key,
    required this.label,
    required this.price,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {

    TextStyle textStyleBtn = GoogleFonts.robotoFlex(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 17,
    );

    return GestureDetector(
      child: Container(
        padding: EdgeInsetsGeometry.all(16),
        decoration: BoxDecoration(
          color: AppColors.accent,
          borderRadius: BorderRadius.circular(12),
        ),
        width: 335,
        height: 56,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(AppIcons.iconshoppingcart),
                  Padding(padding: EdgeInsetsGeometry.only(left: 16)),
                  Text(label, style: textStyleBtn,)
                ],
              ),
               Row(
                children: [
                  Text("$price", style: textStyleBtn),
                  Padding(padding: EdgeInsetsGeometry.only(right: 6)),
                  Text("₽", style: textStyleBtn)
                ],
              ),
            ],
          )
        )
      ),
      onTap: () => onPressed,
    );
  }
}