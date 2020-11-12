import 'package:flutter/material.dart';
import 'package:counter_app_01/fancy_button.dart';

void main() => runApp(CounterApp());

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App by Kelompok XXX',
      theme: ThemeData(primarySwatch: Colors.green),
      home: CounterAppHome(title: 'Counter App Home'),
    );
  }
}

class CounterAppHome extends StatelessWidget {
  final String title;
  CounterAppHome({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final incrementButton = FancyButton(
      child: Text(
        'Increment',
        style: TextStyle(color: Colors.white),
      ),
    );

    final decrementButton = FancyButton(
      child: Text(
        "Decrement",
        style: TextStyle(color: Colors.white),
      ),
    );

    var _buttons = <Widget>[incrementButton, decrementButton];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 50.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.25),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Image.asset(
                'images/flutter_logo_1080.png',
                width: 100,
              ),
            ),
            Text('You have pushed the button this many times: '),
            Text(
              '0',
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _buttons,
            )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Reset',
        child: new Icon(Icons.refresh),
      ),
    );

  }
}