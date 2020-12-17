import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigasi Sederhana',
      theme: ThemeData(primarySwatch: Colors.green),
      routes: {
        '/': (BuildContext ctx) => FirstPage(),
        '/second': (BuildContext ctx) => SecondPage(),
        '/third': (BuildContext ctx) => ThirdPage(),
      },
    );
  }  
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Page Title')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is first page', style: TextStyle(fontSize: 20),),
            ElevatedButton(
              child: Text('Go to second page', style: TextStyle(fontSize: 20),),
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page Title')),
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is second page', style: TextStyle(fontSize: 20),),
            ElevatedButton(
              child: Text('Go back to first page', style: TextStyle(fontSize: 20)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: Text('Go to third page', style: TextStyle(fontSize: 20),),
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(title: Text('Third Page Title')),
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is third page', style: TextStyle(fontSize: 20),),
            ElevatedButton(
              child: Text('Go back to second page', style: TextStyle(fontSize: 20)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}