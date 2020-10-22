import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('😍 The AppBar title 😍')),
        body: MyBodyText(),
      )
    );
  }
}

class MyBodyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(text: 'Don\'t have an account? Long Text Long Text 1 Long Text 2 Long Text 3 Long Text 4 Long Text 5 Long Text 6''',
        style: TextStyle(color: Colors.black, fontSize: 18)
      ),
    );
  }
}