import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Kelas yang dibuat sendiri
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '😇 Bantu Teman Anda 😇',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BantuTemanAnda()
    );
  }
}

class BantuTemanAnda extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tugas Anda'),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(child: Text('Permintaan')),
              Tab(child: Text('Sedang dilakukan')),
              Tab(child: Text('Selesai')),
              Tab(child: Text('Ditolak'))
            ],
          )
        ),
      body: TabBarView(
        children: <Widget>[
          Text('Text 1'),
          Text('Text 2'),
          Text('Text 3'),
          Text('Text 4'),
        ]
      )
      ),
    );
  }
}