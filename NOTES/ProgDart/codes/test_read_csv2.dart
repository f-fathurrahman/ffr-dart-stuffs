import 'dart:io';
import 'dart:convert';

class Mahasiswa {
  String nama;
  String NIM;
  double uts;
  double uas;
  double praktikum;

  Mahasiswa(this.nama, this.NIM, this.uts, this.uas, this.praktikum);

  String toString() {
    return 'Name = $nama\nNIM = $NIM';
  }

  double hitungNilaiAkhir() {
    return 0.3*uts + 0.3*uas + 0.4*praktikum;
  }
}

String konversiNilai(double na) {
  if(na <= 100 && na > 80) {
    return "A";
  }
  // ...
}

void main() {
  List<Mahasiswa> tabelMahasiswa = List<Mahasiswa>();

  var filePath = 'NilaiMahasiswa.csv';
  var lines = File(filePath).readAsStringSync().split('\n');
  for(var l in lines) {
    var ll = l.split(',');
    var nama = ll[0];
    var nim = ll[1];
    var uts = double.parse(ll[2]);
    var uas = double.parse(ll[3]);
    var praktikum = double.parse(ll[4]);
    tabelMahasiswa.add(Mahasiswa(nama, nim, uts, uas, praktikum));
  }
  print(tabelMahasiswa);

  for(var m in tabelMahasiswa){
    var nilai_akhir = m.hitungNilaiAkhir();
    print(m);
    print('Nilai akhir = $nilai_akhir');
    // konversi dari nilai angka ke huruf.
  }

  var file = new File('new_data.csv');
  var sink = file.openWrite();
  for(var m in tabelMahasiswa) {
    var nama = m.nama;
    var nim = m.NIM;
    var uts = m.uts;
    var uas = m.uas;
    var prak = m.praktikum;
    var nilai_akhir = m.hitungNilaiAkhir();
    //sink.write('${nama},${nim},${nilai_akhir}\n');
    sink.writeln('${nama},${nim},${nilai_akhir}');
  } 
  sink.close();

}