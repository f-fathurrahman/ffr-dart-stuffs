import 'teman.dart';

class Permintaan {
  final String uuid;
  final String deskripsi;
  final DateTime tanggalSampai; // deadline
  final bool diterima;
  final DateTime tanggalSelesai;
  final Teman teman;

  Permintaan({
    this.uuid,
    this.deskripsi,
    this.tanggalSampai,
    this.diterima,
    this.tanggalSelesai,
    this.teman
  });

  get sedangDilakukan => diterima == true && tanggalSelesai == null;

  get sedangDiminta => diterima == null;

  get sudahSelesai => tanggalSelesai != null;

  get ditolak => diterima == false;
}