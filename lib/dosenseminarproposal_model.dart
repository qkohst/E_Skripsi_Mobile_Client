class DosenSeminarProposalModel {
  final int id;
  final String mahasiswa;
  final String judul;
  final String status;

  DosenSeminarProposalModel(
      {required this.id,
      required this.mahasiswa,
      required this.judul,
      required this.status});

  factory DosenSeminarProposalModel.fromJson(Map<String, dynamic> json) {
    return DosenSeminarProposalModel(
      id: json['id'] as int,
      mahasiswa: json['mahasiswa']['nama_mahasiswa'] as String,
      judul: json['judul_skripsi']['nama_judul_skripsi'] as String,
      status: json['status_seminar_proposal'] as String,
    );
  }
}
