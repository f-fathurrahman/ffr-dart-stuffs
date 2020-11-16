// Using obscureText in TextField

import 'package:flutter/material.dart';

class TestTextEditingController04 extends StatefulWidget {
  TestTextEditingController04({Key key}) : super(key: key);

  @override
  _TestTextEditingController04 createState() => _TestTextEditingController04();
}

class _TestTextEditingController04 extends State<TestTextEditingController04> {
  final _controller = TextEditingController();
  String _passwd = '';

  void dispose() {
    _controller.dispose();
    super.dispose();
  } // dispose

  void _handleInput(String val) {
    setState( () {
      _passwd = val;
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
              obscureText: true,
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Please type your password',
                icon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
              onChanged: _handleInput,
            ),
          ),
          Text('You passwd: $_passwd', style: TextStyle(fontSize: 20)),
        ],
      )
    );
  }
}