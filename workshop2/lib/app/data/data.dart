class DataAPI {
  final String? id;
  final String? nama;
  final String? nim;
  final String? jurusan;
  final String? createdAt;
  final String? updatedAt;

  DataAPI({
    required this.id,
    required this.nama,
    required this.nim,
    required this.jurusan,
    required this.createdAt,
    required this.updatedAt,
  });
  factory DataAPI.fromJson(Map<String, dynamic> json) {
    return DataAPI(
      id: json['id'],
      nama: json['nama'],
      nim: json['nim'],
      jurusan: json['jurusan'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
