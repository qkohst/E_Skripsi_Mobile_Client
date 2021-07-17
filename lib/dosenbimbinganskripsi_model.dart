class DosenBimbinganSkripsiModel {
  final int id;
  final String mahasiswa;
  final String topik;
  final String status;

  DosenBimbinganSkripsiModel(
      {required this.id,
      required this.mahasiswa,
      required this.topik,
      required this.status});

  factory DosenBimbinganSkripsiModel.fromJson(Map<String, dynamic> json) {
    return DosenBimbinganSkripsiModel(
      id: json['id'] as int,
      mahasiswa: json['mahasiswa']['nama_mahasiswa'] as String,
      topik: json['topik_bimbingan_skripsi'] as String,
      status: json['status_persetujuan_bimbingan_skripsi'] as String,
    );
  }
}
