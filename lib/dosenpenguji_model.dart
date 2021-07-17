class DosenPengujiModel {
  final int id;
  final String mahasiswa;
  final String judul;
  final String sebagai;
  final String status;

  DosenPengujiModel(
      {required this.id,
      required this.mahasiswa,
      required this.judul,
      required this.sebagai,
      required this.status});

  factory DosenPengujiModel.fromJson(Map<String, dynamic> json) {
    return DosenPengujiModel(
      id: json['id'] as int,
      mahasiswa: json['mahasiswa']['nama_mahasiswa'] as String,
      judul: json['judul_skripsi']['nama_judul_skripsi'] as String,
      sebagai: json['jabatan_dosen_penguji'] as String,
      status: json['status_persetujuan_dosen_penguji'] as String,
    );
  }
}
