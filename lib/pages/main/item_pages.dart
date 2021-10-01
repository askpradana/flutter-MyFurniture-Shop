import 'package:belajar_bloc2/bloc/is_liked_bloc.dart';
import 'package:belajar_bloc2/bloc/jumlahbarang_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class ItemPage extends StatefulWidget {
  ItemPage({
    Key? key,
    this.index,
    this.datanya,
  }) : super(key: key);
  final dynamic index;
  final dynamic datanya;

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  final kuantitasBloc = JumlahBarangBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: bikinBodyItemPage(
          widget.datanya,
          widget.index,
          kuantitasBloc.stateStream,
          kuantitasBloc.eventSink,
        ),
      ),
    );
  }

  bikinBodyItemPage(datanya, index, untukstream, eventSink) {
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
            buildGambarBarang(index, datanya),
            buildNamaBarang(index, datanya),
            buildHargaDanKuantitas(datanya, untukstream, eventSink),
            buildDeskripsiItem(index, datanya),
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

  buildGambarBarang(index, datanya) {
    return Image.network(
      datanya[index].namabarang,
      fit: BoxFit.cover,
    );
  }

  buildNamaBarang(index, datanya) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Text(
          datanya[index].namatoko,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  buildHargaDanKuantitas(datanya, untukstream, eventSink) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          // "\$${datanya.hargabarang}",
          '\$8000 ubah aing',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xffe76f51),
          ),
        ),
        StreamBuilder(
            stream: untukstream,
            builder: (context, snapshot) {
              return Row(
                children: [
                  IconButton(
                    onPressed: () {
                      eventSink.add(JumlahBarang.kurang);
                    },
                    icon: const Icon(Icons.remove_outlined),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Text(
                      snapshot.hasData ? '${snapshot.data}' : '1',
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      eventSink.add(JumlahBarang.tambah);
                    },
                    icon: const Icon(
                      Icons.add_outlined,
                    ),
                  ),
                ],
              );
            }),
      ],
    );
  }

  buildDeskripsiItem(index, datanya) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Text(
        datanya[index].namatoko,
        style: const TextStyle(
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
