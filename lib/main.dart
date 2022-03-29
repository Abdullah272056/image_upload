import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'change_password_page.dart';



void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.status_bar_color,
    systemNavigationBarColor: Colors.appRed,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Screen',
      home: ChangePasswordScreen(),
    );
  }
}


