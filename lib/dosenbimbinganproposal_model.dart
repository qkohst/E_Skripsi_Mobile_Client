class DosenBimbinganProposalModel {
  final int id;
  final String mahasiswa;
  final String topik;
  final String status;

  DosenBimbinganProposalModel(
      {required this.id,
      required this.mahasiswa,
      required this.topik,
      required this.status});

  factory DosenBimbinganProposalModel.fromJson(Map<String, dynamic> json) {
    return DosenBimbinganProposalModel(
      id: json['id'] as int,
      mahasiswa: json['mahasiswa']['nama_mahasiswa'] as String,
      topik: json['topik_bimbingan_proposal'] as String,
      status: json['status_persetujuan_bimbingan_proposal'] as String,
    );
  }
}
