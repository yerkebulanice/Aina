import 'package:aina/src/components/custom_text_field.dart';
import 'package:aina/src/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class SignUpPhoneNumberTextField extends StatelessWidget {
  final int index;
  const SignUpPhoneNumberTextField({Key? key, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              index.toString(),
              style: AppTextStyles.h2px16,
            ),
            SizedBox(width: 8),
            Expanded(child: CustomTextField())
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
