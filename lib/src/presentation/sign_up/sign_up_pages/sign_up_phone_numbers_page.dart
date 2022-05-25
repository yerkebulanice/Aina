import 'package:aina/src/components/custom_app_bar.dart';
import 'package:aina/src/components/custom_authorization_widget.dart';
import 'package:aina/src/components/custom_button.dart';
import 'package:aina/src/constants/app_text_styles.dart';
import 'package:aina/src/presentation/sign_up/sign_up_widgets/sign_up_phone_number_text_field.dart';
import 'package:flutter/material.dart';

class SignUpPhoneNumbersPage extends StatefulWidget {
  const SignUpPhoneNumbersPage({Key? key}) : super(key: key);

  @override
  State<SignUpPhoneNumbersPage> createState() => _SignUpPhoneNumbersPageState();
}

class _SignUpPhoneNumbersPageState extends State<SignUpPhoneNumbersPage> {
  List<Widget> phoneNumbers = [SignUpPhoneNumberTextField(index: 1)];
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
              Text('Phone Numbers of Company Call Center',
                  style: AppTextStyles.h1px24),
              SizedBox(height: 24),
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: phoneNumbers.length,
                itemBuilder: (context, index) => phoneNumbers[index],
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    phoneNumbers.add(SignUpPhoneNumberTextField(
                        index: phoneNumbers.length + 1));
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
                    text: 'Next',
                    onPressed: () =>
                        Navigator.pushNamed(context, '/sign_up_questions'),
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
