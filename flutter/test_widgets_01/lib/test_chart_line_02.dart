/// Example of a simple line chart.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Plot',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Line/Area Charts'),
        ),
        backgroundColor: Colors.white,
        body: Container(
          width: 500,
          height: 400,
          child: SimpleLineChart.withSampleData(),
        ),
      ),
    );
  }
}

class SimpleLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleLineChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory SimpleLineChart.withSampleData() {
    return new SimpleLineChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(seriesList, animate: animate);
  }

  static List<charts.Series<Point, double>> _createSampleData() {
    List<Point> data = List<Point>();
    const double xi = 0.0;
    const double xf = 1.0;
    const double L = xf - xi;
    const int Ndata = 100;
    double deltax = (xf - xi)/(Ndata-1);
    for(int i = 0; i < Ndata; i++) {
      double x = xi + i*deltax;
      double y = math.cos(2*math.pi*x/L) * math.sin(4*math.pi*x/L);
      data.add(Point(x,y));
      print('x = $x, y = $y');
    }
    return [
      new charts.Series<Point, double>(
        id: 'ExamplePlot',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (Point p, _) => p.x,
        measureFn: (Point p, _) => p.y,
        data: data,
      )
    ];
  }
}

class Point {
  final double x;
  final double y;

  Point(this.x, this.y);
}
