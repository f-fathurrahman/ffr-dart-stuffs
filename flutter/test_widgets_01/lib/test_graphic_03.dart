import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart' as graphic;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test graphic',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LinePlotPage(),
    );
  }
}

const plotData = [
  {"x" : 0.0, "y" : 100},
  {"x" : 0.1, "y" : 132},
  {"x" : 0.2, "y" : 101},
  {"x" : 0.3, "y" : 134},
  {"x" : 0.4, "y" : 400},
  {"x" : 0.5, "y" : 230},
  {"x" : 0.6, "y" : 210},
];

class LinePlotPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Line/Area Charts'),
      ),
      backgroundColor: Colors.white,
      body: Container(
        width: 500,
        height: 400,
        child: graphic.Chart(
          data: plotData,
          scales: {
            'x': graphic.CatScale(
              accessor: (map) => map[''].toString(),
              range: [0, 1],
            ),
            'y': graphic.LinearScale(
              accessor: (map) => map['y'] as num,
              nice: true,
            ),
          },
          geoms: [
            graphic.LineGeom(
              position: graphic.PositionAttr(field: 'y'),
              shape: graphic.ShapeAttr(
                  values: [graphic.BasicLineShape(smooth: true)]),
            )
          ],
          axes: {
            'x': graphic.Defaults.horizontalAxis,
            'y': graphic.Defaults.verticalAxis,
          },
        ),
      ),
    );
  }
}
