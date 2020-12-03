import 'package:flutter/material.dart';

class ExampleForm02Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contoh Form')),
      body: ExampleForm02(),
    );
  }
}

// Create a Form widget.
class ExampleForm02 extends StatefulWidget {
  @override
  ExampleForm02State createState() {
    return ExampleForm02State();
  }
}

class ExampleForm02State extends State<ExampleForm02> {

  final _formKey = GlobalKey<FormState>();
  String _nama = '';
  String _nim = ''; 
  final daftarNama = <String>[
    'Fadjar',
    'Fathurrahman',
  ];
  final daftarNim = <String>[
    'A180000',
    'A180001',
  ];

  @override
  Widget build(BuildContext context) {

    final _buttonSubmit = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        child: Text('Daftar'),
        onPressed: () {
          if(_formKey.currentState.validate()) {
            Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('Terimakasih data sedang diproses')));
            print('nama = $_nama');
            print('NIM  = $_nim');
          }
        },
      ),
    );

    final _inputNama = TextFormField(
      decoration: InputDecoration(
        labelText: 'Nama',
        hintText: 'Ketik nama Anda di sini',
      ),
      onChanged: (String inp) {
        setState( () {
          _nama = inp;
        });
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Bagian ini harus diisi';
        }
        print('validate nama, value = $value');
        final inArray = daftarNama.contains(value);
        print('inArray = $inArray');
        if(!inArray){
          return 'Nama tidak terdaftar';
        }
        return null;
      }
    );

    final _inputNim = TextFormField(
      decoration: InputDecoration(
        labelText: 'NIM',
        hintText: 'Ketik nama Anda di sini',
      ),
      onChanged: (String inp) {
        setState( () {
          _nim = inp;
        });
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Bagian ini harus diisi';
        }
        print('validate nim, value = $value');
        final inArray = daftarNim.contains(value);
        print('inArray = $inArray');
        if(!inArray){
          return 'nim tidak terdaftar';
        }
        int idxNama = daftarNama.indexOf(_nama);
        int idxNim = daftarNim.indexOf(_nim);
        print('idxNama = $idxNama');
        print('idxNim  = $idxNim');
        if(idxNama != idxNim) {
          return 'Nama dan NIM tidak sesuai';
        }
        return null;
      }
    );

    return Form(
      key: _formKey,
      //autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _inputNama,
          _inputNim,
          _buttonSubmit,
        ],
      ),
    );
  }
}