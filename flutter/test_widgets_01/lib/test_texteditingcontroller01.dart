import 'package:flutter/material.dart';

class TestTextEditingController01 extends StatefulWidget {
  TestTextEditingController01({Key key}) : super(key: key);

  @override
  _TestTextEditingController01 createState() => _TestTextEditingController01();
}

class _TestTextEditingController01 extends State<TestTextEditingController01> {
  final _controller = TextEditingController();

  void initState() {
    super.initState();
    _controller.addListener(() {
      //final text = _controller.text.toLowerCase();
      final text = _controller.text.toUpperCase();
      _controller.value = _controller.value.copyWith(
        text: text,
        selection: TextSelection(
          baseOffset: text.length,
          extentOffset: text.length
        ),
        composing: TextRange.empty,
      );
    });
  } // initState

  void dispose() {
    _controller.dispose();
    super.dispose();
  } // dispose

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(6),
        child: TextFormField(
          controller: _controller,
          decoration: InputDecoration(
            border: OutlineInputBorder()
          ),
          onChanged: (String str) {
            print('str = $str');
          }
        ),
      ),
    );
  }
}