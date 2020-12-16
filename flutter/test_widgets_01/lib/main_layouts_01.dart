import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  //debugPaintSizeEnabled=true;
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Layouts",
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      routes: <String, WidgetBuilder>{
        '/': (BuildContext ctx) => LandingSceneDemo(),
        '/boxModel': (BuildContext ctx) => BoxModelDemo(),
        '/container': (BuildContext ctx) => ContainerDemo(),
        '/fittedBox': (BuildContext ctx) => FittedBoxDemo(),
        '/flexAndFlexible': (BuildContext ctx) => FlexAndFlexibleDemo(),
        '/gridViewExtent': (BuildContext ctx) => GridViewExtentDemo(),
        '/gridViewCount': (BuildContext ctx) => GridViewCountDemo(),
        '/infiniteHeight': (BuildContext ctx) => InfiniteHeightDemo(),
        '/intrinsicWidth': (BuildContext ctx) => IntrinsicWidthSetting(),
        '/rowsAndColumns': (BuildContext ctx) => RowsAndColumnsDemo(),
        '/mainAxisAlignment': (BuildContext ctx) => MainAxisAlignmentDemo(),
        '/snackBar': (BuildContext ctx) => SnackBarDemo(),
        '/spacersAndExpandeds': (BuildContext ctx) => SpacersAndExpandedsDemo(),
        '/listView': (BuildContext ctx) => ListViewDemo(),
        '/listViewWithListTile': (BuildContext ctx) => ListViewWithListTileDemo(),
        '/tables': (BuildContext ctx) => TablesDemo(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class ListViewDemo extends StatefulWidget {
  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  List<dynamic> _peopleList = List<dynamic>();

  void _getPeople() async {
    String peopleString = await DefaultAssetBundle.of(context)
        .loadString('assets/data/people.json');
    dynamic jsonData = json.decode(peopleString);
    if (mounted)
      setState(() {
        _peopleList = jsonData['results'];
      });
  }

  @override
  void initState() {
    super.initState();
    _getPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LayoutAppBar().toPreferredSizeWidget(context),
      drawer: LayoutDrawer(),
      body: _showPeople(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }

  String propercase(String input) {
    return input[0].toUpperCase() + input.substring(1).toLowerCase();
  }

  Widget _showPeople() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: _peopleList.length,
      itemBuilder: (BuildContext context, int i) {
        return PersonCard(_peopleList[i]);
      },
    );
  }
}


class ListViewWithListTileDemo extends StatefulWidget {
  @override
  _ListViewWithListTileDemoState createState() => _ListViewWithListTileDemoState();
}

class _ListViewWithListTileDemoState extends State<ListViewWithListTileDemo> {
  List<dynamic> _peopleList = List<dynamic>();

  void _getPeople() async {
    String peopleString = await DefaultAssetBundle.of(context)
        .loadString('assets/data/people.json');
    dynamic jsonData = json.decode(peopleString);
    if (mounted)
      setState(() {
        _peopleList = jsonData['results'];
      });
  }

  @override
  void initState() {
    super.initState();
    _getPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LayoutAppBar().toPreferredSizeWidget(context),
      drawer: LayoutDrawer(),
      body: _showPeople(),
    );
  }

  String propercase(String input) {
    return input[0].toUpperCase() + input.substring(1).toLowerCase();
  }

  Widget _showPeople() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: _peopleList.length,
      itemBuilder: (BuildContext context, int i) {
        String fullName =
            "${propercase(_peopleList[i]['name']['first'])} ${propercase(_peopleList[i]['name']['last'])}";
        String cell = _peopleList[i]['cell'];
        String email = _peopleList[i]['email'];
        return ListTile(
          subtitle: Column(
            children: <Widget>[Text('Email: $email'), Text('Cell: $cell')],
          ),
          leading: Image.network(_peopleList[i]['picture']['thumbnail']),
          // trailing:,
          title: Text(
            fullName,
          ),
        );
      },
    );
  }
}



class SpacersAndExpandeds extends StatelessWidget {
  final List<dynamic> peopleList;
  SpacersAndExpandeds({this.peopleList});

