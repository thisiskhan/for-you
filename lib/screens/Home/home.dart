import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:eva_icons_flutter/icon_data.dart';
import 'package:flutter/material.dart';
import 'package:foryou/constants/Constantcolors.dart';
import 'package:foryou/screens/LandingPage/landingPage.dart';
import 'package:foryou/services/Authentication.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConstantColors constantColors = ConstantColors();
    return Scaffold(
      backgroundColor: constantColors.darkColor,
      body: AppBar(
        backgroundColor: constantColors.darkColor,
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<Authentication>(context, listen: false)
                    .signOutFromGoogle()
                    .then((value) {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: LandingPage(),
                          type: PageTransitionType.rightToLeft));
                });
              },
              icon: Icon(EvaIcons.logOut))
        ],
      ),
    );
  }
}
