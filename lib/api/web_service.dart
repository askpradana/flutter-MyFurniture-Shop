import 'dart:convert';

import 'package:belajar_bloc2/model/model.dart';
import 'package:http/http.dart' as http;

Future<ModelBarang> fetchBarang(nomorbarang) async {
  final response =
      await http.get(Uri.parse('http://localhost:8000/barang/$nomorbarang'));

  if (response.statusCode == 200) {
    return ModelBarang.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}
