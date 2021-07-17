class JabatanFungsionalModel {
  final int id;
  final String nama;
  final String deskripsi;

  JabatanFungsionalModel({
    required this.id,
    required this.nama,
    required this.deskripsi,
  });

  factory JabatanFungsionalModel.fromJson(Map<String, dynamic> json) {
    return JabatanFungsionalModel(
      id: json['id'] as int,
      nama: json['nama_jabatan_fungsional'] as String,
      deskripsi: json['deskripsi_jabatan_fungsional'] as String,
    );
  }
}
