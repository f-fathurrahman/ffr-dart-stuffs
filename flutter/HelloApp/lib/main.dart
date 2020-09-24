import 'package:flutter/material.dart';

//void main() => runApp(RootWidget());
//void main() => runApp(FancyHelloWidget());

void main() => runApp(TestIconWidget());

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
          child: Icon(Icons.access_alarm, color: Colors.blue, size: 200)
        ),
      )
    );
  }
}

class RootWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Hello world by Fadjar', textDirection: TextDirection.ltr);
  }
}

class FancyHelloWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('A fancy app'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Text('''
          Hello App by Fadjar. This a quite a long text by itself.Hello App by Fadjar. This a quite a long text by itself.Hello App by Fadjar. This a quite a long text by itself.Hello App by Fadjar. This a quite a long text by itself.
          
          blah blah. Blah blah blah.

          This is should be a new paragraph.
          ''',
          style: TextStyle(fontSize: 30, color: Colors.green)),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.thumb_up),
          onPressed: () => {},
        ),
      ),
    );
  }
}