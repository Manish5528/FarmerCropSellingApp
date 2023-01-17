import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui/screens/sell_product.dart';
import 'package:ui/widgets/utils.dart';
import 'package:ui/screens/cart.dart';
import 'package:ui/screens/view_product.dart';

import '../model/product_model.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      height: 70,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BottonNavItem(
            image: "assets/icons/sell.png",
            title: "Sell",
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SellProduct()));
            },
          ),
          BottonNavItem(
            image: "assets/icons/home.png",
            title: "Home",
            press: () {},
            isActive: true,
          ),
          BottonNavItem(
              image: "assets/icons/cart.png",
              title: "Cart",
              press: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              }),
        ],
      ),
    );
  }
}

class BottonNavItem extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  final void Function() press;
  const BottonNavItem({
    Key? key,
    required this.image,
    required this.title,
    this.isActive = false,
    required this.press,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Image.asset(image, color: isActive ? kActiveIconColor : kTextColor),
          Text(
            title,
            style: TextStyle(color: isActive ? kActiveIconColor : kTextColor),
          ),
        ],
      ),
    );
  }
}

class BottomBar extends StatefulWidget {
final String value;

  BottomBar(this.value, {Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  bool isLoading = true;

  ProductModel productModel = ProductModel();

  @override
  void initState() {
    super.initState();
    getProductDetails();
  }


  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "₹" + productModel.price!,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00A368),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xFF00A368),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.add_shopping_cart,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(width: 3),
                    Text(
                      "Add to Cart",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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
