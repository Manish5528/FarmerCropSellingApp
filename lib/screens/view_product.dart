import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui/model/product_model.dart';

import '../widgets/bottom_nav_bar.dart';

class ViewProduct extends StatefulWidget {
  final String value;

   ViewProduct(this.value, {Key? key}) : super(key: key);

  @override
  _ViewProductState createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {


  bool isLoading = true;

  ProductModel productModel = ProductModel();

  @override
  void initState() {
    super.initState();
    getProductDetails();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(

        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(25),
                height: 300,
                width: double.infinity,
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/products/${productModel.subcategory!}.png"),
                 scale: 2.5,

                 // fit: BoxFit.cover,
                )),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 35,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Color(0xFF66BB6A),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 15),
                      child: Row(
                        children: [
                          Text(
                            productModel.subcategory!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 25),
                          Text(
                            "ffygjkhi;k;lkvfdfyjguhuyiugthtrggg",
                             // productModel.description!,
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Availabel Quantity:",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(productModel.quantity! + "Kg",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(productModel.pid!),
    );
  }
  getProductDetails() async {
    setState(() {
      isLoading = true;
    });
    await FirebaseFirestore.instance.collection("products")
        .where("pid", isEqualTo: widget.value).get().then((val) async {
      productModel = ProductModel.fromJson(val.docs[0].data());
    });
    setState(() {
      isLoading = false;
    });
  }

}
