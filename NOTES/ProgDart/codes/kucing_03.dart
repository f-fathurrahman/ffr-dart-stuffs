class Kucing {
  String nama;
  String warna;
  int umur;

  Kucing(this.nama, this.warna, this.umur);

  void sayHello() {
    print('Miaw, namaku adalah ${this.nama}');
  }

}

void main() {
  Kucing kucingku = Kucing('Ronaldo', 'hitam', 1);
  kucingku.sayHello();
}