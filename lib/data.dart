class data {
  static final Data = data._internal();
  data._internal(); // singlton class
  factory data() => Data;

  late List<Item> items;
  Item getbyid(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);
}

class Item {
  int id;
  String name;
  String desc;
  num price;
  String color;
  String image;
  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
  factory Item.FromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }
}
