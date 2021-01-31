import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:bloomplus/landing-page/SignUpScreen.dart';
import 'package:bloomplus/landing-page/LoginScreen.dart';


class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background color
          Container(
            color: Color(0xFFFFFFFF), // White
          ),

          // Onboarding
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.deepPurple,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 6,
                    spreadRadius: 3,
                    offset: Offset(0, 3),
                  ),
                ]),
            child: Swiper.children(
              autoplay: false,
              pagination: new SwiperPagination(
                alignment: Alignment(0, 0.75),
                margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                builder: new DotSwiperPaginationBuilder(
                  color: Colors.deepPurpleAccent,
                  activeColor: Colors.white70,
                  size: 10.0,
                  activeSize: 15.0,
                ),
              ),
              children: <Widget>[
                Align(
                  alignment: Alignment(0, -0.5),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment(0, -1),
                          child: Image.asset(
                            "assets/images/bloomplus.png",
                            height: 300,
                          ),
                        ),
                        Align(
                          alignment: Alignment(0, 1),
                          child: Text(
                            "Relax, Exercise, and Schedule\nYour Way Out of Stress",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, -0.5),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment(0, -1),
                          child: Image.asset(
                            "assets/images/bloomplus.png",
                            height: 300,
                          ),
                        ),
                        Align(
                          alignment: Alignment(0, 1),
                          child: Text(
                            "A Way for You to Bloom and Grow Away From the Stresses of Your Day",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, -0.5),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment(0, -1),
                          child: Image.asset(
                            "assets/images/bloomplus.png",
                            height: 300,
                          ),
                        ),
                        Align(
                          alignment: Alignment(0, 1),
                          child: Text(
                            "Designed for Busy Students\nLike You",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),





          // Sign Up
          Align(
            alignment: Alignment(0,0.83),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 45),
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.17,
              child: RaisedButton(
                elevation: 5,
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SignUpScreen()));
                },
                padding: EdgeInsets.all(5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.blueGrey,
                child: Text(
                  "SIGN UP",
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),

          // Login
          Align(
            alignment: Alignment(0,1),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 45),
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.17,
              child: RaisedButton(
                elevation: 5,
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen()));;
                },
                padding: EdgeInsets.all(5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.deepPurple,
                child: Text(
                  "LOGIN",
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
