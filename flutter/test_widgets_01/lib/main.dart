import 'package:flutter/material.dart';
//import 'TestDatetimePicker.dart';
import 'TestDatePicker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: TestDatetimePicker(),
      home: TestDatePicker(),
    );
  }
}

