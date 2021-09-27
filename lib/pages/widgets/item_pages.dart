import 'package:belajar_bloc2/bloc/is_liked_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

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
      body: SafeArea(
        child: bikinBodyItemPage(),
      ),
    );
  }

  bikinBodyItemPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 20,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            buildItemPagesAppbar(),
            buildGambarBarang(),
            buildNamaBarang(),
            buildHargaDanKuantitas(),
            buildDeskripsiItem(),
            buildTombolBuyNow(),
          ],
        ),
      ),
    );
  }

  buildItemPagesAppbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(
            Icons.chevron_left_outlined,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        const Text(
          "Detail",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        IsLiked(),
      ],
    );
  }

  buildGambarBarang() {
    return Image.asset(
      'assets/images/kursi.jpg',
      fit: BoxFit.cover,
    );
  }

  buildNamaBarang() {
    return const SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Text(
          "Nama barang",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  buildHargaDanKuantitas() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "\$80.00",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xffe76f51),
          ),
        ),
        Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Icon(
              Icons.remove_outlined,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text("01"),
            ),
            const Icon(
              Icons.add_outlined,
            ),
          ],
        ),
      ],
    );
  }

  buildDeskripsiItem() {
    return const Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Text(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Si verbum sequimur, primum longius verbum praepositum quam bonum. At certe gravius. Quis enim est, qui non videat haec esse in natura rerum tria? Duo Reges: constructio interrete. ",
        style: TextStyle(
          color: Colors.grey,
          fontSize: 18,
        ),
      ),
    );
  }

  buildTombolBuyNow() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        primary: const Color(0xffe76f51),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        child: Text('Buy Now'),
      ),
    );
  }
}

//FIXME: Gunakan bloc
class IsLiked extends StatelessWidget {
  IsLiked({
    Key? key,
  }) : super(key: key);

  final isLiked = IsLikedBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, snapshot) {
        return IconButton(
          onPressed: () {
            // isLiked.eventSink.add(isLoved);
          },
          icon: const Icon(
            // isLoved ? Icons.favorite_outline :
            Icons.favorite_border_outlined,
          ),
        );
      },
    );
  }
}
