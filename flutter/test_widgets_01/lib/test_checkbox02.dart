import 'package:flutter/material.dart';

class TestCheckbox02 extends StatefulWidget {
  TestCheckbox02({Key key}) : super(key: key);

  @override
  _TestCheckbox02 createState() => _TestCheckbox02();
}

class _TestCheckbox02 extends State<TestCheckbox02> {

  List<bool> checked = [false,false,false,false,false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          for(var i = 0; i < 5; i = i + 1)
            Row(
              children: [
                Checkbox(
                  onChanged: i == 4 ? null : (bool value) {
                    setState( () {
                      checked[i] = value;
                    });
                  },
                  tristate: i == 1,
                  value: checked[i],
                  activeColor: Color(0xFF6200EE),
                ),
                Text(
                  'Checkbox ${i + 1}',
                  style: Theme.of(context).textTheme.subtitle1.copyWith(color: i == 4 ? Colors.black38 : Colors.black),
                )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          )
        ],
      ),
    );
  }
}