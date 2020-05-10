import 'package:flutter/material.dart';
import 'userManegment/login.dart';
import 'appConstants.dart';
import 'userManegment/forgotPassword.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: primaryColor,
        ),
        home: Login(),
        routes: {
          ForgotPassword.id: (context) => ForgotPassword(),
        });
  }
}
