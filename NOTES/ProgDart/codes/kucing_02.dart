class Kucing {
  String nama;
  String warna;
  int umur;

  Kucing(this.nama, this.warna, this.umur);
}

void sayHello(Kucing k) {
  print('Miaw, namaku adalah ${k.nama}');
}

void main() {
  Kucing kucingku = Kucing('Ronaldo', 'hitam', 1);
  sayHello(kucingku);
}