import 'package:flutter/material.dart';

class TestListView01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test ListView')
      ),
      body: _createListViewExample01()
    );
  }

  Widget _createListViewExample01() {
    TextStyle txtStyle = TextStyle(fontSize: 20);
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          height: 50,
          color: Colors.blueAccent,
          child: Center(child: Text('Entry A', style: txtStyle))
        ),
        Container(
          height: 50,
          color: Colors.greenAccent,
          child: Center(child: Text('Entry B', style: txtStyle))
        ),
        Container(
          height: 80,
          color: Colors.pinkAccent,
          child: Center(child: Text('Entry C', style: txtStyle))
        )
      ],
    );
  }

}

