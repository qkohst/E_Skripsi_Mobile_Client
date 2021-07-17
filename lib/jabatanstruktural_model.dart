class JabatanStrukturalModel {
  final int id;
  final String nama;
  final String deskripsi;

  JabatanStrukturalModel(
      {required this.id, required this.nama, required this.deskripsi});

  factory JabatanStrukturalModel.fromJson(Map<String, dynamic> json) {
    return JabatanStrukturalModel(
      id: json['id'] as int,
      nama: json['nama_jabatan_struktural'] as String,
      deskripsi: json['deskripsi_jabatan_struktural'] as String,
    );
  }
}
