

import 'package:flutter/material.dart';
import 'package:ui/widgets/subcategory_card.dart';

class GrainsSubCategory extends StatefulWidget {
  const GrainsSubCategory({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GrainsSubCategoryState();
  }
}

class GrainsSubCategoryState extends State<GrainsSubCategory> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:Text ("Grains",
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
                            title: "Wheat",
                            image: "assets/images/wheat.png",
                            press: () {},
                          ),
                          SubCategoryCard(
                            title: "Rice",
                            image: "assets/images/rice.png",
                            press: () {},
                          ),
                          SubCategoryCard(
                            title: "Corn",
                            image: "assets/images/corn.png",
                            press: () {},
                          ),
                          SubCategoryCard(
                            title: "Millet",
                            image: "assets/images/millet.png",
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

