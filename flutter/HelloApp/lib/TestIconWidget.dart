import 'package:flutter/material.dart';

class TestIconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test Icon'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Icon(Icons.backpack, color: Colors.blue, size: 200)
        ),
      )
    );
  }
}