import 'package:belajar_bloc2/pages/item_pages.dart';
import 'package:flutter/material.dart';

builCard(context, index) {
  return GestureDetector(
    onTap: () {
      // final snackBar = SnackBar(
      //   content: Text('Yay! A SnackBar! nomor : $index'),
      // );
      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ItemPage(
            index: index,
          ),
        ),
      );
    },
    child: Card(
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
    ),
  );
}

buildImagesComponent() {
  return SizedBox(
    width: double.infinity,
    child: Image.asset(
      'assets/images/kursi.jpg',
      fit: BoxFit.fitWidth,
    ),
  );
}
