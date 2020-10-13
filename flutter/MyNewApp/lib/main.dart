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
    return Column(
      children: [
        Text('😍 Flutter Example 😍', style: TextStyle(fontSize: 40, fontFamily: 'Monaco')),
        Text('Flutter again again', style: Theme.of(context).textTheme.headline3),
        Text(
          'Text by TextStyle',
          style: TextStyle(fontSize: 30, color: Colors.redAccent),
        ),
        Row(children: [
          Text('🙏🙏 Long Text 1 😁 🙏🙏', style: TextStyle(fontSize: 25)),
          Text('🙏🙏 Long Text 2 😁 🙏🙏', style: TextStyle(fontSize: 25)),
          Text('🙏🙏 Long Text 3 😡 🙏🙏', style: TextStyle(fontSize: 25)),
        ]),
        Text('😘😘😘😘😘😘', style: TextStyle(fontSize: 40)),
        Text('😍😍😍😍😍😍', style: TextStyle(fontSize: 50)),
        Text('😂', style: TextStyle(fontSize: 80)),
        Text('مان انا',
          style: TextStyle(fontSize: 40,
          fontFamily: 'Amiri Quran')
        ),
      ],
    );
  }
}