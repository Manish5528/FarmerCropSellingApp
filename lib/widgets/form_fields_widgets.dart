
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class formfields extends StatelessWidget{

  final TextEditingController controller;
  final IconData data;
  final String txtHint;
  bool obscure=true;

  formfields({ Key? key, required this.controller, required this.data, required this.txtHint, required this.obscure}) : super(key: key) {

  }

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(
              color: Colors.black54,
              width: 2
          )
      ),
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(10),
      height: 50,
      width: 300,
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(data,color: Colors.grey,),
            hintText: txtHint
        ),
      ),

    );

  }
}

