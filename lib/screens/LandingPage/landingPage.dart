import 'package:flutter/material.dart';
import 'package:foryou/constants/Constantcolors.dart';
import 'package:foryou/screens/LandingPage/landinghelpers.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ConstantColors constantColors = ConstantColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.darkColor,
      body: Stack(
        children: [
          bogyColor(),
          Provider.of<LanginHelpers>(context, listen: false).bodyImage(context),
          Provider.of<LanginHelpers>(context, listen: false)
              .tagLineText(context),
          Provider.of<LanginHelpers>(context, listen: false)
              .mainButtons(context),
          Provider.of<LanginHelpers>(context, listen: false)
              .privacyText(context),
        ],
      ),
    );
  }

  bogyColor() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
            0.5,
            0.9
          ],
              colors: [
            constantColors.darkColor,
            constantColors.blueGreyColor
          ])),
    );
  }
}
