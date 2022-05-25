import 'package:aina/src/components/custom_app_bar.dart';
import 'package:aina/src/components/custom_authorization_widget.dart';
import 'package:aina/src/components/custom_button.dart';
import 'package:aina/src/constants/app_text_styles.dart';
import 'package:aina/src/presentation/sign_up/sign_up_widgets/sign_up_questions_and_answers.dart';
import 'package:flutter/material.dart';

class SignUpQuestionsPage extends StatefulWidget {
  const SignUpQuestionsPage({Key? key}) : super(key: key);

  @override
  State<SignUpQuestionsPage> createState() => _SignUpQuestionsPageState();
}

class _SignUpQuestionsPageState extends State<SignUpQuestionsPage> {
  List<Widget> questionsAndAnswers = [SignUpQuestionsAndAnswers(index: 1)];
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    children.add(CustomAppBar(
        actionPressed: () =>
            Navigator.pushReplacementNamed(context, '/sign_in'),
        actionText: 'Sign In'));
    children.add(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          width: MediaQuery.of(context).size.width * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Frequently Asked Questions', style: AppTextStyles.h1px24),
              SizedBox(height: 24),
              Text(
                'Please fill in the frequently asked questions from your customers, with this we can automate your system',
                style: AppTextStyles.h2px16,
              ),
              SizedBox(height: 12),
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: questionsAndAnswers.length,
                itemBuilder: (context, index) => questionsAndAnswers[index],
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    questionsAndAnswers.add(SignUpQuestionsAndAnswers(
                        index: questionsAndAnswers.length + 1));
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.add,
                      size: 24,
                      color: Color(0xff243b8b),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Add',
                      style: AppTextStyles.h2px16
                          .copyWith(color: const Color(0xff243b8b)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    text: 'Previous',
                    onPressed: () => Navigator.pop(context),
                    color: Colors.grey.withOpacity(0.2),
                    textColor: Colors.black,
                  ),
                  SizedBox(width: 10),
                  CustomButton(
                    text: 'Save',
                    onPressed: () => Navigator.pushNamed(context, '/dashboard'),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    ));
    return CustomAuthorizationWidget(children: children);
  }
}
