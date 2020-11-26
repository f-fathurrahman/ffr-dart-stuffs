import 'package:flutter/material.dart';

class ExampleInput01 extends StatefulWidget {
  ExampleInput01({Key key}) : super(key: key);

  @override
  _ExampleInput01State createState() => _ExampleInput01State();
}

enum NilaiKepuasan { 
  baik,
  jelek,
  biasa,
}

class _ExampleInput01State extends State<ExampleInput01> {
  
  final _inpNamaCtrl = TextEditingController();
  final _inpAlamatCtrl = TextEditingController();
  String _nama = '';
  String _alamat = '';
  bool _setuju = false;
  NilaiKepuasan _nilaiKepuasan = NilaiKepuasan.baik;
  double _nilaiSlider = 0;

  void dispose() {
    _inpNamaCtrl.dispose();
    _inpAlamatCtrl.dispose();
    super.dispose();
  } // dispose

  void _handleSetNama(String inpstr) {
    setState( () {
      _nama = inpstr;
    });
  }

  void _handleSetAlamat(String inpstr) {
    setState( () {
      _alamat = inpstr;
    });
  }

  void _handleSetuju(bool val) {
    setState( () {
      _setuju = val;
    });
  }

  Widget build(BuildContext context) {
  
    final txtJudulIsian = Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      child: Text(
        'Masukkan Input',
        style: TextStyle(fontSize: 20,)
      ),
    );

    final inpNama = Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(6),
      child: TextField(
        controller: _inpNamaCtrl,
        decoration: InputDecoration(
          labelText: 'Nama',
          hintText: 'Ketik nama Anda di sini',
        ),
        onChanged: _handleSetNama,
      )
    );

    final inpAlamat = Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(6),
      child: TextField(
        controller: _inpAlamatCtrl,
        decoration: InputDecoration(
          labelText: 'Alamat',
          hintText: 'Ketik alamat Anda di sini',
        ),
        onChanged: _handleSetAlamat,
      )
    );


    final txtJudulOutput = Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      child: Text(
        'Anda memasukkan input berikut:',
        style: TextStyle(fontSize: 20,)
      ),
    );

    final div1 = Divider(
      height: 40,
      thickness: 5,
      color: Colors.blueGrey,
      indent: 10,
      endIndent: 10,
    );

    final outNama = Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(10),
      child: Text(
        'Anda memasukkan nama: $_nama',
        style: TextStyle(fontSize: 15,)
      ),
    );

    final outAlamat = Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(10),
      child: Text(
        'Anda memasukkan alamat: $_alamat',
        style: TextStyle(fontSize: 15,)
      ),
    );


    final chkbox1 = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: _setuju,
          onChanged: _handleSetuju,
        ),
        Text('Setuju'),
      ],
    );

    final radioPuasBaik = ListTile(
      title: Text('Baik'), 
      leading: Radio(
        groupValue: _nilaiKepuasan,
        value: NilaiKepuasan.baik,
        onChanged: (NilaiKepuasan val) {
          setState( () {
            _nilaiKepuasan = val;
          });
        },
      ),
    );

    final radioPuasJelek = ListTile(
      title: Text('Jelek'), 
      leading: Radio(
        groupValue: _nilaiKepuasan,
        value: NilaiKepuasan.jelek,
        onChanged: (NilaiKepuasan val) {
          setState( () {
            _nilaiKepuasan = val;
          });
        },
      ),
    );

    final radioPuasBiasa = ListTile(
      title: Text('Biasa'), 
      leading: Radio(
        groupValue: _nilaiKepuasan,
        value: NilaiKepuasan.biasa,
        onChanged: (NilaiKepuasan val) {
          setState( () {
            _nilaiKepuasan = val;
          });
        },
      ),
    );

    final sliderNilai = Slider(
      label: _nilaiSlider.toString(),
      min: 0, max: 100,
      divisions: 100,
      value: _nilaiSlider,
      onChanged: (double val) {
        setState( () {
          _nilaiSlider = val;
        });
      }
    );

    final db1 = DropdownButton<NilaiKepuasan>(
      value: _nilaiKepuasan,
      items: const <DropdownMenuItem<NilaiKepuasan>>[
        DropdownMenuItem<NilaiKepuasan>(
          child: Text('Baik'),
          value: NilaiKepuasan.baik,
        ),
        DropdownMenuItem<NilaiKepuasan>(
          child: Text('Jelek'),
          value: NilaiKepuasan.jelek,
        ),
        DropdownMenuItem<NilaiKepuasan>(
          child: Text('Biasa'),
          value: NilaiKepuasan.biasa,
        ),
      ],
      onChanged: (NilaiKepuasan val) {
        setState( () {
          _nilaiKepuasan = val;
        });
      },
    );

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          db1,
          Text('Nilai kepuasan: $_nilaiKepuasan'),
          //sliderNilai,
          //Text('Nilai: $_nilaiSlider'),
          //Text('Kepuasan Anda: '),
          //radioPuasBaik,
          //radioPuasJelek,
          //radioPuasBiasa,
          //chkbox1,
          //div1,
          //txtJudulIsian,
          //inpNama,
          //inpAlamat,
          //div1,
          //txtJudulOutput,
          //outNama,
          //outAlamat,
        ],
      )
    );
  }
}