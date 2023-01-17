import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class SellProduct extends StatefulWidget {
  const SellProduct({Key? key}) : super(key: key);

  @override
  _SellProductState createState() => _SellProductState();
}

class _SellProductState extends State<SellProduct> {
  List<dynamic> categories = [];
  List<dynamic> subcategoriesMasters = [];
  List<dynamic> subcategories = [];

  String? categoryId;
  String? subcategoryId;

  @override
  void initState() {
    super.initState();
    this.categories.add({"id": 1, "name": "Grains"});
    this.categories.add({"id": 2, "name": "Spices"});
    this.categories.add({"id": 3, "name": "Vegetables"});
    this.categories.add({"id": 4, "name": "Fruits"});

    this.subcategoriesMasters = [
      {"ID": 1, "Name": "Wheat", "ParentId": 1},
      {"ID": 2, "Name": "Corn", "ParentId": 1},
      {"ID": 3, "Name": "Millet", "ParentId": 1},
      {"ID": 4, "Name": "Rice", "ParentId": 1},
      {"ID": 1, "Name": "Coriander", "ParentId": 2},
      {"ID": 2, "Name": "Garlic", "ParentId": 2},
      {"ID": 3, "Name": "Ginger", "ParentId": 2},
      {"ID": 4, "Name": "Turmeric", "ParentId": 2},
      {"ID": 1, "Name": "Potato", "ParentId": 3},
      {"ID": 2, "Name": "Tomato", "ParentId": 3},
      {"ID": 3, "Name": "Carrot", "ParentId": 3},
      {"ID": 4, "Name": "Cucumber", "ParentId": 3},
      {"ID": 1, "Name": "Apple", "ParentId": 4},
      {"ID": 2, "Name": "Banana", "ParentId": 4},
      {"ID": 3, "Name": "Mango", "ParentId": 4},
      {"ID": 4, "Name": "Watermelon", "ParentId": 4},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Farmer Portal"),
          backgroundColor: Colors.redAccent,
        ),
        body: Column(
          children: [
            FormHelper.dropDownWidgetWithLabel(
              context,
              "Category",
              "Select Category",
              this.categoryId,
              this.categories,
              (onChangedVal) {
                this.categoryId = onChangedVal;
                print("Selected Category: $onChangedVal");
                this.subcategories = this
                    .subcategoriesMasters
                    .where(
                      (subcategoryItem) =>
                          subcategoryItem['ParentId'].toString() ==
                          onChangedVal.toString(),
                ).toList();
                this.subcategoryId = null;
              },
              (onValidateVal) {
                if (onValidateVal == null) {
                  return 'Please Select Category';
                }
                return null;
              },
              borderColor: Theme.of(context).primaryColor,
              borderFocusColor: Theme.of(context).primaryColor,
              borderRadius: 10,
            ),
            FormHelper.dropDownWidgetWithLabel(
              context,
              "SubCategory",
              "Select Subcategory",
              this.subcategoryId,
              this.subcategories,
              (onChangedVal) {
                this.subcategoryId = onChangedVal;
                print("Selected Subcategory: $onChangedVal");
              },
              (onValidateVal) {
                return null;
              },
              borderColor: Theme.of(context).primaryColor,
              borderFocusColor: Theme.of(context).primaryColor,
              borderRadius: 10,
              optionValue: "ID",
              optionLabel: "Name",
            ),
            Container(


            ),
          ],
        ),
      ),
    );
  }
}
