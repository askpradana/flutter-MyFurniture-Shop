import 'package:belajar_bloc2/bloc/chips_bloc.dart';
import 'package:flutter/material.dart';

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
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}

class CustomFilterChip extends StatelessWidget {
  CustomFilterChip({
    Key? key,
    required this.namaMenu,
  }) : super(key: key);

  final String namaMenu;
  final chipsBloc = ChipsBloc();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: StreamBuilder(
        stream: chipsBloc.stateStream,
        builder: (context, snapshot) {
          return FilterChip(
            label: Text(namaMenu),
            selected: chipsBloc.chipsIsActive,
            onSelected: (event) {
              chipsBloc.eventSink.add(event);
            },
            selectedColor: Colors.orange,
          );
        },
      ),
    );
  }
}
