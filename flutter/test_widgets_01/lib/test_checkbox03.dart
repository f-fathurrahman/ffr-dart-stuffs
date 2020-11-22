import 'package:flutter/material.dart';

class TestCheckbox03 extends StatefulWidget {
  TestCheckbox03({Key key}) : super(key: key);

  @override
  _TestCheckbox03 createState() => _TestCheckbox03();
}

class _TestCheckbox03 extends State<TestCheckbox03> {

  static List<bool> checked = [false,false,false,false,false];

  void _handle0(bool value) {
    setState( () {
      checked[0] = value;
    });
  }

  void _handle1(bool value) {
    setState( () {
      checked[1] = value;
    });
  }

  void _handle2(bool value) {
    setState( () {
      checked[2] = value;
    });
  }

  void _handle3(bool value) {
    setState( () {
      checked[3] = value;
    });
  }

  void _handle4(bool value) {
    setState( () {
      checked[4] = value;
    });
  }

  Checkbox _buildCheckbox(bool value, Function handle) {
    return Checkbox(
      onChanged: handle,
      tristate: false,
      value: value,
      activeColor: Colors.blue,
    );
  }

  Text _buildText(String txt) {
    return Text(txt, style: TextStyle(color: Colors.black));
  }

  Row _buildRow(Checkbox chkbox, Text text) {
    return Row(
      children: [
        chkbox, text,
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
            Row(
              children: [
                _buildCheckbox(checked[0], _handle0),
                _buildText('Option 0'),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          Row(
            children: [
              _buildCheckbox(checked[1], _handle1),
              _buildText('Option 1'),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          _buildRow(_buildCheckbox(checked[2], _handle2), _buildText('Option 2')),
        ],
      ),
    );
  }
}