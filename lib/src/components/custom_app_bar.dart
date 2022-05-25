import 'package:aina/src/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String actionText;
  final Function()? actionPressed;
  const CustomAppBar({
    Key? key,
    required this.actionPressed,
    required this.actionText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/logo.png', height: 48),
          InkWell(
            onTap: actionPressed,
            child: Text(actionText, style: AppTextStyles.h2px16),
          ),
        ],
      ),
    );
  }
}
