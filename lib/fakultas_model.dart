class FakultasModel {
  final int id;
  final int kode;
  final String nama;
  final String singkatan;
  final String status;

  FakultasModel(
      {required this.id,
      required this.kode,
      required this.nama,
      required this.singkatan,
      required this.status});

  factory FakultasModel.fromJson(Map<String, dynamic> json) {
    return FakultasModel(
      id: json['id'] as int,
      kode: json['kode_fakultas'] as int,
      nama: json['nama_fakultas'] as String,
      singkatan: json['singkatan_fakultas'] as String,
      status: json['status_fakultas'] as String,
    );
  }
}
