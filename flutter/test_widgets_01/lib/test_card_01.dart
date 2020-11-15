import 'package:flutter/material.dart';

class TestCard01 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Card 01')
      ),
      body: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.verified),
                title: Text('Title Text'),
                subtitle: Text('Subtitle Text'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(child: Text('Choice 1'), onPressed: () {},),
                  const SizedBox(width: 20),
                  TextButton(child: Text('Choice 2'), onPressed: () {},),
                  const SizedBox(width: 10),
                ],
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ),
    );
  }
  
}