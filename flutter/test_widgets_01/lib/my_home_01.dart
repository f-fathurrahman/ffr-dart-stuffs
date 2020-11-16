import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyHome')
      ),
      body: Center(
        child: Text(
          'This is my home',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}