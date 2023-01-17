//
//
//
//
// import 'package:flutter/material.dart';
// import 'package:ui/screens/view_product.dart';
//
// class SearchCrop extends SearchDelegate<String>{
//   final crops = [
//     "Wheat",
//     "Millet",
//     "rice",
//     "Corn",
//     "Coriander",
//     "Garlic",
//     "Ginger",
//     "Turmeric",
//     "Carrot",
//     "Cucumber",
//     "Potato",
//     "Tomato",
//     "Apple",
//     "Banana",
//     "Mango",
//     "Strawberry",
//     "Watermelon"
//   ];
//   final recentCrops=[
//     "Garlic",
//     "Ginger",
//     "Turmeric",
//     "Carrot",
//     "Cucumber",
//     "Potato",
//   ];
//
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return[IconButton(icon: Icon(Icons.clear),
//         onPressed: (){
//       query = "";
//     })];
//
//   }
//
//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       icon: AnimatedIcon(
//         icon: AnimatedIcons.menu_arrow,
//         progress: transitionAnimation,
//       ),
//       onPressed: (){
//         Navigator.of(context).pop();
//       });
//
//
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     return InkWell(
//       onTap: (){
//         //Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewProduct()),);
//       },
//
//     child:Container(
//       height:50,
//      width: double.infinity,
//      child: Card(
//       color: Colors.transparent,
//       child: Center(
//        child:Text(query)
//
//       ),
//       ),
//     ));
//
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final suggestionList = query.isEmpty ? recentCrops : crops.where((p) => p.startsWith(query)).toList();
//     return ListView.builder(
//         itemBuilder: (context, index) => ListTile(
//           onTap: (){
//             showResults(context);
//           },
//           leading: Icon(Icons.agriculture_rounded),
//           title: Text(suggestionList[index]),
//         ),
//       itemCount: suggestionList.length,
//     );
//
//   }
//
// }


import 'dart:ui' as ui;
import 'package:ui/screens/view_product.dart';
import 'package:ui/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SearchScreen extends StatefulWidget {
  final String value;

  const SearchScreen(this.value, {Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  List<String> products = [];
  List<String> searchProduct = [];
  Map<String,String> pidWithName = {};
  ProductModel productModel = ProductModel();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    findAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    RenderErrorBox.backgroundColor = Colors.white;
    RenderErrorBox.textStyle = ui.TextStyle(color: Colors.white);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                excludeHeaderSemantics: true,
                collapsedHeight: 60,
                backgroundColor: Colors.white,
                floating: false,
                pinned: true,
                snap: false,
                forceElevated: innerBoxIsScrolled,
                elevation: 0,
                bottom: const PreferredSize(
                  preferredSize: Size(double.infinity, 0),
                  child: Divider(color: Colors.black26, height: 0, thickness: 2),
                ),
                leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.black45,
                    ),
                    onPressed: () {
                      //go back button
                      Navigator.pop(context, [null]);
                    }
                ),
                flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      centerTitle: true,
                      background: Padding(
                        padding: const EdgeInsets.only(left: 53),
                        child: TextFormField(
                          //when text changed
                          onChanged: (value) {
                            initiateSearch(value);
                          },
                          autofocus: true,
                          decoration: const InputDecoration(
                            hintText: "Search by crop name, e.g. Apple",
                            contentPadding: EdgeInsets.symmetric(vertical: 19.0),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ];
          },
          body: Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black26)
            ),
            child: ListView(
              children: <Widget>[
                const SizedBox(height: 8),
                for(int i = 0; i < searchProduct.length; i++)
                  GestureDetector(
                    onTap: () async {
                      var s = await getCarId(searchProduct[i].toString());
                      if(widget.value == "home") {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => ViewProduct(s)));
                      }
                      else {
                        Navigator.pop(context, [searchProduct[i].toString()]);
                      }
                      FocusScope.of(context).unfocus();
                    },
                    child: ListTile(
                        title: makeResult(searchProduct[i].toString())
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getCarId(String str) {
    if(pidWithName.containsValue(str)) {
      for(int i = 0; i < pidWithName.length; i++) {
        if(pidWithName.values.elementAt(i).compareTo(str) == 0) {
          return pidWithName.keys.elementAt(i);
        }
      }
    }
  }

  findAllProduct() async {
    setState(() {});
    await FirebaseFirestore.instance.collection("products").get().then((val) {
      for(int i = 0; i < val.docs.length; i++) {
        productModel =  ProductModel.fromJson(val.docs[i].data());
        var s = productModel.subcategory!;
        pidWithName[productModel.pid!] = s;
        products.add(s.toString());
      }
    });
    setState(() {});
  }

  initiateSearch(value) {
    setState(() {});
    searchProduct = [];
    if(value.length > 0) {
      var tmp = products.where((item) => item.toLowerCase().contains(value.toString().toLowerCase()));
      Iterator itr = tmp.iterator;
      while(itr.moveNext()) {
        if(widget.value != itr.current) {
          searchProduct.add(itr.current);
        }
      }
    }
  }

  Widget makeResult(title) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 19,
            ),
          ),
          const SizedBox(height: 18),
          const Divider(
            height: 0,
            thickness: 2,
          )
        ],
      ),
    );
  }
}