import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foryou/constants/Constantcolors.dart';
import 'package:foryou/screens/Home/home.dart';
import 'package:foryou/screens/LandingPage/landingServices.dart';
import 'package:foryou/screens/LandingPage/landingUtils.dart';
import 'package:foryou/screens/LandingPage/landinghelpers.dart';
import 'package:foryou/screens/SplashScreen/splashscreen.dart';
import 'package:foryou/services/Authentication.dart';
import 'package:foryou/services/FirebaseOperations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event != null) {
        setState(() {
          isLoggedIn = true;
        });
      } else {
        setState(() {
          isLoggedIn = false;
        });
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    ConstantColors constantColors = ConstantColors();
    return MultiProvider(
      child: MaterialApp(
        home: isLoggedIn == true ? Home() : SplashScreen(),
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
        ChangeNotifierProvider(create: (_) => FirebaseOperations()),
        ChangeNotifierProvider(create: (_) => LandingUtils()),
      ],
    );
  }
}
