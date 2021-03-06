import 'dart:io';

import 'package:aina/src/presentation/app/app_pages/app.dart';
import 'package:aina/src/presentation/dashboard/dashboard_pages/dashboard_page.dart';
import 'package:aina/src/presentation/dashboard/dashboard_provider/dashboard_data.dart';
import 'package:aina/src/presentation/sign_in/sign_in_pages/sign_in_page.dart';
import 'package:aina/src/presentation/sign_up/sign_up_pages/sign_up_page.dart';
import 'package:aina/src/presentation/sign_up/sign_up_pages/sign_up_phone_numbers_page.dart';
import 'package:aina/src/presentation/sign_up/sign_up_pages/sign_up_questions_page.dart';
import 'package:aina/src/provider/recent_clients_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // if (Platform.isWindows) {
  // setWindowMaxSize(const Size(1024, 768));
  // setWindowMinSize(const Size(512, 384));
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DashboardData(),
        ),
        ChangeNotifierProvider(
          create: (context) => ClientData(),
        ),
      ],
      child: MaterialApp(
        title: 'AINA',
        debugShowCheckedModeBanner: false,
        builder: (context, child) => ResponsiveWrapper.builder(
          child,
          maxWidth: 2000,
          minWidth: 1000,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ],
        ),
        routes: {
          '/': (context) => App(),
          '/sign_in': (context) => SignInPage(),
          '/sign_up': (context) => SignUpPage(),
          '/dashboard': (context) => DashboardPage(),
          '/phone_numbers': (context) => SignUpPhoneNumbersPage(),
          '/sign_up_questions': (context) => SignUpQuestionsPage(),
        },
        initialRoute: '/',
      ),
    );
  }
}
