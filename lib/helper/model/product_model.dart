class ProductModel {
  final String name;
  final String disc;
  final String pic;
  final String price;
  final int quantity=1;
  ProductModel(
      {required this.name,
      required this.disc,
      required this.pic,
      required this.price,
      });

  factory ProductModel.fromjson(map) {
    return ProductModel(
        name: map["name"],
        disc: map['disc'],
        pic: map['pic'],
        price: map['price'],
        );
  }
}
