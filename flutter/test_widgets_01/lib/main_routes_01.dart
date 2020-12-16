import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Navigation and Routing',
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: <String, WidgetBuilder>{
        '/': (BuildContext ctx) => Landing(),
        '/tab': (BuildContext ctx) => TabNavigation(),
        '/drawer': (BuildContext ctx) => DrawerNavigation(),
        '/stack': (BuildContext ctx) => StackNavigation(),
        '/dialog': (BuildContext ctx) => Dialogs(),
        '/drawer1': (BuildContext ctx) => WidgetWithDrawer1(),
        '/drawer2': (BuildContext ctx) => WidgetWithDrawer2(),
        '/drawer3': (BuildContext ctx) => WidgetWithDrawer3(),
        '/stack1': (BuildContext ctx) => WidgetWithScaffold1(),
        '/stack2': (BuildContext ctx) => WidgetWithScaffold2(),
        '/stack3': (BuildContext ctx) => WidgetWithScaffold3(),
      },
    );
  }
}

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Landing'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1,
        children: makeWidgets(context),
      ),
    );
  }

  List<Widget> makeWidgets(BuildContext context) {
    final List<Map<String, dynamic>> listOfThings = <Map<String, dynamic>>[
      <String, dynamic>{
        'label': 'Drawer Navigation',
        'description':
            'A drawer peeks in from the left side (configurable) and when the user swipes right or taps it, the drawer opens, revealing menu choices.',
        'route': '/drawer',
        'background': Colors.amberAccent,
      },
      <String, dynamic>{
        'label': 'Stack Navigation',
        'description':
            'Replacing the entire scene with another widget. Keeps track of history, allowing you to go back and forward.',
        'route': '/stack',
        'background': Colors.blueAccent,
      },
      <String, dynamic>{
        'label': 'Tab',
        'description':
            "A stationary set of tabs at the top or bottom of the widget that doesn't change but as a tab is pressed, the content changes.",
        'route': '/tab',
        'background': Colors.purpleAccent,
      },
      <String, dynamic>{
        'label': 'Dialog',
        'description':
            "Not technically navigation, but we're showing a widget and then closing it. This could be considered a form of navigation.",
        'route': '/dialog',
        'background': Colors.redAccent,
      },
    ];
    return listOfThings
        .map((Map<String, dynamic> thing) => Container(
            decoration: BoxDecoration(
              color: thing['background'],
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              boxShadow: <BoxShadow>[
                BoxShadow(offset: const Offset(5.0, 5.0), blurRadius: 7.0)
              ],
            ),
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, thing['route']);
              },
              child: Column(children: <Widget>[
                Text(
                  thing['label'],
                  style: Theme.of(context).textTheme.headline5,
                ),
                Divider(
                  color: Colors.black,
                ),
                Text(thing['description']),
              ]),
            )))
        .toList();
  }
}

class Dialogs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialogs'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Dialogs',
                style: Theme.of(context).textTheme.display1,
              ),
              RaisedButton(
                child: const Text('No response'),
                onPressed: () => showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: const Text('Press OK to continue'),
                          actions: <Widget>[
                            FlatButton(
                                child: const Text('OK'),
                                onPressed: () => Navigator.pop(context)),
                          ],
                        );
                      },
                    ),
              ),
              RaisedButton(
                child: const Text('Get a response'),
                onPressed: () async {
                  final String response = await showDialog<String>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: const Text('Are you sure?'),
                        actions: <Widget>[
                          FlatButton(
                              child: const Text('Yes'),
                              onPressed: () => Navigator.pop(context, 'Yes')),
                          FlatButton(
                              child: const Text('No'),
                              onPressed: () => Navigator.pop(context, 'No')),
                        ],
                      );
                    },
                  );
                  print(response);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class TabNavigation extends StatelessWidget {
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
        child: Text(
          "I'm widget 2",
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}

class Widget3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "I'm widget 3",
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}


class StackNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack Navigation'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Stack Navigation',
                style: Theme.of(context).textTheme.headline3,
              ),
              RaisedButton(
                child: const Text('Scene 1'),
                onPressed: () => Navigator.pushNamed(context, '/stack1'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Navigation'),
      ),
      body: Center(
        child: Container(
            child: Text(
          'Drawer Navigation',
          style: Theme.of(context).textTheme.headline4,
        )),
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
                  'assets/images/BrandLogo.jpg',
                ),
                Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'My Brand',
                      style: Theme.of(context).textTheme.headline4,
                    )),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.looks_one),
            title: const Text('Scene 1'),
            onTap: () {
              Navigator.pushNamed(context, '/drawer1');
            },
          ),
          ListTile(
            leading: const Icon(Icons.looks_two),
            title: const Text('Scene 2'),
            onTap: () {
              Navigator.pushNamed(context, '/drawer2');
            },
          ),
          ListTile(
            leading: const Icon(Icons.looks_3),
            title: const Text('Scene 3'),
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
        title: const Text('Drawer Navigation'),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Container(
            child: Text(
          "I'm widget 1",
          style: Theme.of(context).textTheme.display1,
        )),
      ),
    );
  }
}


class WidgetWithDrawer2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Navigation'),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Container(
            child: Text(
          "I'm widget 2",
          style: Theme.of(context).textTheme.display1,
        )),
      ),
    );
  }
}

class WidgetWithDrawer3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Navigation'),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Container(
            child: Text(
          "I'm widget 3",
          style: Theme.of(context).textTheme.display1,
        )),
      ),
    );
  }
}

class WidgetWithScaffold1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack Navigation'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'I am widget 1',
                style: Theme.of(context).textTheme.display1,
              ),
              RaisedButton(
                child: const Text('Scene 2'),
                onPressed: () => Navigator.pushNamed(context, '/stack2'),
              ),
              RaisedButton(
                child: const Text('Go back'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetWithScaffold2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack Navigation'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'I am widget 2',
                style: Theme.of(context).textTheme.display1,
              ),
              RaisedButton(
                child: const Text('Scene 3'),
                onPressed: () => Navigator.pushNamed(context, '/stack3'),
              ),
              RaisedButton(
                child: const Text('Go back'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetWithScaffold3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack Navigation'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'I am widget 3',
                style: Theme.of(context).textTheme.display1,
              ),
              RaisedButton(
                child: const Text('Scene 1'),
                onPressed: () => Navigator.pushNamed(context, '/stack1'),
              ),
              RaisedButton(
                child: const Text('Go back'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


