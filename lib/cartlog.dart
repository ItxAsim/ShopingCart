import 'package:shopingcart/pages/store.dart';
import 'package:velocity_x/velocity_x.dart';

import 'data.dart';

class cartlog {
  static final Cartlog = cartlog._internal();
  cartlog._internal();
  factory cartlog() => Cartlog;

  data Items = data();
  List<int> itemids = [];
  List<Item>? get items => itemids?.map((id) => Items.getbyid(id)).toList();
  num? get totalprice =>
      items?.fold(0, (total, crrunt) => total! + crrunt.price);
  void additem(Item item) {
    itemids.add(item.id);
  }

  void removeitem(Item item) {
    itemids.remove(item.id);
  }
}

class addmutation extends VxMutation<mystore> {
  @override
  final Item item;

  addmutation(this.item);

  perform() {
    store?.cart.itemids.add(item.id);
  }
}

class removemutation extends VxMutation<mystore> {
  @override
  final Item item;

  removemutation(this.item);

  perform() {
    store?.cart.itemids.remove(item.id);
  }
}
