import 'package:flutter/material.dart';

class TestImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test Icon'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Image.asset('assets/images/xkcd_01.png',),
        ),
      )
    );
  }
}