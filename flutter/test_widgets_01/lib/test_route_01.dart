import 'package:flutter/material.dart';

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Some text in first route',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              child: Text('Go to second route'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute()),
                );
              },
            ),
          ],)
      ),
    );
  }
}


class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Route'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Some text in second route ...',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              child: Text('Go back to first route'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],)
      ),
    );
  }
}