import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foryou/constants/Constantcolors.dart';
import 'package:foryou/screens/Home/home.dart';
import 'package:foryou/screens/LandingPage/landingPage.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  ConstantColors constantColors = ConstantColors();
  @override
  void initState() {
    // TODO: implement initState
    Timer(
        Duration(seconds: 1, milliseconds: 50),
        () => Navigator.pushReplacement(
            context,
            PageTransition(
                child: LandingPage(), type: PageTransitionType.topToBottom)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: constantColors.darkColor,
      body: Column(
        children: [
          Center(
            child: Container(
              height: size.height * 0.6,
              child: Image.asset("assets/images/splash.png"),
            ),
          ),
          Container(
              height: size.height * 0.1,
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "for",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: size.height * 0.07,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: "You!",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: constantColors.blueColor,
                          fontSize: size.height * 0.07,
                          fontWeight: FontWeight.bold))
                ]),
              )),
        ],
      ),
    );
  }
}
