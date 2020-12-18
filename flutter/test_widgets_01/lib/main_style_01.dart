import 'package:flutter/material.dart';
import 'dart:math';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Ch 8 - Styling Text',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (BuildContext ctx) => LandingScene(),
          '/contrast': (BuildContext ctx) => HelloWorld(),
          '/colors': (BuildContext ctx) => ColorsApplied(),
          '/fonts': (BuildContext ctx) => CustomFonts(),
          '/decorations': (BuildContext ctx) => Decorations(),
          '/cards': (BuildContext ctx) => Stacks(),
          '/themes': (BuildContext ctx) => Themes(),
        });
  }
}

class LandingScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test Styling')),
      body: Container(
        child: GridView.extent(
          maxCrossAxisExtent: 300,
          children: <Widget>[
            CustomButton(
                text: 'Contrast',
                iconData: Icons.compare,
                action: () => Navigator.pushNamed(context, '/contrast')),
            CustomButton(
                text: 'Colors',
                iconData: Icons.color_lens,
                action: () => Navigator.pushNamed(context, '/colors')),
            CustomButton(
                text: 'Fonts',
                iconData: Icons.font_download,
                action: () => Navigator.pushNamed(context, '/fonts')),
            CustomButton(
                text: 'Decorations',
                iconData: Icons.style,
                action: () => Navigator.pushNamed(context, '/decorations')),
            CustomButton(
                text: 'Stacks',
                iconData: Icons.picture_in_picture,
                action: () => Navigator.pushNamed(context, '/cards')),
            CustomButton(
                text: 'Theme',
                iconData: Icons.devices_other,
                action: () => Navigator.pushNamed(context, '/themes')),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final Function action;
  CustomButton({@required this.text, @required this.iconData, this.action});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: action,
        child: Column(
          children: <Widget>[
            Icon(
              iconData,
              color: Theme.of(context).primaryColorDark,
              size: 100.0,
            ),
            Text(text),
          ],
        ),
      ),
      decoration: BoxDecoration(
          border:
              Border.all(color: Theme.of(context).primaryColorDark, width: 5.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Theme.of(context).primaryColorLight),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
    );
  }
}

class HelloWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Hello world",
          style: TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.lineThrough,
            fontFamily: "Courier",
            fontSize: 34.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class ColorsApplied extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text('Ch 8 - Colors')),
          body: Container(

          child: Stack(
        children: <Widget>[
          ColorBlocks(),
          Center(
            child: Container(
              alignment: Alignment.center,
              width: 100,
              height: 100,
              child: Text(
                'Colors!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(
                    color: Colors.yellow,
                    width: 5,
                  )),
            ),
          ),
        ],
      ),
    ),);
  }
}

class ColorBlocks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 200.0,
      children: _randomColors(24),
    );
  }

  List<Widget> _randomColors(int numBlocks) {
    Random rnd = Random();
    return List.generate(
        numBlocks,
        (int i) => Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(
                    rnd.nextInt(255), rnd.nextInt(255), rnd.nextInt(255), 1.0),
              ),
              // child: CustomPaint(
              //   size: Size(200, 200),
              //   painter: SupermanShieldPainter(),
              // ),
            ));
  }
}

class SupermanShield extends StatelessWidget {
  const SupermanShield({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(200, 200),
      painter: SupermanShieldPainter(),
    );
  }
}

class SupermanShieldPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(
        Path()
          ..moveTo(25, 0)
          ..lineTo(125, 0)
          ..lineTo(150, 25)
          ..lineTo(75, 125)
          ..lineTo(0, 25)
          ..lineTo(25, 0),
        Paint()
          ..style = PaintingStyle.fill
          ..color = Colors.red);
  }

  @override
  bool shouldRepaint(SupermanShieldPainter oldDelegate) => false;
}

class CustomFonts extends StatefulWidget {
  CustomFonts();

  @override
  _CustomFontsState createState() => _CustomFontsState();
}

class _CustomFontsState extends State<CustomFonts> {
  List<String> loremIpsums;
  bool loading = false;

