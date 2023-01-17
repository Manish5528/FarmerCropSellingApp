import 'package:ui/screens/home_screen.dart';
import 'package:ui/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart' ;
import 'package:shared_preferences/shared_preferences.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  bool timer = true;
  if(await checkTimer()) {
    timer = false;
  }
  runApp(MyApp(value: timer));
}

Future<bool> checkTimer() async {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final prefs = await _prefs;
  if(prefs.containsKey('timer')) {
    DateTime past = DateTime.parse(prefs.getString('timer')!);
    DateTime curr = DateTime.now();
    if (curr.difference(past).inDays >= 60) {
      return true;
    }
  }
  return false;
}


class MyApp extends StatelessWidget {
  final bool value;
  const MyApp({Key? key, required this.value}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EFarm',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, userSnapshot) {
          if(userSnapshot.hasData && value) {
            return const HomeScreen();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:ui/widgets/utils.dart';
// import 'package:ui/widgets/category_card.dart';
// import 'package:ui/widgets/bottom_nav_bar.dart';
// import 'package:ui/screens/grains_subcategory.dart';
// import 'package:ui/screens/fruits_subcategory.dart';
// import 'package:ui/screens/spices_subcategory.dart';
// import 'package:ui/screens/vegetables_subcategory.dart';
//
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'crop',
//       theme: ThemeData(
//         scaffoldBackgroundColor: kBackgroundColor,
//         textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
//       ),
//       home: HomeScreen(),
//     );
//   }
// }
//
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       bottomNavigationBar: BottomNavBar(),
//       body: Stack(
//         children: <Widget>[
//           Container(
//             height: size.height * .45,
//             decoration: BoxDecoration(
//               color: Color(0x3700B335),
//             ),
//           ),
//           SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: Container(
//                       alignment: Alignment.center,
//                       height: 60,
//                       width: 60,
//                       child: Image.asset("assets/icons/menu.png"),
//
//                     ),
//                   ),
//                   Column(
//                     children: <Widget>[
//                       Align(
//                         alignment: Alignment.center,
//                         child: Container(
//                           color: Colors.white30,
//                           child: Text(
//                             "EFarm",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .displaySmall
//                                 ?.copyWith(fontWeight: FontWeight.w600),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   Container(
//                     margin: EdgeInsets.symmetric(vertical: 30),
//                     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: "Search Crop...",
//                         icon: Image.asset("assets/icons/search.png"),
//                         border: InputBorder.none,
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 18, vertical: 10),
//                       child: GridView.count(
//                         crossAxisCount: 2,
//                         childAspectRatio: .85,
//                         crossAxisSpacing: 20,
//                         mainAxisSpacing: 20,
//                         children: <Widget>[
//                           CategoryCard(
//                             title: "Grains",
//                             image: "assets/images/grains.png",
//                             press: () {
//                               Navigator.push(context, MaterialPageRoute(builder: (context)=> GrainsSubCategory()));
//                               },
//
//                           ),
//                           CategoryCard(
//                             title: "Spices",
//                             image: "assets/images/spices.png",
//                             press: () {
//                               Navigator.push(context, MaterialPageRoute(builder: (context)=> SpicesSubCategory()));
//                             },
//
//                           ),
//                           CategoryCard(
//                             title: "Vegetables",
//                             image: "assets/images/vegetables.png",
//                             press: () {
//                               Navigator.push(context, MaterialPageRoute(builder: (context)=> VegetablesSubCategory()));
//                             },
//                           ),
//                           CategoryCard(
//                             title: "Fruits",
//                             image: "assets/images/fruits.png",
//                             press: () {
//                               Navigator.push(context, MaterialPageRoute(builder: (context)=> FruitsSubCategory()));
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
