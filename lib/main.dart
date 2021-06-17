import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foryou/constants/Constantcolors.dart';
import 'package:foryou/screens/LandingPage/landingServices.dart';
import 'package:foryou/screens/LandingPage/landinghelpers.dart';
import 'package:foryou/screens/SplashScreen/splashscreen.dart';
import 'package:foryou/services/Authentication.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ConstantColors constantColors = ConstantColors();
    return MultiProvider(
      child: MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            accentColor: constantColors.blueColor,
            fontFamily: 'Poppins',
            canvasColor: Colors.transparent),
      ),
      providers: [
        ChangeNotifierProvider(create: (_) => LanginHelpers()),
        ChangeNotifierProvider(create: (_) => LandingService()),
        ChangeNotifierProvider(create: (_) => Authentication()),
      ],
    );
  }
}
