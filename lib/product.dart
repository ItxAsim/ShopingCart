import 'package:flutter/material.dart';
import 'package:shopingcart/pages/details.dart';

import 'package:velocity_x/velocity_x.dart';

import 'button.dart';
import 'data.dart';

class product extends StatelessWidget {
  const product({Key? key, required this.item}) : super(key: key);
  final Item item;
  // final index;
  @override
  Widget build(BuildContext context) {
    var index;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: InkWell(
          child: Hero(
            //tag:// Key(),
            tag: Key(index.toString()),
            child: Column(
              children: [
                ListTile(
                  leading: Image.network(item.image),
                  title: Text(
                    item.name,
                  ),
                  subtitle: Text(item.desc),
                  trailing:
                      "\$${item.price}".text.xl.color(Colors.black54).make(),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: button(
                      catalouge: item,
                    ))
              ],
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => details(
                          // a: a,
                          //index: index,
                          item: item,
                        )));
          },
        ),
      ),
    );
  }
}
