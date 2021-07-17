class MahasiswaModel {
  final int id;
  final String nama;
  final String npm;
  final String status;

  MahasiswaModel(
      {required this.id,
      required this.nama,
      required this.npm,
      required this.status});

  factory MahasiswaModel.fromJson(Map<String, dynamic> json) {
    return MahasiswaModel(
      id: json['id'] as int,
      nama: json['nama_mahasiswa'] as String,
      npm: json['npm_mahasiswa'] as String,
      status: json['status_mahasiswa'] as String,
    );
  }
}
