import 'package:belajar_bloc2/item_menu.dart';
import 'package:belajar_bloc2/pages/widgets/main_pages_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: buildBodyMainPage(),
        ),
      ),
    );
  }

  buildBodyMainPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          buildMenuBar(),
          buildTitleMainPage(),
          buildSearchBar(_controller),
          buildFilterMenu(),
          buildPopularSection(),
          Expanded(
              child: SizedBox(
            height: 500,
            child: GridView.builder(
              // physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemCount: 18,
              itemBuilder: (BuildContext context, int index) {
                return builCard();
              },
            ),
          ))
        ],
      ),
    );
  }
}
