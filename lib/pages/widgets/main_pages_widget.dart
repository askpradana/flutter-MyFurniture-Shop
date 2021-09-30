import 'package:belajar_bloc2/api/web_service.dart';
import 'package:belajar_bloc2/bloc/chips_bloc.dart';
import 'package:belajar_bloc2/model/model.dart';
import 'package:belajar_bloc2/pages/main/item_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

buildMenuBar() {
  return const Padding(
    padding: EdgeInsets.only(bottom: 50),
    child: Icon(
      Icons.menu_outlined,
    ),
  );
}

buildTitleMainPage() {
  return const Text(
    "Discover your best furniture",
    style: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
  );
}

buildSearchBar(_controller) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(40),
      color: const Color(0xffe5e5e5),
    ),
    margin: const EdgeInsets.symmetric(
      vertical: 20,
    ),
    child: TextFormField(
      controller: _controller,
      decoration: const InputDecoration(
        hintText: 'Search',
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        prefixIcon: Icon(
          Icons.search,
        ),
        border: InputBorder.none,
      ),
    ),
  );
}

buildFilterMenu() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        CustomFilterChip(
          namaMenu: 'Chair',
        ),
        CustomFilterChip(
          namaMenu: 'Sofa',
        ),
        CustomFilterChip(
          namaMenu: 'Cupboard',
        ),
        CustomFilterChip(
          namaMenu: 'Tables',
        ),
        CustomFilterChip(
          namaMenu: 'TV',
        ),
        CustomFilterChip(
          namaMenu: 'Small furnitures',
        ),
      ],
    ),
  );
}

buildPopularSection() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        'Popular',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      TextButton(
        onPressed: () {},
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(
            Colors.transparent,
          ),
        ),
        child: const Text(
          "View all",
          style: TextStyle(
            color: Color(0xffe76f51),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}

class CustomFilterChip extends StatefulWidget {
  CustomFilterChip({
    Key? key,
    required this.namaMenu,
  }) : super(key: key);

  final String namaMenu;

  @override
  State<CustomFilterChip> createState() => _CustomFilterChipState();
}

class _CustomFilterChipState extends State<CustomFilterChip> {
  final chipsBloc = ChipsBloc();

  @override
  void dispose() {
    chipsBloc.closeStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: StreamBuilder(
        stream: chipsBloc.stateStream,
        builder: (context, snapshot) {
          return ChoiceChip(
            label: Text(
              widget.namaMenu,
              style: TextStyle(
                color: chipsBloc.chipsIsActive ? Colors.white : Colors.black,
              ),
            ),
            elevation: 0,
            selected: chipsBloc.chipsIsActive,
            onSelected: (event) {
              chipsBloc.eventSink.add(event);
            },
            selectedColor: const Color(0xffe76f51),
          );
        },
      ),
    );
  }
}

class CustomBottomAppbar extends StatefulWidget {
  const CustomBottomAppbar({
    Key? key,
    required this.selectedIndex,
    required this.pageController,
  }) : super(key: key);

  final int selectedIndex;
  final PageController pageController;

  @override
  State<CustomBottomAppbar> createState() => _CustomBottomAppbarState();
}

class _CustomBottomAppbarState extends State<CustomBottomAppbar> {
  iconIsNotSelected(int nomor, dynamic ikon) {
    return IconButton(
      onPressed: () {
        setState(() {
          widget.pageController.animateToPage(
            nomor,
            duration: const Duration(milliseconds: 750),
            curve: Curves.ease,
          );
        });
      },
      icon: Icon(ikon),
    );
  }

  iconIsSelected(dynamic ikon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        IconButton(
          onPressed: null,
          disabledColor: Colors.red,
          icon: Icon(ikon),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            widget.selectedIndex == 0
                ? iconIsSelected(Icons.home, 'Home')
                : iconIsNotSelected(0, Icons.home),
            widget.selectedIndex == 1
                ? iconIsSelected(Icons.explore, 'Explore')
                : iconIsNotSelected(1, Icons.explore),
            widget.selectedIndex == 2
                ? iconIsSelected(Icons.person, 'Profile')
                : iconIsNotSelected(2, Icons.person),
            widget.selectedIndex == 3
                ? iconIsSelected(Icons.shopping_cart, 'Wishlist')
                : iconIsNotSelected(3, Icons.shopping_cart),
          ],
        ),
      ),
    );
  }
}

class BuildListBarang extends StatefulWidget {
  const BuildListBarang({
    Key? key,
  }) : super(key: key);

  @override
  State<BuildListBarang> createState() => _BuildListBarangState();
}

class _BuildListBarangState extends State<BuildListBarang> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ModelBarang>>(
      future: fetchToko(http.Client()),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return buildGridView(context, snapshot.data!);
        } else if (snapshot.hasError) {
          return Text("Errornyaaaa : ${snapshot.error}");
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  buildGridView(context, datanya) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              //FIXME: Masih error saat mau sampein ke page

              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ItemPage(
              //       index: index,
              //       datanya: datanya,
              //     ),
              //   ),
              // );
            },
            child: Card(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.network(datanya[index].namabarang)
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: Image.network(
                  //     datanya.barang.namabarang[0],
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  // Container(
                  //   color: Colors.white,
                  //   width: double.infinity,
                  //   height: 40,
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 10),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Column(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Text(datanya.namabarang),
                  //             Text('\$${datanya.hargabarang}'),
                  //           ],
                  //         ),
                  //         const Icon(
                  //           Icons.add_circle_outlined,
                  //           color: Colors.orange,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Expanded(
  //       child: SizedBox(
  //     height: 500,
  //     child: GridView.builder(
  //       // physics: const NeverScrollableScrollPhysics(),
  //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 2,
  //         crossAxisSpacing: 2,
  //         mainAxisSpacing: 2,
  //       ),
  //       itemCount: 18,
  //       itemBuilder: (BuildContext context, int index) {
  //         return builCard(context, index);
  //       },
  //     ),
  //   ));
  // }

  // builCard(context, index) {
  //   return GestureDetector(
  //     onTap: () {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => ItemPage(
  //             index: index,
  //           ),
  //         ),
  //       );
  //     },
  //     child: Card(
  //       child: Column(
  //         children: [
  //           Expanded(
  //             flex: 4,
  //             child: buildImagesComponent(),
  //           ),
  //           const Expanded(
  //             flex: 1,
  //             child: Text("Judul barang"),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // buildImagesComponent() {
  //   return SizedBox(
  //     width: double.infinity,
  //     child: Image.asset(
  //       'assets/images/kursi.jpg',
  //       fit: BoxFit.fitWidth,
  //     ),
  //   );
  // }
}
