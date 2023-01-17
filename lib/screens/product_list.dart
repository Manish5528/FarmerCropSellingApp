import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui/model/product_model.dart';
import 'package:ui/screens/view_product.dart';

import '../model/user_model.dart';

class ProductList extends StatefulWidget {
   ProductList({Key? key}) : super(key: key);
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  bool isLoading = false;
  List<ProductModel> products = [];
  ProductModel productModel = ProductModel();
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  fetchUser() async {
    setState(() {
      isLoading = true;
    });
    await FirebaseFirestore.instance.collection("users").doc(user!.uid).get().then((value) {
      loggedInUser = UserModel.fromJson(value.data()!);
    });
    setState(() {
      isLoading = false;
    });
  }



  @override
  void initState() {
    super.initState();
    getProducts();
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        appBar: AppBar(
          title: Text ("Product List"),
    ),

        body: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 680,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for(int i = 0; i < products.length; i++)
                   // for (int i = 1; i < 10; i++)
                      Container(
                        margin:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                        decoration: BoxDecoration(
                         // borderRadius: BorderRadius.circular(0),
                          border: Border(bottom: BorderSide(color:Theme.of(context).dividerColor)),
                          color: Colors.transparent,

                        ),

                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(1),
                              child: Image.asset("assets/images/${products[i].subcategory!}.png",
                                  height: 80, width: 80),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                   products[i].farm! + "  " + products[i].subcategory! ,
                                    style: TextStyle(
                                      color: Color(0xFF00A368),
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  //margin: EdgeInsets.only(bottom: 8),
                                  child: Text(
                                    isLoading ? "Loading..." : "${loggedInUser.city} ",
                                    style: TextStyle(
                                      color: Color(0xFF00A368),
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => ViewProduct(products[i].pid!)));
                                    },
                                    child: Container(
                                      padding:
                                      EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                                      decoration: BoxDecoration(
                                        color: Color(0xFF00A368),

                                      ),
                                      child: Text(
                                        "View",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getProducts() async {
    setState(() {
      isLoading = true;
    });
    await FirebaseFirestore.instance.collection("products").get().then((val) {
      for(int i = 0; i < val.docs.length; i++) {
        productModel =  ProductModel.fromJson(val.docs[i].data());
        products.add(productModel);
      }
    });
    setState(() {
      isLoading = false;
    });
  }
}