  @override
  void initState() {
    getLoremIpsums(numberToFetch: 4).then((lorems) {
      loremIpsums = lorems;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Theme.of(context).textTheme.apply(fontSizeDelta: 4.0);
    print(loremIpsums);
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: loading ? <Widget>[SizedBox()]: <Widget>[
              Text(loremIpsums[0]),  // Unstyled
              Text(loremIpsums[1], style: TextStyle(fontFamily: "Courier"),),
              Text(loremIpsums[2], style: TextStyle(fontFamily: 'NanumBrushScript'),),
              Text(loremIpsums[3], style: TextStyle(fontFamily: 'MrDafoe'),),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<String>> getLoremIpsums({@required int numberToFetch}) async {
    setState(() {
      loading = true;
    });
    String _url = Uri.encodeFull(
        "https://loripsum.net/api/$numberToFetch/short/plaintext");
    try {
      http.Response response = await http.get(_url, headers: <String, String>{
        'Accept': 'text/plain',
      });
      return response.body.split('\n\n');
    } catch (e) {
      print('Error in getting Lorem Ipsums: $e');
      rethrow;
    } finally {
      if (mounted) setState(() {
        loading = false;
      });
    }
  }
}

class Themes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
        child: ListView(
          children: <Widget>[
            Text('body1', style: Theme.of(context).textTheme.body1),
            Text('body2', style: Theme.of(context).textTheme.body2),
            Text('button', style: Theme.of(context).textTheme.button),
            Text('caption', style: Theme.of(context).textTheme.caption),
            Text('headline4', style: Theme.of(context).textTheme.headline4),
            Text('headline3', style: Theme.of(context).textTheme.headline3),
            Text('headline2', style: Theme.of(context).textTheme.headline2),
            Text('headline1', style: Theme.of(context).textTheme.headline1),
            Text('headline5', style: Theme.of(context).textTheme.headline5),
            Text('overline', style: Theme.of(context).textTheme.overline),
            Text('subtitle1', style: Theme.of(context).textTheme.subtitle1),
            Text('subtitle2', style: Theme.of(context).textTheme.subtitle2),
            Text('headline6', style: Theme.of(context).textTheme.headline6),
          ],
        ),
      ),
    );
  }
}

class Stacks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ch 8 - Stacks')),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(40),
            height: 300,
            width: 300,
child: 
Card(
  elevation: 20.0,
  child: Stack(
    children: <Widget>[
      Image.asset("6.jpg", width: 400, fit: BoxFit.cover),
      Positioned(
        top: 10,
        left: 10,
        child: Text(
          "Sandeep Patel",
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(color: Colors.white),
        ),
      ),
      Positioned(
        bottom: 30,
        right: 10,
        child: Text("Email: s.patel@us.com",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: Colors.white)),
      ),
      Positioned(
        bottom: 10,
        right: 10,
        child: Text("Phone: +1 (555) 786-3512",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: Colors.white)),
      ),
      Positioned(
        bottom: 0,
        left: 0,
        height: 100,
        width: 100,
        child: FlutterLogo(),
      )
    ],
  ),
),
          ),
          Container(
            margin: EdgeInsets.all(40),
            height: 300,
            width: 300,
            child: Card(
              child: Stack(
                children: <Widget>[
                  Image.asset("6.jpg"),
                  Column(
                    children: <Widget>[
                      Text(
                        "Sandeep Patel",
                        style: Theme.of(context)
                            .textTheme
                            .display1
                            .copyWith(color: Colors.white),
                      ),
                      Expanded(child: Container()),
                      Text("Email: s.patel@us.com",
                          style: Theme.of(context)
                              .textTheme
                              .body2
                              .copyWith(color: Colors.white)),
                      Text("Phone: +1 (555) 786-3512",
                          style: Theme.of(context)
                              .textTheme
                              .body2
                              .copyWith(color: Colors.white)),
                    ],
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

class Decorations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
        child: Center(
          child: Container(
            child: Icon(
              Icons.exit_to_app,
              size: 200,
              color: Theme.of(context).iconTheme.color,
            ),
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
              border: Border.all(
                width: 10,
                color: Theme.of(context).iconTheme.color,
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset.fromDirection(0.25 * pi, 10.0),
                  blurRadius: 10.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


