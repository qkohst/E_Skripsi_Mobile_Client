class AdminSidangSkripsiModel {
  final int id;
  final String nama;
  final String npm;
  final String prodi;
  final String status;

  AdminSidangSkripsiModel(
      {required this.id,
      required this.nama,
      required this.npm,
      required this.prodi,
      required this.status});

  factory AdminSidangSkripsiModel.fromJson(Map<String, dynamic> json) {
    return AdminSidangSkripsiModel(
      id: json['id'] as int,
      nama: json['mahasiswa']['nama_mahasiswa'] as String,
      npm: json['mahasiswa']['npm_mahasiswa'] as String,
      prodi: json['program_studi']['nama_program_studi'] as String,
      status: json['status_sidang_skripsi'] as String,
    );
  }
}
