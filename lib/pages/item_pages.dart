import 'package:flutter/material.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({
    Key? key,
    this.index,
  }) : super(key: key);
  final dynamic index;

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Item ${widget.index}"),
      ),
    );
  }
}
