import 'dart:convert';

OrderModel orderModelFromJson(String str) => OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    this.oid,
    this.adress,
    this.pincode,
    this.city,
    this.pid,
    this.totalprice,
    this.uid,
    this.individualprice,
  });

  String? oid;
  String? adress;
  String? pincode;
  String? city;
  String? pid;
  String? totalprice;
  String? uid;
  String? individualprice;


  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    oid: json["oid"],
    adress: json["adress"],
    pincode: json["pincode"],
    uid: json["uid"],
    city: json["city"],
    totalprice: json["totalprice"],
    pid: json["pid"],
    individualprice: json["individualprice"]


  );

  Map<String, dynamic> toJson() => {
    "oid" : oid,
    "adress": adress,
    "pincode": pincode,
    "uid": uid,
    "city": city,
    "pid" : pid,
    "totalprice": totalprice,
    "individualprice": individualprice,


  };
}
