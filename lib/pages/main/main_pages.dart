import 'package:belajar_bloc2/pages/main/explore_pages.dart';
import 'package:belajar_bloc2/pages/main/profile_pages.dart';
import 'package:belajar_bloc2/pages/main/wishlist_pages.dart';
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
  final PageController _pageController = PageController();
  int selectedIndex = 0;

  final TextEditingController _textController = TextEditingController();
  final explorePage = const Explore();
  final profilePage = const ProfilePage();
  final wishlistPage = const WishlistPage();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: CustomBottomAppbar(
          selectedIndex: selectedIndex,
          pageController: _pageController,
        ),
        body: SafeArea(
          child: PageView(
            controller: _pageController,
            children: [
              buildBodyMainPage(),
              explorePage,
              profilePage,
              wishlistPage,
            ],
            onPageChanged: (page) {
              setState(() {
                selectedIndex = page;
              });
            },
            physics: const BouncingScrollPhysics(),
          ),
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
        children: [
          buildMenuBar(),
          buildTitleMainPage(),
          buildSearchBar(_textController),
          buildFilterMenu(),
          buildPopularSection(),
          BuildListBarang()
        ],
      ),
    );
  }
}
