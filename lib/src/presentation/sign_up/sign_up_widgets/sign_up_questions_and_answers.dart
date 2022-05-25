import 'package:aina/src/components/custom_text_field.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class SignUpQuestionsAndAnswers extends StatelessWidget {
  final int index;
  const SignUpQuestionsAndAnswers({Key? key, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              index.toString(),
            ),
            SizedBox(width: 8),
            Expanded(
                child: Column(
              children: const [
                CustomTextField(
                  hintText: 'Question',
                ),
                SizedBox(height: 8),
                CustomTextField(
                  hintText: 'Answer',
                ),
              ],
            ))
          ],
        ),
        SizedBox(height: 12),
      ],
    );
  }
}
