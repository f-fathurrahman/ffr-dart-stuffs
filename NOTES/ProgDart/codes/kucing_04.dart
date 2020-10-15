class Kucing {
  String nama;
  String warna;
  int umur;

  Kucing(String nama, String warna, int umur) {
    this.nama = nama;
    this.warna = warna;
    this.umur = umur;
  }

  void sayHello() {
    print('Miaw, namaku adalah ${this.nama}');
  }

}

void main() {
  Kucing kucingku = Kucing('Ronaldo', 'hitam', 1);
  kucingku.sayHello();
}