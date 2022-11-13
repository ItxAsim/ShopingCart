import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../cartlog.dart';

class cart extends StatelessWidget {
  const cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "CART".text.bold.make(),
      ),
      body: Column(
        children: [
          list().expand(),
          Divider(),
          cartbutton(),
        ],
      ),
    );
  }
}

class cartbutton extends StatelessWidget {
  cartbutton({Key? key}) : super(key: key);
  final tr = cartlog();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(
              mutations: {removemutation},
              builder: (context, store, status) =>
                  "\$${tr?.totalprice}".text.xl4.make()),
          ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: "this action not supported yet.".text.make()));
              },
              child: "buy".text.make())
        ],
      ),
    );
  }
}

class list extends StatefulWidget {
  list({Key? key}) : super(key: key);

  @override
  State<list> createState() => _listState();
}

class _listState extends State<list> {
  final tr = cartlog();

  Widget build(BuildContext context) {
    VxState.watch(context, on: [removemutation]);
    return ListView.builder(
      itemCount: tr.items?.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Icon(Icons.done),
          trailing: IconButton(
            icon: Icon(Icons.remove_circle_outline_sharp),
            onPressed: () {
              removemutation(tr.items![index]);
              setState(() {});
            },
          ),
          title: "${tr.items?[index].name} ".text.make(),
        );
        setState(() {});
      },
    );
  }
}
