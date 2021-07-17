class MahasiswaBimbinganProposalModel {
  final int id;
  final String topik;
  final String dosen;
  final String tgl;
  final String status;

  MahasiswaBimbinganProposalModel(
      {required this.id,
      required this.topik,
      required this.dosen,
      required this.tgl,
      required this.status});

  factory MahasiswaBimbinganProposalModel.fromJson(Map<String, dynamic> json) {
    return MahasiswaBimbinganProposalModel(
      id: json['id'] as int,
      topik: json['topik_bimbingan_proposal'] as String,
      dosen: json['dosen_pembimbing']['nama_dosen'] as String,
      tgl: json['tanggal_pengajuan_bimbingan_proposal'] as String,
      status: json['status_persetujuan_bimbingan_proposal'] as String,
    );
  }
}
