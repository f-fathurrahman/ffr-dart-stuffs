import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'permintaan.dart';
import 'teman.dart';
import 'mock_values.dart';

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
      home: HalamanPermintaan(
        pendingAnswerFavors: mockPendingFavors,
        completedFfavors: mockCompletedFavors,
        refusedFavors: mockRefusedFavors,
        acceptedFavors: mockDoingFavors,
      )
    );
  }
}

class HalamanPermintaan extends StatelessWidget {
  
  // using mock values from mock_favors dart file for now
  final List<Permintaan> pendingAnswerFavors;
  final List<Permintaan> acceptedFavors;
  final List<Permintaan> completedFfavors;
  final List<Permintaan> refusedFavors;

  HalamanPermintaan({
    Key key,
    this.pendingAnswerFavors,
    this.acceptedFavors,
    this.completedFfavors,
    this.refusedFavors,
  }) : super(key: key);

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
          _daftarPermintaan("Pending Requests", pendingAnswerFavors),
          _daftarPermintaan("Doing", acceptedFavors),
          _daftarPermintaan("Completed", completedFfavors),
          _daftarPermintaan("Refused", refusedFavors),
        ]
      )
      ),
    );
  }

  Widget _daftarPermintaan(String judul, List<Permintaan> permintaan) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          child: Text(judul),
          padding: EdgeInsets.only(top: 16.0)
        ),
        Expanded(
          child: ListView.builder(
            itemCount: permintaan.length,
            itemBuilder: (BuildContext context, int index) {
              final p = permintaan[index];
              return Card(
                key: ValueKey(p.uuid),
                child: Padding(
                  child: Column(
                    children: <Widget>[
                      _itemHeader(p),
                      Text(p.deskripsi),
                      _itemFooter(p),
                    ],
                  ),
                  padding: EdgeInsets.all(8.0)
                ),
              );
            }
          ),
        ),
      ],
    );
  }

  Widget _itemFooter(Permintaan p) {
    if (p.sudahSelesai) {
      final format = DateFormat();
      return Container(
        margin: EdgeInsets.only(top: 8.0),
        alignment: Alignment.centerRight,
        child: Chip(
          label: Text("Completed at: ${format.format(p.tanggalSelesai)}"),
        ),
      );
    }
    if (p.sedangDiminta) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FlatButton(
            child: Text("Refuse"),
            onPressed: () {},
          ),
          FlatButton(
            child: Text("Do"),
            onPressed: () {},
          )
        ],
      );
    }
    if (p.sedangDilakukan) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FlatButton(
            child: Text("give up"),
            onPressed: () {},
          ),
          FlatButton(
            child: Text("complete"),
            onPressed: () {},
          )
        ],
      );
    }

    return Container();
  }

  Row _itemHeader(Permintaan p) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(
            p.teman.photoURL,
          ),
        ),
        Expanded(
          child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text("${p.teman.nama} meminta Anda untuk ... ")),
        )
      ],
    );
  } // _itemHeader

}