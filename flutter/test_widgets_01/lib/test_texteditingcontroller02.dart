import 'package:flutter/material.dart';

class TestTextEditingController02 extends StatefulWidget {
  TestTextEditingController02({Key key}) : super(key: key);

  @override
  _TestTextEditingController02 createState() => _TestTextEditingController02();
}

class _TestTextEditingController02 extends State<TestTextEditingController02> {
  final _controller = TextEditingController();
  String _str = '';

  void dispose() {
    _controller.dispose();
    super.dispose();
  } // dispose

  void _handleTextChanged(String inpstr) {
    setState( () {
      _str = inpstr;
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
              onChanged: _handleTextChanged,
            ),
          ),
          Text('You typed: $_str'),
        ],
      )
    );
  }
}