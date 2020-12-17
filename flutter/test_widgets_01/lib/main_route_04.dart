import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigasi dengan Drawer',
      theme: ThemeData(primarySwatch: Colors.green),
      routes: {
        '/': (BuildContext ctx) => HomePage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tab Navigation'),
          bottom: TabBar(tabs: const <Widget>[
            Tab(icon: Icon(Icons.looks_one), child: Text('Show 1')),
            Tab(icon: Icon(Icons.looks_two), child: Text('Show 2')),
            Tab(icon: Icon(Icons.looks_3), child: Text('Show 3')),
          ]),
        ),
        body: TabBarView(
          children: <Widget>[
            Widget1(),
            Widget2(),
            Widget3(),
          ],
        ),
        bottomNavigationBar: Material(
          color: Theme.of(context).colorScheme.primary,
          child: TabBar(tabs: const <Widget>[
            Tab(icon: Icon(Icons.looks_one), child: Text('Show A')),
            Tab(icon: Icon(Icons.looks_two), child: Text('Show B')),
            Tab(icon: Icon(Icons.looks_3), child: Text('Show C')),
          ]),
        ),
      ),
    );
  }
}


class Widget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child:  Text(
        "I'm widget 1",
        style: Theme.of(context).textTheme.headline4,
      )),
    );
  }
}


class Widget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child:  Text(
        "I'm widget 2",
        style: Theme.of(context).textTheme.headline4,
      )),
    );
  }
}


class Widget3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child:  Text(
        "I'm widget 3",
        style: Theme.of(context).textTheme.headline4,
      )),
    );
  }
}
