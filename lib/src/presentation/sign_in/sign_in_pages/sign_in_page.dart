import 'package:aina/src/components/custom_app_bar.dart';
import 'package:aina/src/components/custom_authorization_widget.dart';
import 'package:aina/src/components/custom_button.dart';
import 'package:aina/src/components/custom_text_field.dart';
import 'package:aina/src/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isHoveringSignIn = false;
  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    children.add(CustomAppBar(
        actionPressed: () =>
            Navigator.pushReplacementNamed(context, '/sign_up'),
        actionText: 'Sign Up'));
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
                Text('Sign In', style: AppTextStyles.h1px24),
                SizedBox(height: 24),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email',
                    style: AppTextStyles.h2px16,
                  ),
                ),
                SizedBox(height: 12),
                CustomTextField(controller: _emailController),
                SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Password',
                    style: AppTextStyles.h2px16,
                  ),
                ),
                SizedBox(height: 12),
                CustomTextField(controller: _passwordController),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      text: 'Log In',
                      onPressed: () =>
                          Navigator.pushNamed(context, '/dashboard'),
                    )
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
