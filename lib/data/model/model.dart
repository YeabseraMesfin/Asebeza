class Item {
  String name;
  String Description;
  String image;
  num price;

  Item(
      {required this.name,
      required this.Description,
      required this.price,
      required this.image});

  factory Item.fromJson(Map<String, dynamic> parsedJson) {
    return Item(
        name: parsedJson["title"],
        Description: parsedJson["description"],
        price: parsedJson["price"],
        image: parsedJson["image"]);
  }

  static List asbezaList(List asbeza) {
    List asbezas = [];
    for (var i = 0; i < asbeza.length; i++) {
      asbezas.add(Item.fromJson(asbeza[i]));
    }
    return asbezas;
  }
}