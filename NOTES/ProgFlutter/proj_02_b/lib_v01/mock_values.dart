import 'permintaan.dart';
import 'teman.dart';
import 'package:uuid/uuid.dart';

final uuid = Uuid();

final mockPendingFavors = [
  Permintaan(
    uuid: uuid.v4(),
    deskripsi: "go to the supermarket",
    tanggalSampai: DateTime.now().add(Duration(days: 1)),
    teman: Teman(
      nama: "Kucingku",
      nomor: "11111111111",
      photoURL: "https://placekitten.com/g/200/300",
    ),
  ),
  Permintaan(
    uuid: uuid.v4(),
    deskripsi: "call mom",
    tanggalSampai: DateTime.now().add(Duration(hours: 5)),
    teman: Teman(
      nama: "Wife",
      nomor: "9292992929",
      photoURL: "https://placekitten.com/200/286",
    ),
  ),
  Permintaan(
    uuid: uuid.v4(),
    deskripsi: "go to the supermarket now!",
    tanggalSampai: DateTime.now(),
    teman: Teman(
      nama: "My cat",
      nomor: "11111111111",
      photoURL: "https://placekitten.com/g/200/300",
    ),
  ),
  Permintaan(
    uuid: uuid.v4(),
    deskripsi: "go to the supermarket now!",
    tanggalSampai: DateTime.now(),
    teman: Teman(
      nama: "My cat",
      nomor: "11111111111",
      photoURL: "https://placekitten.com/g/200/300",
    ),
  ),
];

// accepted favors
final mockDoingFavors = [
  Permintaan(
    uuid: uuid.v4(),
    deskripsi: "eat a watermelon",
    tanggalSampai: DateTime.now().add(Duration(days: 1)),
    diterima: true,
    teman: Teman(
      nama: "Dude 1",
      nomor: "99999999900",
      photoURL: "https://placekitten.com/g/300/300",
    ),
  ),
  Permintaan(
    uuid: uuid.v4(),
    deskripsi: "cut the grass",
    tanggalSampai: DateTime.now().add(Duration(hours: 1)),
    diterima: true,
    teman: Teman(
      nama: "Dad",
      nomor: "99999999999",
      photoURL: "https://placekitten.com/200/200",
    ),
  )
];

// completed favors
final mockCompletedFavors = [
  Permintaan(
    uuid: uuid.v4(),
    deskripsi: "make the dinner",
    tanggalSampai: DateTime.now().add(Duration(days: 1)),
    tanggalSelesai: DateTime.now(),
    diterima: true,
    teman: Teman(
      nama: "Mom",
      nomor: "99999999991",
      photoURL: "https://placekitten.com/g/400/400",
    ),
  ),
];

// refused favors
final mockRefusedFavors = [
  Permintaan(
    uuid: uuid.v4(),
    deskripsi: "find a job",
    tanggalSampai: DateTime.now().add(Duration(days: 1)),
    diterima: false,
    teman: Teman(
      nama: "Dad",
      nomor: "99999999999",
      photoURL: "https://placekitten.com/200/200",
    ),
  ),
];

final mockFriends = [
  Teman(
    nama: "My cat",
    nomor: "11111111111",
    photoURL: "https://placekitten.com/g/200/300",
  ),
  Teman(
    nama: "Mom",
    nomor: "99999999991",
    photoURL: "https://placekitten.com/g/400/400",
  ),
  Teman(
    nama: "Dad",
    nomor: "99999999999",
    photoURL: "https://placekitten.com/200/200",
  ),
];