  @override
  Widget build(BuildContext context) {
    return Column(
      // Uncomment each of these lines to see the effect.
      // "start" is the default
      // mainAxisAlignment: MainAxisAlignment.end,
      // mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Row(
          children: <Widget>[
            Image.network(peopleList[0]["picture"]["large"]),
            Column(
              children: <Widget>[
                Text(
                    '${peopleList[0]["name"]["first"]} ${peopleList[0]["name"]["first"]}'),
                Text(peopleList[0]["location"]["street"]),
                Text(
                    '${peopleList[0]["location"]["city"]} ${peopleList[0]["location"]["state"]},  ${peopleList[0]["location"]["postcode"]}'),
                Text('Email: ${peopleList[0]["email"]}'),
                Text('Phone: ${peopleList[0]["cell"]}'),
              ],
            ),
          ],
        ),
        // Wrap this Row with an Expanded widget. You'll
        // see a space around it, taking up all the extra
        // space on the page. 
        Row(
          children: <Widget>[
            Image.network(peopleList[1]["picture"]["large"]),
            Column(
              children: <Widget>[
                Text(
                    '${peopleList[1]["name"]["first"]} ${peopleList[1]["name"]["first"]}'),
                Text(peopleList[1]["location"]["street"]),
                Text(
                    '${peopleList[1]["location"]["city"]} ${peopleList[1]["location"]["state"]},  ${peopleList[1]["location"]["postcode"]}'),
                Text('Email: ${peopleList[1]["email"]}'),
                Text('Phone: ${peopleList[1]["cell"]}'),
              ],
            ),
          ],
        ),
        // Uncomment the Spacer widget here and it will 
        // take up all the extra space. If you put more 
        // Spacers, each will apportion the available space
        // between them.
        // Spacer(),
        Row(
          children: <Widget>[
            Image.network(peopleList[2]["picture"]["large"]),
            Column(
              children: <Widget>[
                Text(
                    '${peopleList[2]["name"]["first"]} ${peopleList[2]["name"]["last"]}'),
                Text(peopleList[2]["location"]["street"]),
                Text(
                    '${peopleList[2]["location"]["city"]} ${peopleList[2]["location"]["state"]},  ${peopleList[2]["location"]["postcode"]}'),
                Text('Email: ${peopleList[2]["email"]}'),
                Text('Phone: ${peopleList[2]["cell"]}'),
              ],
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Image.network(peopleList[3]["picture"]["large"]),
            Column(
              children: <Widget>[
                Text(
                    '${peopleList[3]["name"]["first"]} ${peopleList[3]["name"]["last"]}'),
                Text(peopleList[3]["location"]["street"]),
                Text(
                    '${peopleList[3]["location"]["city"]} ${peopleList[3]["location"]["state"]},  ${peopleList[3]["location"]["postcode"]}'),
                Text('Email: ${peopleList[3]["email"]}'),
                Text('Phone: ${peopleList[3]["cell"]}'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class SpacersAndExpandedsDemo extends StatefulWidget {
  @override
  _SpacersAndExpandedsDemoState createState() =>
      _SpacersAndExpandedsDemoState();
}

class _SpacersAndExpandedsDemoState extends State<SpacersAndExpandedsDemo> {
  List<dynamic> _peopleList = List<dynamic>();

  void _getPeople() async {
    String peopleString = await DefaultAssetBundle.of(context)
        .loadString('assets/data/people.json');
    dynamic jsonData = json.decode(peopleString);
    if (mounted)
      setState(() {
        _peopleList = jsonData['results'];
      });
  }

  @override
  void initState() {
    super.initState();
    _getPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LayoutAppBar().toPreferredSizeWidget(context),
      drawer: LayoutDrawer(),
      body: SpacersAndExpandeds(peopleList: _peopleList),
    );
  }
}



class SnackBarAlert extends StatelessWidget {
  final List<dynamic> people;
  SnackBarAlert(this.people);

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 300.0,
      children: people
          .map<Widget>((dynamic person) => GestureDetector(
              child: PersonCard(person),
              onTap: () {
                String msg = '${person['name']['first']} deleted.';
                final SnackBar sb = SnackBar(
                  content: Text(msg),
                  duration: Duration(seconds: 55),
                  action: SnackBarAction(
                    textColor: Colors.white,
                    label: "UNDO",
                    onPressed: () {},
                  ),
                );
                Scaffold.of(context).showSnackBar(sb);
              }))
          .toList(),
    );
  }
}

class SnackBarDemo extends StatefulWidget {
  @override
  _SnackBarDemoState createState() => _SnackBarDemoState();
}

class _SnackBarDemoState extends State<SnackBarDemo> {
  List<dynamic> _peopleList = List<dynamic>();

  void _getPeople() async {
    String peopleString = await DefaultAssetBundle.of(context)
        .loadString('assets/data/people.json');
    dynamic jsonData = json.decode(peopleString);
    if (mounted)
      setState(() {
        _peopleList = jsonData['results'];
      });
  }

  @override
  void initState() {
    super.initState();
    _getPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LayoutAppBar().toPreferredSizeWidget(context),
      drawer: LayoutDrawer(),
      body: SnackBarAlert(_peopleList),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }

  String propercase(String input) {
    return input[0].toUpperCase() + input.substring(1).toLowerCase();
  }
}


/*
A playground for the Table widgets.
*/
class TablesDemo extends StatefulWidget {
  @override
  _TablesDemoState createState() => _TablesDemoState();
}

class _TablesDemoState extends State<TablesDemo> {
  List<dynamic> _peopleList = List<dynamic>();

  void _getPeople() async {
    String peopleString = await DefaultAssetBundle.of(context)
        .loadString('assets/data/people.json');
    dynamic jsonData = json.decode(peopleString);
    if (mounted)
      setState(() {
        _peopleList = jsonData['results'];
      });
  }

  @override
  void initState() {
    super.initState();
    _getPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LayoutAppBar().toPreferredSizeWidget(context),
      drawer: LayoutDrawer(),
      body: _showPeople(),
    );
  }

  String propercase(String input) {
    return input[0].toUpperCase() + input.substring(1).toLowerCase();
  }

  Widget _showPeople() {
    const TextStyle bold = TextStyle(fontWeight: FontWeight.bold);
return Table(
  children: <TableRow>[
        TableRow(children: <Widget>[
          Text('Salesperson', style: bold,),
          Text('January', style: bold,),
          Text('February', style: bold,),
          Text('March', style: bold,),
        ]
        ),
        TableRow(children: <Widget>[
          Text('Dwight'),
          Text('3742'),
          Text('5573'),
          Text('4323'),
        ],),
        TableRow(children: <Widget>[
          Text('Phyllis'),
          Text('3823'),
          Text('4500'),
          Text('3277'),
        ],
        ),
      ],
    );
  }

  Widget deleteMe() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: _peopleList.length,
      itemBuilder: (BuildContext context, int i) {
        String fullName =
            "${propercase(_peopleList[i]['name']['first'])} ${propercase(_peopleList[i]['name']['last'])}";
        String cell = _peopleList[i]['cell'];
        String email = _peopleList[i]['email'];
        return Container(
          padding: EdgeInsets.all(5.0), // Putting a padding around each 'card'
          child:  Row(
            children: <Widget>[
              Container(
                // width: 0,
                // height: 100,
                // color: Colors.orange,
                // alignment: Alignment.centerRight,
                // padding: EdgeInsets.all(20),
                // margin: EdgeInsets.all(10),
                margin: EdgeInsets.only(right: 10.0), // Add space to the right of the image
                child: Image.network(_peopleList[i]['picture']['thumbnail']),
              ),
              Column(
                children: <Widget>[
                  Text(fullName),
                  Text('Email: $email'),
                  Text('Cell: $cell')
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}


class RowsAndColumns extends StatelessWidget {
  final List<dynamic> peopleList;
  RowsAndColumns({this.peopleList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Image.network(peopleList[0]["picture"]["large"]),
            Column(
              children: <Widget>[
                Text(
                    '${peopleList[0]["name"]["first"]} ${peopleList[0]["name"]["first"]}'),
                Text(peopleList[0]["location"]["street"]),
                Text(
                    '${peopleList[0]["location"]["city"]} ${peopleList[0]["location"]["state"]},  ${peopleList[0]["location"]["postcode"]}'),
                Text('Email: ${peopleList[0]["email"]}'),
                Text('Phone: ${peopleList[0]["cell"]}'),
              ],
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Image.network(peopleList[1]["picture"]["large"]),
            Column(
              children: <Widget>[
                Text(
                    '${peopleList[1]["name"]["first"]} ${peopleList[1]["name"]["first"]}'),
                Text(peopleList[1]["location"]["street"]),
                Text(
                    '${peopleList[1]["location"]["city"]} ${peopleList[1]["location"]["state"]},  ${peopleList[1]["location"]["postcode"]}'),
                Text('Email: ${peopleList[1]["email"]}'),
                Text('Phone: ${peopleList[1]["cell"]}'),
              ],
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Image.network(peopleList[2]["picture"]["large"]),
            Column(
              children: <Widget>[
                Text(
                    '${peopleList[2]["name"]["first"]} ${peopleList[2]["name"]["last"]}'),
                Text(peopleList[2]["location"]["street"]),
                Text(
                    '${peopleList[2]["location"]["city"]} ${peopleList[2]["location"]["state"]},  ${peopleList[2]["location"]["postcode"]}'),
                Text('Email: ${peopleList[2]["email"]}'),
                Text('Phone: ${peopleList[2]["cell"]}'),
              ],
            ),
          ],
        ),
                Row(
          children: <Widget>[
            Image.network(peopleList[3]["picture"]["large"]),
            Column(
              children: <Widget>[
                Text(
                    '${peopleList[3]["name"]["first"]} ${peopleList[3]["name"]["last"]}'),
                Text(peopleList[3]["location"]["street"]),
                Text(
                    '${peopleList[3]["location"]["city"]} ${peopleList[3]["location"]["state"]},  ${peopleList[3]["location"]["postcode"]}'),
                Text('Email: ${peopleList[3]["email"]}'),
                Text('Phone: ${peopleList[3]["cell"]}'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class RowsAndColumnsDemo extends StatefulWidget {
  @override
  _RowsAndColumnsDemoState createState() => _RowsAndColumnsDemoState();
}

class _RowsAndColumnsDemoState extends State<RowsAndColumnsDemo> {
  List<dynamic> _peopleList = List<dynamic>();

  void _getPeople() async {
    String peopleString = await DefaultAssetBundle.of(context)
        .loadString('assets/data/people.json');
    dynamic jsonData = json.decode(peopleString);
    if (mounted)
      setState(() {
        _peopleList = jsonData['results'];
      });
  }

  @override
  void initState() {
    super.initState();
    _getPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LayoutAppBar().toPreferredSizeWidget(context),
      drawer: LayoutDrawer(),
      body: RowsAndColumns(peopleList: _peopleList),
    );
  }
}

class MainAxisAlignmentSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.tealAccent),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SubWidget(),
          Spacer(),
          Expanded(flex: 1, child: SubWidget()),
          Spacer(flex: 2),
          Expanded(flex: 3, child: SubWidget()),
          Expanded(flex: 2, child: SubWidget()),
          SubWidget(),
          SizedBox(
            width: 10,
          ),
          SubWidget(),
        ],
      ),
    );
  }
}

class SubWidget extends StatelessWidget {
  final double height;
  final double width;
  SubWidget({this.height = 25.0, this.width = 25.0});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black), color: Colors.teal),
      width: width,
      height: height,
      //margin: EdgeInsets.all(10),
      child: FittedBox(child: Icon(Icons.public)),
    );
  }
}

class MainAxisAlignmentDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LayoutAppBar().toPreferredSizeWidget(context),
      drawer: LayoutDrawer(),
      body: MainAxisAlignmentSetting(),
    );
  }
}


class LandingSceneDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LayoutAppBar().toPreferredSizeWidget(context),
      drawer: LayoutDrawer(),
    );
  }
}

class LayoutAppBar extends StatelessWidget {
  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      title: Text("My Cool App"),
    );
  }

  PreferredSizeWidget toPreferredSizeWidget(BuildContext context) {
    return build(context);
  }
}


class LayoutDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5.0,
      child: ListView(
        children: <Widget>[
          DrawerHeader(child: Text("Layout")),
          ListTile(
            title: const Text('SnackBar'),
            onTap: () {
              Navigator.pushNamed(context, '/snackBar');
            },
          ),
          ListTile(
            title: const Text('Infinite Height'),
            onTap: () {
              Navigator.pushNamed(context, '/infiniteHeight');
            },
          ),
          ListTile(
            title: const Text('FittedBox'),
            onTap: () {
              Navigator.pushNamed(context, '/fittedBox');
            },
          ),
          ListTile(
            title: const Text('Rows and Columns'),
            onTap: () {
              Navigator.pushNamed(context, '/rowsAndColumns');
            },
          ),
          ListTile(
            title: const Text('MainAxisAlignment'),
            onTap: () {
              Navigator.pushNamed(context, '/mainAxisAlignment');
            },
          ),
          ListTile(
            title: const Text('IntrinsicWidth'),
            onTap: () {
              Navigator.pushNamed(context, '/intrinsicWidth');
            },
          ),
          ListTile(
            title: const Text('Spacers and Expandeds'),
            onTap: () {
              Navigator.pushNamed(context, '/spacersAndExpandeds');
            },
          ),
          ListTile(
            title: const Text('Flex and Flexible'),
            onTap: () {
              Navigator.pushNamed(context, '/flexAndFlexible');
            },
          ),
          ListTile(
            title: const Text('ListView'),
            onTap: () {
              Navigator.pushNamed(context, '/listView');
            },
          ),
          ListTile(
            title: const Text('The Box Model'),
            onTap: () {
              Navigator.pushNamed(context, '/boxModel');
            },
          ),
          ListTile(
            title: const Text('Container'),
            onTap: () {
              Navigator.pushNamed(context, '/container');
            },
          ),
          ListTile(
            title: const Text('ListView with ListTile'),
            onTap: () {
              Navigator.pushNamed(context, '/listViewWithListTile');
            },
          ),
          ListTile(
            title: const Text('GridView - Extent'),
            onTap: () {
              Navigator.pushNamed(context, '/gridViewExtent');
            },
          ),
          ListTile(
            title: const Text('GridView - Count'),
            onTap: () {
              Navigator.pushNamed(context, '/gridViewCount');
            },
          ),
          ListTile(
            title: const Text('Tables'),
            onTap: () {
              Navigator.pushNamed(context, '/tables');
            },
          ),
        ],
      ),
    );
  }
}

