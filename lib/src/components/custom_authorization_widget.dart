import 'package:aina/src/components/custom_background_image.dart';
import 'package:flutter/material.dart';

class CustomAuthorizationWidget extends StatelessWidget {
  final List<Widget> children;
  const CustomAuthorizationWidget({Key? key, required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomBackgroundImage(),
          SingleChildScrollView(child: Column(children: children)),
        ],
      ),
    );
  }
}
