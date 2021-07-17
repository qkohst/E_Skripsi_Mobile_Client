class DosenSidangSkripsiModel {
  final int id;
  final String mahasiswa;
  final String judul;
  final String status;

  DosenSidangSkripsiModel(
      {required this.id,
      required this.mahasiswa,
      required this.judul,
      required this.status});

  factory DosenSidangSkripsiModel.fromJson(Map<String, dynamic> json) {
    return DosenSidangSkripsiModel(
      id: json['id'] as int,
      mahasiswa: json['mahasiswa']['nama_mahasiswa'] as String,
      judul: json['judul_skripsi']['nama_judul_skripsi'] as String,
      status: json['status_sidang_skripsi'] as String,
    );
  }
}
