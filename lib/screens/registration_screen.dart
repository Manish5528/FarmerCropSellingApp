import 'package:ui/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ui/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final _auth = FirebaseAuth.instance;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  //form key
  final _formKey = GlobalKey<FormState>();

  //editing controller
  final nameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();
  final cityEditingController = TextEditingController();
  final phonenoEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    //first name field
    final nameField = TextFormField(
        autofocus: false,
        controller: nameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if(value!.isEmpty) {
            return("First Name cannot be Empty");
          }
          //reg expression for firstname
          if(!RegExp(r'^.{3,}$').hasMatch(value)) {
            return("Minimum First Name length is 3 characters.");
          }
          return null;
        },
        //to save value user enters
        onSaved: (value)
        {
          nameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        )
    );



    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if(value!.isEmpty) {
            return("Please Enter Email");
          }
          //reg expression for email
          if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
            return("Please Enter valid Email");
          }
          return null;
        },
        //to save value user enters
        onSaved: (value)
        {
          emailEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        )
    );

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordEditingController,
        obscureText: true,
        validator: (value) {
          if(value!.isEmpty) {
            return("Password is Required to Login");
          }
          //reg expression for password
          if(!RegExp(r'^.{6,}$').hasMatch(value)) {
            return("Minimum Password length is 6 characters.");
          }
          return null;
        },
        //to save value user enters
        onSaved: (value)
        {
          passwordEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        )
    );

    //confirm password field
    final confirmPasswordField = TextFormField(
        autofocus: false,
        controller: confirmPasswordEditingController,
        obscureText: true,
        validator: (value) {
          if(value != passwordEditingController.text) {
            return "Password don't match";
          }
          return null;
        },
        //to save value user enters
        onSaved: (value)
        {
          confirmPasswordEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        )
    );
    final cityField = TextFormField(
        autofocus: false,
        controller: cityEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if(value!.isEmpty) {
            return("city cannot be Empty");
          }


          return null;
        },
        //to save value user enters
        onSaved: (value)
        {
          cityEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.add_location_alt_rounded),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "City",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        )
    );
    final phonenoField = TextFormField(
        autofocus: false,
        controller: phonenoEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if(value!.isEmpty) {
            return("First Name cannot be Empty");
          }
          //reg expression for firstname

          return null;
        },
        //to save value user enters
        onSaved: (value)
        {
          phonenoEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Phoneno",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        )
    );

    //signup Button
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signUp(emailEditingController.text,passwordEditingController.text);
        },
        child: const Text("SignUp", textAlign: TextAlign.center,
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
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.redAccent),
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
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    nameField,
                    const SizedBox(height: 25),
                    emailField,
                    const SizedBox(height: 25),
                    passwordField,
                    const SizedBox(height: 25),
                    confirmPasswordField,
                    const SizedBox(height: 35),
                    cityField,
                    const SizedBox(height: 25),
                    phonenoField,
                    const SizedBox(height: 25),

                    signUpButton,
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

  void signUp(String email, String password) async {
    final prefs = await _prefs;
    DateTime dateTime = DateTime.now();
    prefs.setString('timer', dateTime.toString());
    if(_formKey.currentState!.validate()) {
      try {
        await _auth.createUserWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
          postDetailsToFirestore()
        });
      } on FirebaseAuthException catch(ex) {
        if(ex.code == 'email-already-in-use') {
          Fluttertoast.showToast(msg: "User already registered");
        }
        else if(ex.code == 'network-request-failed') {
          Fluttertoast.showToast(msg: "Check internet connection");
        }
        else {
          Fluttertoast.showToast(msg: ex.code.toString());
        }
      }
    }
  }

  postDetailsToFirestore() async {
    //calling our firestore
    //calling our user model
    //sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();

    //writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = nameEditingController.text;
    userModel.city = cityEditingController.text;
    userModel.phoneno = phonenoEditingController.text;



    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toJson());
    Fluttertoast.showToast(msg: "Account created successfully");

    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
        builder: (context) => const HomeScreen()), (route) => false);
  }
}






