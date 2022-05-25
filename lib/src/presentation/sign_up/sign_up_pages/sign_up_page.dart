import 'package:aina/src/components/custom_app_bar.dart';
import 'package:aina/src/components/custom_authorization_widget.dart';
import 'package:aina/src/components/custom_background_image.dart';
import 'package:aina/src/components/custom_button.dart';
import 'package:aina/src/components/custom_text_field.dart';
import 'package:aina/src/constants/app_text_styles.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _industryController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _industryController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    children.add(CustomAppBar(
        actionPressed: () =>
            Navigator.pushReplacementNamed(context, '/sign_in'),
        actionText: 'Sign In'));

    children.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            width: MediaQuery.of(context).size.width * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Sign Up', style: AppTextStyles.h1px24),
                SizedBox(height: 24),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Company Name',
                    style: AppTextStyles.h2px16,
                  ),
                ),
                SizedBox(height: 12),
                CustomTextField(controller: _nameController),
                SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Email', style: AppTextStyles.h2px16),
                ),
                SizedBox(height: 12),
                CustomTextField(controller: _emailController),
                SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Industry', style: AppTextStyles.h2px16),
                ),
                SizedBox(height: 12),
                CustomTextField(controller: _industryController),
                SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Password', style: AppTextStyles.h2px16),
                ),
                SizedBox(height: 12),
                CustomTextField(controller: _passwordController),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      text: 'Next',
                      onPressed: () =>
                          Navigator.pushNamed(context, '/phone_numbers'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
    return CustomAuthorizationWidget(children: children);
  }
}
