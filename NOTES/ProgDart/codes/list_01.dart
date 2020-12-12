import 'dart:math';
import 'dart:io';

void main() {
  List<double> temperatur = [];
  List<DateTime> waktuPengukuran = [];
  
  Random random = new Random();
  const Duration periode = Duration(seconds: 1);
  for(var i = 0; i < 10; i++) {
    waktuPengukuran.add(DateTime.now());
    temperatur.add(30.0 + random.nextDouble());
    sleep(periode);
  }
  for(var i = 0; i < 10; i++) {
    // Silakan tambahkan hari, bulan, dan tahun
    var h = waktuPengukuran[i].hour;
    var m = waktuPengukuran[i].minute;
    var s = waktuPengukuran[i].second;
    var t = temperatur[i].toStringAsPrecision(5); // supaya tidak terlalu panjang
    print("$h:$m:$s,$t");
  }
}