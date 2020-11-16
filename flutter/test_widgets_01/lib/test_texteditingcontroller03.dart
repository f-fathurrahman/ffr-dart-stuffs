import 'package:flutter/material.dart';

class TestTextEditingController03 extends StatefulWidget {
  TestTextEditingController03({Key key}) : super(key: key);

  @override
  _TestTextEditingController03 createState() => _TestTextEditingController03();
}

class _TestTextEditingController03 extends State<TestTextEditingController03> {
  final _controller = TextEditingController();
  String _email = '';

  void dispose() {
    _controller.dispose();
    super.dispose();
  } // dispose

  void _handleInput(String val) {
    setState( () {
      _email = val;
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
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'you@email.com',
                icon: Icon(Icons.contact_mail),
                border: OutlineInputBorder(),
              ),
              onChanged: _handleInput,
            ),
          ),
          Text('You email: $_email', style: TextStyle(fontSize: 20)),
        ],
      )
    );
  }
}