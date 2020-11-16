import 'package:flutter/material.dart';
//import 'test_datetimepicker.dart';
//import 'test_datepicker.dart';
//import 'test_timepicker.dart';
//import 'test_listview_01.dart';
//import 'test_listview_02.dart';
//import 'test_card_01.dart';
//import 'test_card_02.dart';
//import 'test_verify_input_01.dart';
//import 'my_home_01.dart';
//import 'test_inkwell_01.dart';
//import 'test_texteditingcontroller01.dart';
//import 'test_texteditingcontroller02.dart';
import 'test_texteditingcontroller03.dart';


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
      debugShowCheckedModeBanner: true,
      //home: MyHome(),
      //home: TestDatetimePicker(),
      //home: TestDatePicker(),
      //home: TestTimePicker(),
      //home: TestListView01(),
      //home: TestListView02(),
      //home: TestCard01(),
      //home: TestCard02(),
      //home: TestInkWell01(),
      //home: TestTextEditingController01(),
      //home: TestTextEditingController02(),
      home: TestTextEditingController03(),
      //home: InputControllerExamplesWidget(),
    );
  }
}

