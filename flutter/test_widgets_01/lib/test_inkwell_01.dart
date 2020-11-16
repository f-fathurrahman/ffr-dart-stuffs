import 'package:flutter/material.dart';

class TestInkWell01 extends StatefulWidget {

  TestInkWell01({Key key}) : super(key: key);

  @override
  _TestInkWell01State createState() => _TestInkWell01State();

} // class

class _TestInkWell01State extends State<TestInkWell01> {
  double sideLength = 50;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        height: sideLength,
        width: sideLength,
        curve: Curves.easeIn,
        duration: Duration(seconds: 2),
        child: Material(
          color: Colors.blue,
          child: InkWell(
            onTap: () {
              setState( () {
                sideLength == 50 ? sideLength = 200 : sideLength = 50;
              });
            },),
        ),
      ),
    );
  }
}