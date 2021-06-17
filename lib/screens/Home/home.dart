import 'package:flutter/material.dart';
import 'package:foryou/constants/Constantcolors.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConstantColors constantColors = ConstantColors();
    return Scaffold(
      backgroundColor: constantColors.darkColor,
    );
  }
}
