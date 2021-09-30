class ModelBarang {
  String namatoko;
  String namabarang;

  ModelBarang({required this.namatoko, required this.namabarang});

  factory ModelBarang.fromJson(Map<String, dynamic> json) {
    return ModelBarang(
      namatoko: json['namatoko'],
      namabarang: json['namabarang'],
    );
  }
}
