

import 'package:flutter/material.dart';
import 'package:ui/widgets/subcategory_card.dart';

class SpicesSubCategory extends StatefulWidget {
  const SpicesSubCategory({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SpicesSubCategoryState();
  }
}

class SpicesSubCategoryState extends State<SpicesSubCategory> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:Text ("Spices",
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
                        childAspectRatio: 0.85,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 5,
                        children: <Widget>[
                          SubCategoryCard(
                            title: "Coriander",
                            image: "assets/images/coriander.png",
                            press: () {},
                          ),
                          SubCategoryCard(
                            title: "Garlic",
                            image: "assets/images/garlic.png",
                            press: () {},
                          ),
                          SubCategoryCard(
                            title: "Ginger",
                            image: "assets/images/ginger.png",
                            press: () {},
                          ),
                          SubCategoryCard(
                            title: "Turmeric",
                            image: "assets/images/turmeric.png",
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

