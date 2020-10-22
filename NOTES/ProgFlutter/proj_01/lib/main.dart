import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Kelas yang dibuat sendiri
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nama Aplikasi',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('😍 Ini Aplikasiku 😍')),
        body: Column(
          children: [
            Image(image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),),
            Text('Hello 😪😪😪😪😪',
              style: TextStyle(color: Colors.blueAccent, fontSize: 30, fontFamily: 'Monaco')
            ),
            Text('I am sleepy 😪😪😪😪😪', style: TextStyle(fontSize: 30)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Text('Text1',
                style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold)
              ),
              Text('Text2', style: TextStyle(fontSize: 20)),
              Text('Text3', style: TextStyle(fontSize: 20)),
            ], )
          ]
        ),
      )
    );
  }
}