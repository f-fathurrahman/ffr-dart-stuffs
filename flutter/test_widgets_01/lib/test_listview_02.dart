import 'package:flutter/material.dart';

class TestListView02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test ListView')
      ),
      body: _createListViewExample02()
    );
  }

  Widget _createListViewExample02() {
    TextStyle txtStyle = TextStyle(fontSize: 20);
    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[600, 500, 100];

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          color: Colors.green[colorCodes[index]],
          child: Center(child: Text('Entry ${entries[index]}', style: txtStyle)),
        );
      }
    );
  }

}

