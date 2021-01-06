class ProductModel {
  String name;
  double price;
  ProductModel(String name, double price){
    this.name = name;
    this.price = price;
  }
  Map<String, dynamic> toJson() => {
    'name': name,
    'price': price,
  };
}