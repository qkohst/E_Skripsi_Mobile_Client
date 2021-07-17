class AdminProdiSeminarProposalModel {
  final int id;
  final String nama;
  final String judulskripsi;
  final String status;

  AdminProdiSeminarProposalModel(
      {required this.id,
      required this.nama,
      required this.judulskripsi,
      required this.status});

  factory AdminProdiSeminarProposalModel.fromJson(Map<String, dynamic> json) {
    return AdminProdiSeminarProposalModel(
      id: json['id'] as int,
      nama: json['mahasiswa']['nama_mahasiswa'] as String,
      judulskripsi: json['judul_skripsi']['nama_judul_skripsi'] as String,
      status: json['status_seminar_proposal'] as String,
    );
  }
}
