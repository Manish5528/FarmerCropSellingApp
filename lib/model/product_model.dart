import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {


  ProductModel({
    this.category,
    this.subcategory,
    this.pid,
    this.farm,
    this.quantity,
    this.price,
    this.description,
    this.uid,
  });

  String? category;
  String? subcategory;
  String? pid;
  String? farm;
  String? quantity;
  String? price;
  String? description;
  String? uid;


  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    category: json["category"],
    subcategory: json["subcategory"],
    pid: json["pid"],
    farm: json["farm"],
    quantity: json["quantity"],
    description: json["description"],
    price: json["price"],
    uid: json["uid"],

  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "subcategory": subcategory,
    "pid": pid,
    "farm": farm,
    "quantity": quantity,
    "description": description,
    "price": price,
    "uid": uid,

  };
}
