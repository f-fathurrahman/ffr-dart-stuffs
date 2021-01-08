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
      home: LineAreaPage(),
    );
  }
}

const adjustData = [
  {"type":"Email","index":0,"value":500},
  {"type":"Email","index":1,"value":132},
  {"type":"Email","index":2,"value":101},
  {"type":"Email","index":3,"value":134},
  {"type":"Email","index":4,"value":90},
  {"type":"Email","index":5,"value":230},
  {"type":"Email","index":6,"value":210},
  {"type":"Affiliate","index":0,"value":220},
  {"type":"Affiliate","index":1,"value":182},
  {"type":"Affiliate","index":2,"value":191},
  {"type":"Affiliate","index":3,"value":234},
  {"type":"Affiliate","index":4,"value":290},
  {"type":"Affiliate","index":5,"value":330},
  {"type":"Affiliate","index":6,"value":310},
  {"type":"Video","index":0,"value":150},
  {"type":"Video","index":1,"value":232},
  {"type":"Video","index":2,"value":201},
  {"type":"Video","index":3,"value":154},
  {"type":"Video","index":4,"value":190},
  {"type":"Video","index":5,"value":330},
  {"type":"Video","index":6,"value":410},
  {"type":"Direct","index":0,"value":320},
  {"type":"Direct","index":1,"value":332},
  {"type":"Direct","index":2,"value":301},
  {"type":"Direct","index":3,"value":334},
  {"type":"Direct","index":4,"value":390},
  {"type":"Direct","index":5,"value":330},
  {"type":"Direct","index":6,"value":320},
  {"type":"Search","index":0,"value":320},
  {"type":"Search","index":1,"value":432},
  {"type":"Search","index":2,"value":401},
  {"type":"Search","index":3,"value":434},
  {"type":"Search","index":4,"value":390},
  {"type":"Search","index":5,"value":430},
  {"type":"Search","index":6,"value":420},
];

class LineAreaPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Line/Area Charts'),
      ),
      backgroundColor: Colors.white,
      body: Container(
        width: 500,
        height: 400,
        child: graphic.Chart(
          data: adjustData,
          scales: {
            'index': graphic.CatScale(
              accessor: (map) => map['index'].toString(),
              range: [0, 1],
            ),
            'type': graphic.CatScale(
              accessor: (map) => map['type'] as String,
            ),
            'value': graphic.LinearScale(
              accessor: (map) => map['value'] as num,
              nice: true,
            ),
          },
          geoms: [
            graphic.LineGeom(
              position: graphic.PositionAttr(field: 'index*value'),
              color: graphic.ColorAttr(field: 'type'),
              shape: graphic.ShapeAttr(
                  values: [graphic.BasicLineShape(smooth: true)]),
            )
          ],
          axes: {
            'index': graphic.Defaults.horizontalAxis,
            'value': graphic.Defaults.verticalAxis,
          },
        ),
      ),
    );
  }
}
