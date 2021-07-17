class PersetujuanJudulModel {
  final int id;
  final String mahasiswa;
  final String judul;
  final String sebagai;
  final String status;

  PersetujuanJudulModel(
      {required this.id,
      required this.mahasiswa,
      required this.judul,
      required this.sebagai,
      required this.status});

  factory PersetujuanJudulModel.fromJson(Map<String, dynamic> json) {
    return PersetujuanJudulModel(
      id: json['id'] as int,
      mahasiswa: json['mahasiswa']['nama_mahasiswa'] as String,
      judul: json['judul_skripsi']['nama_judul_skripsi'] as String,
      sebagai: json['jabatan_dosen_pembimbing'] as String,
      status: json['persetujuan_dosen_pembimbing'] as String,
    );
  }
}
