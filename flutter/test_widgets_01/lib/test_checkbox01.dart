import 'package:flutter/material.dart';

class TestCheckbox01 extends StatefulWidget {
  TestCheckbox01({Key key}) : super(key: key);

  @override
  _TestCheckbox01 createState() => _TestCheckbox01();
}

class _TestCheckbox01 extends State<TestCheckbox01> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Checkbox(
        value: true,
        onChanged: (bool val) {
          print('val = $val');
        },
      )
    );
  }
}