class MahasiswaBimbinganSkripsiModel {
  final int id;
  final String topik;
  final String dosen;
  final String tgl;
  final String status;

  MahasiswaBimbinganSkripsiModel(
      {required this.id,
      required this.topik,
      required this.dosen,
      required this.tgl,
      required this.status});

  factory MahasiswaBimbinganSkripsiModel.fromJson(Map<String, dynamic> json) {
    return MahasiswaBimbinganSkripsiModel(
      id: json['id'] as int,
      topik: json['topik_bimbingan_skripsi'] as String,
      dosen: json['dosen_pembimbing']['nama_dosen'] as String,
      tgl: json['tanggal_pengajuan_bimbingan_skripsi'] as String,
      status: json['status_persetujuan_bimbingan_skripsi'] as String,
    );
  }
}
