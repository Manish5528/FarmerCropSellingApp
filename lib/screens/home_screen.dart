import 'package:flutter/material.dart';
import 'package:ui/screens/search_screen.dart';
import 'package:ui/widgets/utils.dart';
import 'package:ui/widgets/category_card.dart';
import 'package:ui/widgets/bottom_nav_bar.dart';
import 'package:ui/screens/grains_subcategory.dart';
import 'package:ui/screens/fruits_subcategory.dart';
import 'package:ui/screens/spices_subcategory.dart';
import 'package:ui/screens/vegetables_subcategory.dart';



final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0x3700B335),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: 60,
                      child: Image.asset("assets/icons/menu.png"),

                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          color: Colors.white30,
                          child: Text(
                            "EFarm",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // InkWell(
                  //   onTap: (){
                  //     showSearch (context: context, delegate: SearchCrop());
                  //   },
                   Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),


                    child: TextField(
                      readOnly: true,
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>  const SearchScreen("home")));
                        },
                      decoration: InputDecoration(
                        hintText: "Search Crop...",
                        icon: Image.asset("assets/icons/search.png"),
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 10),
                      child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: .85,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        children: <Widget>[
                          CategoryCard(
                            title: "Grains",
                            image: "assets/images/grains.png",
                            press: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> GrainsSubCategory()));
                              },

                          ),
                          CategoryCard(
                            title: "Spices",
                            image: "assets/images/spices.png",
                            press: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> SpicesSubCategory()));
                            },

                          ),
                          CategoryCard(
                            title: "Vegetables",
                            image: "assets/images/vegetables.png",
                            press: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> VegetablesSubCategory()));
                            },
                          ),
                          CategoryCard(
                            title: "Fruits",
                            image: "assets/images/fruits.png",
                            press: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> FruitsSubCategory()));
                            },
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
