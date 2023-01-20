import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';


class AdressScreen extends StatefulWidget {
  const AdressScreen({Key? key}) : super(key: key);

  @override
  _AdressScreenState createState() => _AdressScreenState();
}

class _AdressScreenState extends State<AdressScreen> {


  //form key
  final _formKey = GlobalKey<FormState>();

  //editing controller
  final adressEditingController = TextEditingController();
  final pincodeEditingController = TextEditingController();



  @override
  Widget build(BuildContext context) {


    final adressField = TextFormField(
        autofocus: false,
        controller: adressEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if(value!.isEmpty) {
            return("Adress cannot be Empty");
          }
          //reg expression for firstname

          return null;
        },
        //to save value user enters
        onSaved: (value)
        {
          adressEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.home),
          contentPadding: const EdgeInsets.fromLTRB(30, 50, 20, 15),
          hintText: "Enter your  adress here......",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        )
    );




    final pincodeField = TextFormField(
        autofocus: false,
        controller: pincodeEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if(value!.isEmpty) {
            return("Please Enter Pincode");
          }
          //reg expression for email

          return null;
        },

        onSaved: (value)
        {
          pincodeEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.add_location_alt),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Pincode",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        )
    );

    //password field

    //signup Button
    final ConfirmOrderButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.green,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isDismissible: true,
          //     shape: RoundedRectangleBorder(
          //     // borderRadius: BorderRadius.only(
          //     //   topRight: Radius.circular(20),
          //     //   topLeft: Radius.circular(20)
          //     // ),
          // ),
            builder: ((context){
              return Container(
                //margin: EdgeInsets.all(0),
                height: 300,
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/icons/confirm2.jpg"),
                      scale: 0.1,

                      fit: BoxFit.cover,
                    )),
              );
            })


          );

        },
        child: const Text("Confirm Purchase", textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation:0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.redAccent, size: 35),
            onPressed: () {
              //go back button
              Navigator.of(context).pop();
            }
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    adressField,
                    const SizedBox(height: 40),
                    pincodeField,
                    const SizedBox(height: 35),


                    ConfirmOrderButton,
                    const SizedBox(height: 25),
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






