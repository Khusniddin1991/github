import 'package:flutter/material.dart';

import 'MyHomePage/MyHomePage.dart';
import 'MyHomePage/Sign in.dart';
import 'MyHomePage/SignUp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: {
        MyHomePage.id:(ctx)=>MyHomePage(),
        SignIn.id:(ctx)=>SignIn(),
       SignUp.id:(ctx)=>SignUp()
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignIn(),
    );
  }
}
