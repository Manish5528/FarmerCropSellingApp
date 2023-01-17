

import 'package:flutter/material.dart';
import 'package:ui/screens/product_list.dart';
import 'package:ui/screens/view_product.dart';
import 'package:ui/widgets/subcategory_card.dart';

class FruitsSubCategory extends StatefulWidget {
  const FruitsSubCategory({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FruitsSubCategoryState();
  }
}

class FruitsSubCategoryState extends State<FruitsSubCategory> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        title:Text ("Fruits",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.green,

        ),
        ),
        iconTheme: IconThemeData(color: Colors.black, size: 35),

      ),

      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * 1.0,
            decoration: BoxDecoration(
              color: Colors.white,

            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: GridView.count(
                        crossAxisCount: 3,
                        childAspectRatio: .85,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 5,
                        children: <Widget>[
                          SubCategoryCard(
                            title: "Apple",
                            image: "assets/images/apple.png",
                            press: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductList()));
                            },
                          ),
                          SubCategoryCard(
                            title: "Banana",
                            image: "assets/images/banana.png",
                            press: () {},
                          ),
                          SubCategoryCard(
                            title: "Mango",
                            image: "assets/images/mango.png",
                            press: () {},
                          ),
                          SubCategoryCard(
                            title: "Strawberry",
                            image: "assets/images/strawberry.png",
                            press: () {},
                          ),
                          SubCategoryCard(
                            title: "Watermelon",
                            image: "assets/images/watermelon.png",
                            press: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ) ,

        ],
      ),
    );
  }
}

