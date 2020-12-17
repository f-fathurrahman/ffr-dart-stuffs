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
        '/drawer1': (BuildContext ctx) => WidgetWithDrawer1(),
        '/drawer2': (BuildContext ctx) => WidgetWithDrawer2(),
        '/drawer3': (BuildContext ctx) => WidgetWithDrawer3(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigasi dengan Drawer'),
      ),
      body: Center(
        child: Container(
          child: Text(
            'Home Page',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'assets/images/samsan_tech.jpg',
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Samsan Tech',
                    style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.looks_one),
            title: const Text('Menu 1'),
            onTap: () {
              Navigator.pushNamed(context, '/drawer1');
            },
          ),
          ListTile(
            leading: const Icon(Icons.looks_two),
            title: const Text('Menu 2'),
            onTap: () {
              Navigator.pushNamed(context, '/drawer2');
            },
          ),
          ListTile(
            leading: const Icon(Icons.looks_3),
            title: const Text('Menu 3'),
            onTap: () {
              Navigator.pushNamed(context, '/drawer3');
            },
          ),
        ],
      ),
    );
  }
}

class WidgetWithDrawer1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman 1'),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Container(
          child: Text(
            "Widget 1",
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }
}

class WidgetWithDrawer2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman 2'),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Container(
          child: Text(
            "Widget 2",
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }
}

class WidgetWithDrawer3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman 3'),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Container(
          child: Text(
            "Widget 3",
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }
}
