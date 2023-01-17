import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class SellProduct extends StatefulWidget {
  const SellProduct({Key? key}) : super(key: key);

  @override
  _SellProductState createState() => _SellProductState();
}

class _SellProductState extends State<SellProduct> {
  final _formKey = GlobalKey<FormState>();
  final farmEditingController = TextEditingController();
  final priceEditingController = TextEditingController();
  final quantityEditingController = TextEditingController();
  final descriptionEditingController = TextEditingController();


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
    final farmField = TextFormField(
        autofocus: false,
        controller: farmEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if(value!.isEmpty) {
            return("Farm name cannot be Empty");
          }
          //reg expression for firstname

          return null;
        },
        //to save value user enters
        onSaved: (value)
        {
          farmEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.agriculture_rounded),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Farm Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        )
    );

    final priceField = TextFormField(
        autofocus: false,
        controller: priceEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if(value!.isEmpty) {
            return("Price cannot be Empty");
          }
          //reg expression for firstname

          return null;
        },
        //to save value user enters
        onSaved: (value)
        {
          priceEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.currency_rupee),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Price",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        )
    );

    final quantityField = TextFormField(
        autofocus: false,
        controller: quantityEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if(value!.isEmpty) {
            return("Quantity cannot be Empty");
          }
          //reg expression for firstname

          return null;
        },
        //to save value user enters
        onSaved: (value)
        {
          quantityEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.filter_drama),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Enter Availabel Quantity",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        )
    );

    final descriptionField = TextFormField(
        autofocus: false,
        controller: descriptionEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if(value!.isEmpty) {
            return("Description cannot be Empty");
          }


          return null;
        },
        //to save value user enters
        onSaved: (value)
        {
          descriptionEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.description),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Product Description",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        )
    );

    final AddButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
        },
        child: const Text("Add", textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );








    return Scaffold(
      //child: Scaffold(
        appBar: AppBar(
          title: Text("Farmer Portal"),
          backgroundColor: Colors.redAccent,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[

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
                              )
                              .toList();
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

                      farmField,
                      const SizedBox(height: 30),
                      priceField,
                      const SizedBox(height: 30),
                      quantityField,
                      const SizedBox(height: 30),
                      descriptionField,
                      const SizedBox(height: 30),
                      AddButton,
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  }
}
