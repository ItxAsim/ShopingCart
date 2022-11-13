import 'dart:convert';

import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../cartlog.dart';
import '../constants.dart';
import '../data.dart';
import '../product.dart';
import 'cart.dart';
import 'loginpage.dart';

class myhome extends StatefulWidget {
  const myhome({Key? key}) : super(key: key);

  @override
  State<myhome> createState() => _myhomeState();
}

class _myhomeState extends State<myhome> {
  bool val = false;
//  var data ;
  //late button b;
  data a = data();
  //  late final Item item;
  cartlog cart1 = cartlog();
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  getdata() async {
    var catalog = await rootBundle.loadString("assets/files/catalog.json");

    var rt = jsonDecode(catalog);
    a.items = List.from(rt).map<Item>((item) => Item?.FromMap(item)).toList();

    setState(() {});
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: "SHOPING CART ".text.xl4.make(),
          actions: [
            IconButton(
                onPressed: () {
                  Constants.preferences.setBool("loggedin", false);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => loginpage()));
                },
                icon: Icon(Icons.exit_to_app))
          ],
        ),
        drawer: Drawer(),
        body: (a.items != null && a.items.isNotEmpty)
            ? Card(
                child: ListView.builder(
                  itemCount: a.items.length,
                  itemBuilder: (context, int index) {
                    return product(
                      item: a.items[index],
                    );
                  },
                ),
              )
            : const CircularProgressIndicator().centered().expand(),
        floatingActionButton: VxBuilder(
          builder: (context, store, status) => FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const cart()));
            },
            child: const Icon(
              Icons.shopping_cart,
              size: 30,
            ),
          ).badge(
              textStyle: const TextStyle(fontSize: 22),
              count: cart1.items?.length,
              size: 25),
          mutations: {addmutation, removemutation},
        ),
      ),
    );
  }
}
