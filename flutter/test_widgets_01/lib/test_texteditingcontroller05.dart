// Using keyboardType in TextField

import 'package:flutter/material.dart';

class TestTextEditingController05 extends StatefulWidget {
  TestTextEditingController05({Key key}) : super(key: key);

  @override
  _TestTextEditingController05 createState() => _TestTextEditingController05();
}

class _TestTextEditingController05 extends State<TestTextEditingController05> {
  final _controller = TextEditingController();
  String _input = '';

  void dispose() {
    _controller.dispose();
    super.dispose();
  } // dispose

  void _handleInput(String val) {
    setState( () {
      _input = val;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(6),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Number',
                hintText: 'Please type your number',
                icon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
              onChanged: _handleInput,
            ),
          ),
          Text('You input: $_input', style: TextStyle(fontSize: 20)),
        ],
      )
    );
  }
}