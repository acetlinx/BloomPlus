import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bloomplus/landing-page/SignUpScreen.dart';
import 'package:bloomplus/landing-page/LandingScreen.dart';
import 'package:bloomplus/user-screens/HomeScreen.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email, password;
  bool saveAttempt = false;
  final loginKey = GlobalKey<FormState>();
  FirebaseAuth _fireAuth = FirebaseAuth.instance;

  void _signIn({String em, String pw}){
    _fireAuth.signInWithEmailAndPassword(email: em, password: pw).then((loginVal){
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
    }).catchError((err){
      print(err.code);
      if((err.code == "ERROR_USER_NOT_FOUND") | (err.code == "ERROR_WRONG_PASSWORD")){
        showCupertinoDialog(context: context, builder: (context){
          return AlertDialog(
            title: Text("Email and/or password is incorrect.\nPlease try again."),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: (){
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: <Widget>[

        // Background color
        Container(
          color: Colors.deepPurple, //
        ),


        // Image
        Align(
          alignment: Alignment(0,-0.8),
          child: Image.asset(
            "assets/images/bloomplus.png",
            height: MediaQuery.of(context).size.height*0.3,
          ),
        ),


        // Sign Up text
        Align(
          alignment: Alignment(0,-0.25),
          child: Text(
            "LOGIN",
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                )
            ),
          ),
        ),


        Form(
          key: loginKey,
          child: Stack(children: <Widget>[

            // Email
            Align(
              alignment: Alignment(0,-0.1),
              child: Container(
                width: 300,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),

                child: TextField(

                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.white70),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)
                    ),
                    border: UnderlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: false,

                  onChanged: (emailValue){
                    setState(() {
                      email = emailValue;
                    });
                  },

                ),
              ),
            ),


            // Password
            Align(
              alignment: Alignment(0,0.1),
              child: Container(
                width: 300,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),

                child: TextField(

                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.white70),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)
                    ),
                    border: UnderlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: true,

                  onChanged: (passValue){
                    setState(() {
                      password = passValue;
                    });
                  },

                ),
              ),
            ),


            Align(
              alignment: Alignment(0,0.4),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 45),
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.17,
                child: RaisedButton(
                  elevation: 5,
                  onPressed: (){
                    _signIn(em: email, pw: password);
                  },
                  padding: EdgeInsets.all(5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.purple,
                  child: Text(
                    "LOGIN",
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),

          ],),
        ),


        // Go Back
        Align(
          alignment: Alignment(0,0.6),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 45),
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.17,
            child: RaisedButton(
              elevation: 5,
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LandingScreen()));
              },
              padding: EdgeInsets.all(5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.grey,
              child: Text(
                "Go Back",
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),

      ],),
    );
  }
}
