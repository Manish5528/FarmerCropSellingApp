

import 'package:flutter/material.dart';
import 'package:ui/widgets/subcategory_card.dart';

class VegetablesSubCategory extends StatefulWidget {
  const VegetablesSubCategory({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return VegetablesSubCategoryState();
  }
}

class VegetablesSubCategoryState extends State<VegetablesSubCategory> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:Text ("Vegetables",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.green,

          ),
        ),
        iconTheme: IconThemeData(color: Colors.black, size: 30),

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
                            title: "Carrot",
                            image: "assets/images/carrot.png",
                            press: () {},
                          ),
                          SubCategoryCard(
                            title: "Cucumber",
                            image: "assets/images/cucumber.png",
                            press: () {},
                          ),
                          SubCategoryCard(
                            title: "Potato",
                            image: "assets/images/potato.png",
                            press: () {},
                          ),
                          SubCategoryCard(
                            title: "Tomato",
                            image: "assets/images/tomato.png",
                            press: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

