class CatalogModel {
  static final items = [
    Item(
        id: 1,
        name: "IPhone 12 Pro",
        desc: "Apple Iphone",
        price: 999,
        color: "#33505a",
        image:
            "https://www.apple.com/newsroom/images/product/iphone/standard/Apple_iphone12pro-stainless-steel-gold_10132020_inline.jpg.large.jpg")
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({this.id, this.name, this.desc, this.price, this.color, this.image});
}
