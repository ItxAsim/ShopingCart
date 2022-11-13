import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'cartlog.dart';
import 'data.dart';

class button extends StatefulWidget {
  final Item catalouge;
  button({Key? key, required this.catalouge}) : super(key: key);

  @override
  State<button> createState() => _buttonState();
}

class _buttonState extends State<button> {
  cartlog cart = cartlog();

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [addmutation, removemutation]);
    bool added = cart.items?.contains(widget.catalouge) ?? false;
    return ElevatedButton(
        onPressed: () {
          // cataloge = data();
          if (!added) {
            // cart?.additem(widget.catalouge);
            addmutation(widget.catalouge);
            added = added.toggle();
            // setState(() {});
          }
          // setState(() {});
        },
        child: added ? Icon(Icons.done) : Icon(Icons.add_shopping_cart));
  }
}
