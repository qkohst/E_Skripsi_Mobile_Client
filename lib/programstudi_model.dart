class ProgramStudiModel {
  final int id;
  final int kode;
  final String fakultas;
  final String nama;
  final String singkatan;
  final String status;

  ProgramStudiModel(
      {required this.id,
      required this.kode,
      required this.fakultas,
      required this.nama,
      required this.singkatan,
      required this.status});

  factory ProgramStudiModel.fromJson(Map<String, dynamic> json) {
    return ProgramStudiModel(
      id: json['id'] as int,
      kode: json['kode_program_studi'] as int,
      fakultas: json['fakultas']['nama_fakultas'] as String,
      nama: json['nama_program_studi'] as String,
      singkatan: json['singkatan_program_studi'] as String,
      status: json['status_program_studi'] as String,
    );
  }
}
