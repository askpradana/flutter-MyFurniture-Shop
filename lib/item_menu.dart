import 'package:flutter/material.dart';

builCard() {
  return Card(
    child: Column(
      children: [
        Expanded(
          flex: 4,
          child: buildImagesComponent(),
        ),
        const Expanded(
          flex: 1,
          child: Text("Judul barang"),
        ),
      ],
    ),
  );
}

buildImagesComponent() {
  return Container(
    width: double.infinity,
    child: Image.asset(
      'assets/images/kursi.jpg',
      fit: BoxFit.fitWidth,
    ),
  );
}
