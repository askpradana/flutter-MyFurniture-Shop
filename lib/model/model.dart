import 'dart:ffi';

class ModelBarang {
  final String namabarang;
  final String gambarbarang;
  final String deskripsibarang;
  final double hargabarang;

  ModelBarang({
    required this.namabarang,
    required this.gambarbarang,
    required this.deskripsibarang,
    required this.hargabarang,
  });

  factory ModelBarang.fromJson(Map<String, dynamic> json) {
    return ModelBarang(
      namabarang: json['namabarang'],
      gambarbarang: json['gambarbarang'],
      deskripsibarang: json['deskripsibarang'],
      hargabarang: json['hargabarang'],
    );
  }
}
