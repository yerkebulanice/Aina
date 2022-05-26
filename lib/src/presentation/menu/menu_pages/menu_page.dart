import 'package:aina/src/constants/app_text_styles.dart';

import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 19,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'IN DEVELOPMENT',
            style: AppTextStyles.h1px24,
          )
        ],
      ),
    );
  }
}
