/// Example of a simple line chart.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test graphic',
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

  /// Create one series with sample hard coded data.
  static List<charts.Series<Point, double>> _createSampleData() {
    final data = [
      new Point(0.1, 5.0),
      new Point(1.1, 25.0),
      new Point(2.1, 100.0),
      new Point(3.1, 75.0),
    ];

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
