import 'package:flutter/material.dart';
import 'package:bloomplus/landing-page/LandingScreen.dart';

void main() {
  runApp(BoomPlusApp());
}

class BoomPlusApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingScreen(),
    );
  }
}
