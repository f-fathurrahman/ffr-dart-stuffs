class Ayam {
  String nama;
  String warna;
  int umur;
  String gender;

  Ayam(String nama, String warna, int umur, String gender) {
    this.nama = nama;
    this.warna = warna;
    this.umur = umur;
    this.gender = gender;
  }

  void sayHello() {
    if(this.gender == 'jantan') {
      print('Kukuruyuk, namaku adalah ${this.nama}');
    }
    else if(this.gender == 'betina') {
      print('Petok petok, namaku adalah ${this.nama}');
    }
    else {
      print('Kukuruyuk petok, namaku adalah ${this.nama}');
    }
  }

}

void main() {
  Ayam ayam1 = Ayam('Andre', 'hitam', 1, 'jantan');
  ayam1.sayHello();

  Ayam ayam2 = Ayam('Nunung', 'hitam', 1, 'betina');
  ayam2.sayHello();

  Ayam ayam3 = Ayam('XXX', 'hitam', 1, 'lainnya');
  ayam3.sayHello();
}