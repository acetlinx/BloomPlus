import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bloomplus/landing-page/LandingScreen.dart';
import 'package:bloomplus/user-screens/HomeScreen.dart';
import 'package:bloomplus/user-screens/DietScreen.dart';
import 'package:bloomplus/user-screens/ExerciseScreen.dart';
import 'package:bloomplus/user-screens/RelaxScreen.dart';
import 'package:bloomplus/user-screens/EducationScreen.dart';


class ExerciseScreen extends StatefulWidget {
  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  List todos = List();
  String input = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todos.add("Push-Ups:30\nSit-Ups:50\nDate:1/30/2021");
    todos.add("Push-Ups:30\nSit-Ups:50\nRunning:5km in 1.0Hrs\nDate:2/1/2021");
    todos.add("Push-Ups:50\nSit-Ups:80\nDate:2/3/2021");
    todos.add("Lunges:30\nPlank:2min\nRussian Twist:30\nDate:2/3/2021");
  }

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
            "Exercise Log",
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

        Align(
          alignment: Alignment(0,0.8),
          child: FloatingActionButton(
            onPressed: (){
              showDialog(context: context,builder: (BuildContext context){
                return AlertDialog(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  title: Text("Add Exercise Regime"),
                  content: TextField(
                    onChanged: (String value){
                      input = value;
                    },
                  ),
                  actions: <Widget>[
                    FlatButton(onPressed: (){
                      setState(() {
                        todos.add(input);
                      });
                      Navigator.of(context).pop();
                    }, child: Text("Add")),

                  ],
                );
              });
            },
            child: Icon(
              Icons.add,
            ),
          ),
        ),

        Align(
          alignment: Alignment(0,0),
          child: Container(
            height: MediaQuery.of(context).size.height*0.65,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (BuildContext context, int index){
                return Dismissible(key: Key(todos[index]),
                  child: Card(
                    elevation: 4,
                    margin: EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    child: ListTile(
                        title: Text(todos[index]),
                        trailing: IconButton(icon: Icon(Icons.delete, color: Colors.red,),onPressed: (){
                          setState(() {
                            todos.removeAt(index);
                          });
                        },)
                    ),
                  ),);
              },
            ),

          ),

        ),





      ],),


    );
  }
}
