import 'package:flutter/material.dart';

class TestTextEditingController03 extends StatefulWidget {
  TestTextEditingController03({Key key}) : super(key: key);

  @override
  _TestTextEditingController03 createState() => _TestTextEditingController03();
}

class _TestTextEditingController03 extends State<TestTextEditingController03> {
  final _controller = TextEditingController();

  void dispose() {
    _controller.dispose();
    super.dispose();
  } // dispose

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
            ),
          ),
          Text('You typed: ${_controller.text.toString()}'),
        ],
      )
    );
  }
}