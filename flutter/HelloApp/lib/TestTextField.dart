import 'package:flutter/material.dart';

class TestTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test Icon'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter a search term'
            ),
          ),
        ),
      )
    );
  }
}