/*
Demonstrates how to apply padding, margin, and borders
to Widgets using Container.
See Container.dart for alignment and positioning
*/
class BoxModelDemo extends StatefulWidget {
  @override
  _BoxModelDemoState createState() => _BoxModelDemoState();
}

class _BoxModelDemoState extends State<BoxModelDemo> {
  List<dynamic> _peopleList = List<dynamic>();

  void _getPeople() async {
    String peopleString = await DefaultAssetBundle.of(context)
        .loadString('assets/data/people.json');
    dynamic jsonData = json.decode(peopleString);
    if (mounted)
      setState(() {
        _peopleList = jsonData['results'];
      });
  }

  @override
  void initState() {
    super.initState();
    _getPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LayoutAppBar().toPreferredSizeWidget(context),
      drawer: LayoutDrawer(),
      body: _showPeople(),
    );
  }

  String propercase(String input) {
    return input[0].toUpperCase() + input.substring(1).toLowerCase();
  }

  Widget _showPeople() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: _peopleList.length,
      itemBuilder: (BuildContext context, int i) {
        String fullName =
            "${propercase(_peopleList[i]['name']['first'])} ${propercase(_peopleList[i]['name']['last'])}";
        String cell = _peopleList[i]['cell'];
        String email = _peopleList[i]['email'];
        return Container(
          padding: EdgeInsets.all(5.0), // Putting a padding around each 'card'
          child:  Row(
            children: <Widget>[
              Container(
                // width: 0,
                // height: 100,
                // color: Colors.orange,
                // alignment: Alignment.centerRight,
                // padding: EdgeInsets.all(20),
                // margin: EdgeInsets.all(10),
                margin: EdgeInsets.only(right: 10.0), // Add space to the right of the image
                child: Image.network(_peopleList[i]['picture']['thumbnail']),
              ),
              Column(
                children: <Widget>[
                  Text(fullName),
                  Text('Email: $email'),
                  Text('Cell: $cell')
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}


/* 
A playground for experimenting with a single container's
alignment, positioning, width, height, padding, margin, 
and border.
See BoxModel.dart for padding and margin in context with
other widgets.
*/
class ContainerSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration: BoxDecoration(color: Colors.purple[300]),
      color: Colors.purple,
      alignment: Alignment.centerLeft,
      child: Container(
        color: Colors.orange[300],
        child: Text("foo", style:TextStyle(fontSize: 50)),
        //height: 100, 
        //width: 200,
        //alignment: Alignment.bottomLeft,
        //margin: EdgeInsets.only(top:20, bottom:20, left:30, right:100),
      ),
    );
  }
}

class ContainerDemo extends StatefulWidget {
  @override
  _ContainerDemoState createState() => _ContainerDemoState();
}

class _ContainerDemoState extends State<ContainerDemo> {
  List<dynamic> _peopleList = List<dynamic>();

  void _getPeople() async {
    String peopleString = await DefaultAssetBundle.of(context)
        .loadString('assets/data/people.json');
    dynamic jsonData = json.decode(peopleString);
    if (mounted)
      setState(() {
        _peopleList = jsonData['results'];
      });
  }

  @override
  void initState() {
    super.initState();
    _getPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LayoutAppBar().toPreferredSizeWidget(context),
      drawer: LayoutDrawer(),
      body: ContainerSetting(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}


class FittedBoxScaling extends StatelessWidget {
  final List<dynamic> peopleList;
  FittedBoxScaling({this.peopleList});

  @override
  Widget build(BuildContext context) {
    const String _imgSrc = 'https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png';

    return Column(
      children: <Widget>[
        Container(height: 100, width: 400, decoration: BoxDecoration(color: Colors.red), child: Text('SizedBox'),),
        Image.network(_imgSrc, width: 400,),
      ],
    );
  }
}

class FittedBoxDemo extends StatefulWidget {
  @override
  _FittedBoxDemoState createState() => _FittedBoxDemoState();
}

class _FittedBoxDemoState extends State<FittedBoxDemo> {
  List<dynamic> _peopleList = List<dynamic>();

  void _getPeople() async {
    String peopleString = await DefaultAssetBundle.of(context)
        .loadString('assets/data/people.json');
    dynamic jsonData = json.decode(peopleString);
    if (mounted)
      setState(() {
        _peopleList = jsonData['results'];
      });
  }

  @override
  void initState() {
    super.initState();
    _getPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LayoutAppBar().toPreferredSizeWidget(context),
      drawer: LayoutDrawer(),
      body: FittedBoxScaling(peopleList: _peopleList),
    );
  }
}

class FlexAndFlexible extends StatelessWidget {
  final List<dynamic> peopleList;
  FlexAndFlexible({this.peopleList});

  @override
  Widget build(BuildContext context) {
    return Column(
      // Uncomment each of these lines to see the effect.
      // "start" is the default
      // mainAxisAlignment: MainAxisAlignment.end,
      // mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Row(
          children: <Widget>[
            Image.network(peopleList[0]["picture"]["large"]),
            Column(
              children: <Widget>[
                Text(
                    '${peopleList[0]["name"]["first"]} ${peopleList[0]["name"]["first"]}'),
                Text(peopleList[0]["location"]["street"]),
                Text(
                    '${peopleList[0]["location"]["city"]} ${peopleList[0]["location"]["state"]},  ${peopleList[0]["location"]["postcode"]}'),
                Text('Email: ${peopleList[0]["email"]}'),
                Text('Phone: ${peopleList[0]["cell"]}'),
              ],
            ),
          ],
        ),
        // Wrap this Row with an Expanded widget. You'll
        // see a space around it, taking up all the extra
        // space on the page. 
        Row(
          children: <Widget>[
            Image.network(peopleList[1]["picture"]["large"]),
            Column(
              children: <Widget>[
                Text(
                    '${peopleList[1]["name"]["first"]} ${peopleList[1]["name"]["first"]}'),
                Text(peopleList[1]["location"]["street"]),
                Text(
                    '${peopleList[1]["location"]["city"]} ${peopleList[1]["location"]["state"]},  ${peopleList[1]["location"]["postcode"]}'),
                Text('Email: ${peopleList[1]["email"]}'),
                Text('Phone: ${peopleList[1]["cell"]}'),
              ],
            ),
          ],
        ),
        // Uncomment the Spacer widget here and it will 
        // take up all the extra space. If you put more 
        // Spacers, each will apportion the available space
        // between them.
        // Spacer(),
        Row(
          children: <Widget>[
            Image.network(peopleList[2]["picture"]["large"]),
            Column(
              children: <Widget>[
                Text(
                    '${peopleList[2]["name"]["first"]} ${peopleList[2]["name"]["last"]}'),
                Text(peopleList[2]["location"]["street"]),
                Text(
                    '${peopleList[2]["location"]["city"]} ${peopleList[2]["location"]["state"]},  ${peopleList[2]["location"]["postcode"]}'),
                Text('Email: ${peopleList[2]["email"]}'),
                Text('Phone: ${peopleList[2]["cell"]}'),
              ],
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Image.network(peopleList[3]["picture"]["large"]),
            Column(
              children: <Widget>[
                Text(
                    '${peopleList[3]["name"]["first"]} ${peopleList[3]["name"]["last"]}'),
                Text(peopleList[3]["location"]["street"]),
                Text(
                    '${peopleList[3]["location"]["city"]} ${peopleList[3]["location"]["state"]},  ${peopleList[3]["location"]["postcode"]}'),
                Text('Email: ${peopleList[3]["email"]}'),
                Text('Phone: ${peopleList[3]["cell"]}'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class FlexAndFlexibleDemo extends StatefulWidget {
  @override
  _FlexAndFlexibleDemoState createState() =>
      _FlexAndFlexibleDemoState();
}

class _FlexAndFlexibleDemoState extends State<FlexAndFlexibleDemo> {
  List<dynamic> _peopleList = List<dynamic>();

  void _getPeople() async {
    String peopleString = await DefaultAssetBundle.of(context)
        .loadString('assets/data/people.json');
    dynamic jsonData = json.decode(peopleString);
    if (mounted)
      setState(() {
        _peopleList = jsonData['results'];
      });
  }

  @override
  void initState() {
    super.initState();
    _getPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LayoutAppBar().toPreferredSizeWidget(context),
      drawer: LayoutDrawer(),
      body: FlexAndFlexible(peopleList: _peopleList),
    );
  }
}

class GridViewExtent extends StatelessWidget {
  final List<dynamic> people;
  GridViewExtent(this.people);

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 300.0,
      children:
          people.map<Widget>((dynamic person) => PersonCard(person)).toList(),
    );
  }
}

class GridViewExtentDemo extends StatefulWidget {
  @override
  _GridViewExtentDemoState createState() => _GridViewExtentDemoState();
}

class _GridViewExtentDemoState extends State<GridViewExtentDemo> {
  List<dynamic> _peopleList = List<dynamic>();

  void _getPeople() async {
    String peopleString = await DefaultAssetBundle.of(context)
        .loadString('assets/data/people.json');
    dynamic jsonData = json.decode(peopleString);
    if (mounted)
      setState(() {
        _peopleList = jsonData['results'];
      });
  }

  @override
  void initState() {
    super.initState();
    _getPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LayoutAppBar().toPreferredSizeWidget(context),
      drawer: LayoutDrawer(),
      body: GridViewExtent(_peopleList),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }

  String propercase(String input) {
    return input[0].toUpperCase() + input.substring(1).toLowerCase();
  }
}

class PersonCard extends StatelessWidget {
  final dynamic person;
  PersonCard(this.person);
  @override
  Widget build(BuildContext context) {
    String fullName =
        "${propercase(person['name']['first'])} ${propercase(person['name']['last'])}";
    String cell = person['cell'];
    String email = person['email'];
    return Container(
      //decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.all(Radius.circular(5.0))),
      margin: const EdgeInsets.only(top: 4.0),
      child: Stack(
        children: <Widget>[
          Image.network(
            person['picture']['large'],
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.0, -2.0),
                    end: Alignment(0.0, 1.0),
                    colors: <Color>[
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(50, 0, 0, 0)
                    ],
                  ),
                ),
                child: Text(fullName,
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: Theme.of(context).textTheme.title.fontStyle,
                    )),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.0, -2.0),
                    end: Alignment(0.0, 1.0),
                    colors: <Color>[
                      Color.fromARGB(50, 0, 0, 0),
                      Color.fromARGB(200, 0, 0, 0)
                    ],
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Text('Email: $email',
                        style: TextStyle(color: Colors.white)),
                    Text('Cell: $cell', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String propercase(String input) {
    return input[0].toUpperCase() + input.substring(1).toLowerCase();
  }
}


class GridViewCount extends StatelessWidget {
  final List<dynamic> people;
  GridViewCount(this.people);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children:
          people.map<Widget>((dynamic person) => PersonCard(person)).toList(),
    );
  }
}

class GridViewCountDemo extends StatefulWidget {
  @override
  _GridViewCountDemoState createState() => _GridViewCountDemoState();
}

class _GridViewCountDemoState extends State<GridViewCountDemo> {
  List<dynamic> _peopleList = List<dynamic>();

  void _getPeople() async {
    String peopleString = await DefaultAssetBundle.of(context)
        .loadString('assets/data/people.json');
    dynamic jsonData = json.decode(peopleString);
    if (mounted)
      setState(() {
        _peopleList = jsonData['results'];
      });
  }

  @override
  void initState() {
    super.initState();
    _getPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LayoutAppBar().toPreferredSizeWidget(context),
      drawer: LayoutDrawer(),
      body: GridViewCount(_peopleList),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }

  String propercase(String input) {
    return input[0].toUpperCase() + input.substring(1).toLowerCase();
  }
}


class IntrinsicWidthSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.yellowAccent,
                border: Border.all(color: Colors.black)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                RaisedButton(
                  child: Text("A"),
                  onPressed: () {},
                ),
                RaisedButton(
                  child: Text("B"),
                  onPressed: () {},
                ),
                RaisedButton(
                  child: Text("This is a super-long button"),
                  onPressed: () {},
                ),
                RaisedButton(
                  child: Text("D"),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.pinkAccent,
                border: Border.all(color: Colors.black)),
            child: IntrinsicWidth(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  RaisedButton(
                    child: Text("A"),
                    onPressed: () {},
                  ),
                  RaisedButton(
                    child: Text("B"),
                    onPressed: () {},
                  ),
                  RaisedButton(
                    child: Text("This is a long button"),
                    onPressed: () {},
                  ),
                  RaisedButton(
                    child: Text("D"),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                border: Border.all(color: Colors.black)),
            child: IntrinsicWidth(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  RaisedButton(
                    child: Text("A"),
                    onPressed: () {},
                  ),
                  RaisedButton(
                    child: Text("B"),
                    onPressed: () {},
                  ),
                  RaisedButton(
                    child: Text("This is a super-long button"),
                    onPressed: () {},
                  ),
                  RaisedButton(
                    child: Text("D"),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class InfiniteHeightDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("One"),
        Text("Two"),
        // If you uncomment, the next line you get the dreaded "unbounded height" error.
        //ListView(children: <Widget>[Text("2.25"),Text("2.5"),Text("2.75")],),
        // To fix it, you can wrap the ListView in an Expanded.
        Text("Three"),
        Text("Four"),
      ],
    );
  }
}

class InfiniteHeightScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LayoutAppBar().toPreferredSizeWidget(context),
      drawer: LayoutDrawer(),
      body: InfiniteHeightDemo(),
    );
  }
}






