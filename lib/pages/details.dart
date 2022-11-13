import 'package:flutter/material.dart';

import '../button.dart';
import '../data.dart';

class details extends StatelessWidget {
  //data a;
  //var index;
  details({Key? key, required this.item}) : super(key: key);
  final Item item;
  //get index => null;

  @override
  Widget build(BuildContext context) {
    var index;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Hero(
                  tag: Key(index.toString()), child: Image.network(item.image)),
              SizedBox(
                height: 30,
              ),
              BottomAppBar(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        item.name,
                      ),
                      trailing: Text(
                        "\$${item.price},",
                        style: TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(item.desc),
                    ),
                    button(catalouge: item),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
