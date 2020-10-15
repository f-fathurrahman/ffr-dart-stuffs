class Kucing {
  String nama;
  String warna;
  int umur;
}

void sayHello(Kucing k) {
  print('Miaw, namaku adalah ${k.nama}');
}

void main() {
  Kucing kucingku = Kucing();
  kucingku.nama = 'Ronaldo';
  kucingku.warna = 'hitam';
  kucingku.umur = 1;

  sayHello(kucingku);
}