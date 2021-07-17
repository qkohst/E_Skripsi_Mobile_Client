class AdminProdiModel {
  final int id;
  final String nama;
  final String nidn;
  final String prodi;

  AdminProdiModel(
      {required this.id,
      required this.nama,
      required this.nidn,
      required this.prodi});

  factory AdminProdiModel.fromJson(Map<String, dynamic> json) {
    return AdminProdiModel(
      id: json['id'] as int,
      nama: json['nama_admin_prodi'] as String,
      nidn: json['nidn_admin_prodi'] as String,
      prodi: json['program_studi']['nama_program_studi'] as String,
    );
  }
}
