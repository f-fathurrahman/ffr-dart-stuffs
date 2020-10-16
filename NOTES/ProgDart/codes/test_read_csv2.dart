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
    return 'Name = $nama, NIM = $NIM';
  }
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


}