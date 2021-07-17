class PersetujuanKRSModel {
  final int id;
  final String nama;
  final String npm;
  final String fileurl;
  final String status;

  PersetujuanKRSModel(
      {required this.id,
      required this.nama,
      required this.npm,
      required this.fileurl,
      required this.status});

  factory PersetujuanKRSModel.fromJson(Map<String, dynamic> json) {
    return PersetujuanKRSModel(
      id: json['id'] as int,
      nama: json['mahasiswa']['nama_mahasiswa'] as String,
      npm: json['mahasiswa']['npm_mahasiswa'] as String,
      fileurl: json['file_krs']['url'] as String,
      status: json['status_persetujuan_admin_prodi_file_krs'] as String,
    );
  }
}
