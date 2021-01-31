import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bloomplus/landing-page/LandingScreen.dart';
import 'package:bloomplus/user-screens/EducationScreen.dart';
import 'package:bloomplus/user-screens/HomeScreen.dart';
import 'package:bloomplus/user-screens/DietScreen.dart';
import 'package:bloomplus/user-screens/ExerciseScreen.dart';
import 'package:bloomplus/user-screens/RelaxScreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_icons/flutter_icons.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[

        // Background color
        Container(
          color: Colors.white, //
        ),

        // Top
        Align(
          alignment: Alignment(0,-1),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.deepPurple,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 6,
                    spreadRadius: 3,
                    offset: Offset(0, 3),
                  ),
                ]),
          ),
        ),


        // Bottom
        Align(
          alignment: Alignment(0,1),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.075,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.deepPurple,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 6,
                    spreadRadius: 3,
                    offset: Offset(0, -3),
                  ),
                ]),
          ),
        ),


        // Welcome Text
        Align(
          alignment: Alignment(0,-0.85),
          child: Text(
            "Welcome",
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 20,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),


        // Logout
        Align(
          alignment: Alignment(-1,-0.885),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 0),
            width: MediaQuery.of(context).size.width * 0.25,
            child: FlatButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LandingScreen()));
              },
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              color: Color(0x00000000),
              child: Text(
                "LOGOUT",
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),


        // Image
        Align(
          alignment: Alignment(0.95,-0.9),
          child: Image.asset(
            "assets/images/bloomplus.png",
            height: MediaQuery.of(context).size.height * 0.1,
          ),
        ),




        // Home Button
        Align(
          alignment: Alignment(0,1),
          child: IconButton(
            icon: Icon(
              FontAwesome5Solid.home,
            ),
            iconSize: 45,
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
            },
          ),
        ),


        // Brain Button
        Align(
          alignment: Alignment(-0.5,1),
          child: IconButton(
            icon: Icon(
              FontAwesome5Solid.brain,
            ),
            iconSize: 45,
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => RelaxScreen()));
            },
          ),
        ),


        // Exercise Button
        Align(
          alignment: Alignment(0.5,1),
          child: IconButton(
            icon: Icon(
              FontAwesome5Solid.running,
            ),
            iconSize: 45,
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ExerciseScreen()));
            },
          ),
        ),


        // Education Button
        Align(
          alignment: Alignment(-1,1),
          child: IconButton(
            icon: Icon(
              FlutterIcons.md_journal_ion,
            ),
            iconSize: 45,
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => EducationScreen()));
            },
          ),
        ),


        // Diet Button
        Align(
          alignment: Alignment(1,1),
          child: IconButton(
            icon: Icon(
              MaterialCommunityIcons.food,
            ),
            iconSize: 50,
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => DietScreen()));
            },
          ),
        ),


        // Circle 1
        Align(
          alignment: Alignment(0,0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.45,
            height: MediaQuery.of(context).size.height * 0.45,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepPurple,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 6,
                    spreadRadius: 3,
                    offset: Offset(0, 3),
                  ),
                ]),
            child: Icon(Icons.person, size: 150,color: Colors.white,),
          ),
        ),


        // Circle 2
        Align(
          alignment: Alignment(0.8,-0.5),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.25,
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 6,
                    spreadRadius: 3,
                    offset: Offset(0, 3),
                  ),
                ]),
            child: Icon(FontAwesomeIcons.brain, size: 50,),
          ),
        ),

        // Circle 3
        Align(
          alignment: Alignment(-0.8,-0.5),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.25,
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 6,
                    spreadRadius: 3,
                    offset: Offset(0, 3),
                  ),
                ]),
            child: Icon(FontAwesomeIcons.running, size: 50,),
          ),
        ),

        // Circle 4
        Align(
          alignment: Alignment(0.8,0.5),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.25,
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 6,
                    spreadRadius: 3,
                    offset: Offset(0, 3),
                  ),
                ]),
            child: Icon(MaterialCommunityIcons.food, size: 70,),
          ),
        ),

        // Circle 5
        Align(
          alignment: Alignment(-0.8,0.5),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.25,
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 6,
                    spreadRadius: 3,
                    offset: Offset(0, 3),
                  ),
                ]),
            child: Icon(Ionicons.md_journal, size: 50,),
          ),
        ),

        // Text
        Align(
          alignment: Alignment(0,-0.63),
          child: Text(
            "Your Overall Summary",
            style: GoogleFonts.roboto(
              color: Colors.blueGrey,
              letterSpacing: 1,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),








      ],),


    );
  }
}
