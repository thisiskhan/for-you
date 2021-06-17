import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:foryou/constants/Constantcolors.dart';
import 'package:foryou/screens/Home/home.dart';
import 'package:foryou/screens/LandingPage/landingServices.dart';
import 'package:foryou/services/Authentication.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class LanginHelpers with ChangeNotifier {
  final ConstantColors constantColors = ConstantColors();
  Widget bodyImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/login.png"))),
    );
  }

  Widget tagLineText(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
        top: size.height * 0.53,
        left: size.width * 0.06,
        child: Column(
          children: [
            Container(
                constraints: BoxConstraints(maxWidth: 200),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Welcome, to ",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: "forYou!",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: constantColors.blueColor,
                            fontSize: 40,
                            fontWeight: FontWeight.bold)),
                  ]),
                )),
          ],
        ));
  }

  Widget mainButtons(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
        top: size.height * 0.70,
        //left: size.width * 0.06,
        child: Container(
          width: size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  eamilAuthSheet(context);
                },
                child: Container(
                  child: Icon(
                    EvaIcons.emailOutline,
                    color: constantColors.yellowColor,
                  ),
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: constantColors.yellowColor),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<Authentication>(context, listen: false)
                      .loginWithGoogle()
                      .whenComplete(() {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: Home(), type: PageTransitionType.fade));
                  });
                },
                child: Container(
                  child: Icon(
                    EvaIcons.google,
                    color: constantColors.redColor,
                  ),
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: constantColors.redColor),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  child: Icon(
                    EvaIcons.facebook,
                    color: constantColors.blueColor,
                  ),
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: constantColors.blueColor),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
            ],
          ),
        ));
  }

  Widget privacyText(BuildContext context) {
    _launchURL(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    Size size = MediaQuery.of(context).size;
    return Positioned(
        top: size.height * 0.76,
        left: size.width * 0.2,
        right: size.width * 0.2,
        child: Container(
          child: Column(
            children: [
              Text("By continuing you agree forYou's",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.grey.shade600,
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => _launchURL(
                        "https://uraniummobile.netlify.app/terms-conditions.html"),
                    child: Text("Terms of Services",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: constantColors.blueColor,
                            fontWeight: FontWeight.bold)),
                  ),
                  Text(" • ",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: constantColors.blueColor,
                          fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: () => _launchURL(
                        "https://uraniummobile.netlify.app/privacy-policy.html"),
                    child: Text("Privacy Policy",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: constantColors.blueColor,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  eamilAuthSheet(BuildContext context) {
    _launchURL(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    Size size = MediaQuery.of(context).size;
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 150, vertical: 10),
                  child: Divider(
                    thickness: 4.0,
                    color: constantColors.whiteColor,
                  ),
                ),
                SizedBox(),
                Container(
                  height: size.height * 0.3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/images/bottom_login.png"),
                  )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: RawMaterialButton(
                        fillColor: constantColors.blueColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {
                          Provider.of<LandingService>(context, listen: false)
                              .signInSheet(context);
                        },
                        child: Text(
                          "SignIn",
                          style: TextStyle(
                              color: constantColors.whiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: RawMaterialButton(
                        fillColor: constantColors.blueColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {
                          Provider.of<LandingService>(context, listen: false)
                              .signUpSheet(context);
                        },
                        child: Text(
                          "SignUp",
                          style: TextStyle(
                              color: constantColors.whiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text("By continuing you agree forYou's",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.grey.shade600,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => _launchURL(
                              "https://uraniummobile.netlify.app/terms-conditions.html"),
                          child: Text("Terms of Services",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: constantColors.blueColor,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Text(" • ",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: constantColors.blueColor,
                                fontWeight: FontWeight.bold)),
                        GestureDetector(
                          onTap: () => _launchURL(
                              "https://uraniummobile.netlify.app/privacy-policy.html"),
                          child: Text("Privacy Policy",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: constantColors.blueColor,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            height: size.height * 0.5,
            width: size.width,
            decoration: BoxDecoration(
                color: constantColors.blueGreyColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
          );
        });
  }
}
