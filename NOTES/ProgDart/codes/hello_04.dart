void main() {
  List<String> daftar_nama = [
    'Darto',
    'Parto',
    'Sule',
    'Andre',
    'Nunung'
  ];

  for(var nama in daftar_nama) {
    sayHello(nama);
  }
}

void sayHello(String name) {
  print('Hello $name');
}
