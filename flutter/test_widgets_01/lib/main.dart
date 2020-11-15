import 'package:flutter/material.dart';
//import 'test_datetimepicker.dart';
//import 'test_datepicker.dart';
//import 'test_timepicker.dart';
//import 'test_listview_01.dart';
//import 'test_listview_02.dart';
import 'test_card_01.dart';

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
      //home: TestDatePicker(),
      //home: TestTimePicker(),
      //home: TestListView01(),
      //home: TestListView02(),
      home: TestCard01(),
      debugShowCheckedModeBanner: false,
    );
  }
}

