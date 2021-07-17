class DosenModel {
  final int id;
  final String nama;
  final String npm;
  final String status;

  DosenModel(
      {required this.id,
      required this.nama,
      required this.npm,
      required this.status});

  factory DosenModel.fromJson(Map<String, dynamic> json) {
    return DosenModel(
      id: json['id'] as int,
      nama: json['nama_dosen'] as String,
      npm: json['nidn_dosen'] as String,
      status: json['status_dosen'] as String,
    );
  }
}
