import 'package:flutter/material.dart';
//import 'TestDatetimePicker.dart';
//import 'TestDatePicker.dart';
//import 'test_listview_01.dart';
import 'fl_chart_line_chart_sample1.dart';
import 'fl_chart_line_chart_sample2.dart';

void main() {
  //runApp(MyApp());
  runApp(FLChartApp());
}

class LineChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff262545),
      child: ListView(
        children: <Widget>[
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 36.0,
                top: 24,
              ),
              child: Text(
                'Line Chart',
                style: TextStyle(
                    color: Color(
                      0xff6f6f97,
                    ),
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 28,
              right: 28,
            ),
            child: LineChartSample1(),
          ),
          const SizedBox(
            height: 22,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0, right: 28),
            child: LineChartSample2(),
          ),
        ],
      ),
    );
  }
}

class FLChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlChart Demo',
      showPerformanceOverlay: false,
      theme: ThemeData(
        primaryColor: const Color(0xff262545),
        primaryColorDark: const Color(0xff201f39),
        brightness: Brightness.dark,
      ),
      home: const FLChartPage(title: 'fl_chart'),
    );
  }
}

class FLChartPage extends StatefulWidget {
  const FLChartPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _FLChartPageState createState() => _FLChartPageState();
}


class _FLChartPageState extends State<FLChartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          children: <Widget>[
            LineChartPage(),
            //LineChartPage2(),
          ],
        ),
      ),
    );
  }
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: TestDatetimePicker(),
      //home: TestDatePicker(),
      //home: TestListView01(),
      home: LineChartPage(),
    );
  }
}

