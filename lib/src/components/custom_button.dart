import 'package:aina/src/constants/app_colors.dart';
import 'package:aina/src/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final Color? color;
  final Color? textColor;
  const CustomButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.color = AppColors.primary,
    this.textColor = Colors.white,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color,
        ),
        child: Text(
          text,
          style: AppTextStyles.h2px16.copyWith(color: textColor),
        ),
      ),
    );
  }
}
