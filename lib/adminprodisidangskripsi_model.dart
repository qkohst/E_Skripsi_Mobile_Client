class AdminProdiSidangSkripsiModel {
  final int id;
  final String nama;
  final String judulskripsi;
  final String status;

  AdminProdiSidangSkripsiModel(
      {required this.id,
      required this.nama,
      required this.judulskripsi,
      required this.status});

  factory AdminProdiSidangSkripsiModel.fromJson(Map<String, dynamic> json) {
    return AdminProdiSidangSkripsiModel(
      id: json['id'] as int,
      nama: json['mahasiswa']['nama_mahasiswa'] as String,
      judulskripsi: json['judul_skripsi']['nama_judul_skripsi'] as String,
      status: json['status_sidang_skripsi'] as String,
    );
  }
}
