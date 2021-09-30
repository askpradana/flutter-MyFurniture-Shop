import 'dart:convert';

import 'package:belajar_bloc2/model/model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<ModelBarang>> fetchToko(http.Client client) async {
  final response = await client.get(Uri.parse('http://localhost:8000/myshop'));

  return compute(parseModel, response.body);
}

List<ModelBarang> parseModel(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<ModelBarang>((json) => ModelBarang.fromJson(json)).toList();
}
