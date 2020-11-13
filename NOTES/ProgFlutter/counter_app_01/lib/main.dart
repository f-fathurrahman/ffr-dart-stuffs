import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(CounterApp());

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App by Kelompok XXX',
      theme: ThemeData(primarySwatch: Colors.green),
      home: CounterAppHome(),
    );
  }
}

class CounterAppHome extends StatefulWidget {
  @override
  _CounterAppHomeState createState() => _CounterAppHomeState();
}

class _CounterAppHomeState extends State<CounterAppHome> {

  int _counter = 0;

  void _incrementCounter() {
    setState( () {
      _counter = _counter + 1;
      print('Increment button is pressed: $_counter');
    } );
  }

  void _decrementCounter() {
    setState( () {
      _counter = _counter - 1;
      print('Decrement button is pressed: $_counter');
    } );
  }

  void _resetCounter() {
    setState( () {
      _counter = 0;
      print('Reset button is pressed');
    } );
  }

  @override
  Widget build(BuildContext context) {
    
    final incrementButton = Container(
      child: RaisedButton(
        child: Text('Increment', style: TextStyle(color: Colors.white)),
        color: Colors.red,
        onPressed: _incrementCounter,
      ),
    );

    final decrementButton = Container(
      child: RaisedButton(
        child: Text('Decrement', style: TextStyle(color: Colors.white)),
        color: Colors.blue,
        onPressed: _decrementCounter,
      ),
    );

    var _buttons = <Widget>[incrementButton, decrementButton];
    var _flutterLogo = Container(
      margin: EdgeInsets.only(bottom: 5.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.25),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Image.asset(
        'images/flutter_logo_1080.png',
        width: 100,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _flutterLogo,
            Text('You have pushed the button this many times: '),
            Text(
              _counter.toString(),
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
        onPressed: _resetCounter,
      ),
    );

  }
}