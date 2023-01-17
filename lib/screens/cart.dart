import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
   int count = 1;
   void _incrementCount(){
     setState(() {
       count++;
     });
   }
   void _decrementCount(){
     if(count < 2){
       return ;

     }
     setState(() {
       count--;
     });
   }


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ("Cart"),
      ),

      body: Column(
      children:[
        Container(
        padding: EdgeInsets.only(top: 20),
        height: 685,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 570,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 1; i < 8; i++)
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 8),
                          ],
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(0),
                              child: Image.asset("assets/images/apple.png",
                                  height: 70, width: 70),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 15),
                                  child: Text(
                                    "Item Title",
                                    style: TextStyle(
                                      color: Color(0xFF00A368),
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  //margin: EdgeInsets.only(bottom: 8),
                                  child: Text(
                                    "\₹20" ,
                                    style: TextStyle(
                                      color: Color(0xFF00A368),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: 35, width: 37,
                                    child: new IconButton(
                                      onPressed: (){},
                                      icon: new Icon(Icons.disabled_by_default),
                                      iconSize: 20,
                                      color: Color(0xFF00A368),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 17,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 8),
                                          ],
                                        ),
                                        child: new IconButton(
                                          onPressed: _decrementCount,
                                          icon: new Icon(CupertinoIcons.minus),
                                          constraints: BoxConstraints(
                                              maxHeight: 30, maxWidth: 30),
                                          iconSize: 15,
                                          color: Color(0xFF00A368),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          "(${count})",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 8),
                                          ],
                                        ),
                                        child: new IconButton(
                                          onPressed: _incrementCount,
                                          icon: new Icon(CupertinoIcons.plus),
                                          constraints: BoxConstraints(
                                              maxHeight: 30, maxWidth: 30),
                                          iconSize: 15,
                                          color: Color(0xFF00A368),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Container(
              //margin:EdgeInsets.symmetric( horizontal: 0) ,
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                //borderRadius: BorderRadius.circular(0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 8),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\₹150",
                    style: TextStyle(
                      color: Color(0xFF00A468),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  InkWell(
                    onTap: () {

                      },




                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFF00A368),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        "Check Out",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
     ],
     ),
    );
  }
}
