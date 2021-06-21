import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:foryou/constants/Constantcolors.dart';
import 'package:foryou/screens/Home/home.dart';
import 'package:foryou/services/Authentication.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class LandingService with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  ConstantColors constantColors = ConstantColors();

  signInSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 150, vertical: 10),
                    child: Divider(
                      thickness: 4.0,
                      color: constantColors.whiteColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Container(
                      child: Wrap(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: emailController,
                              autofocus: true,
                              decoration: InputDecoration(
                                hintText: "Enter Email....",
                                hintStyle: TextStyle(
                                    color: constantColors.whiteColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                                prefixIcon: Icon(
                                  EvaIcons.email,
                                  color: constantColors.whiteColor,
                                ),
                              ),
                              style: TextStyle(
                                  color: constantColors.whiteColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: passwordController,
                              obscureText: true,
                              autofocus: true,
                              decoration: InputDecoration(
                                hintText: "Enter Passwors....",
                                hintStyle: TextStyle(
                                    color: constantColors.whiteColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                                prefixIcon: Icon(
                                  EvaIcons.lock,
                                  color: constantColors.whiteColor,
                                ),
                              ),
                              style: TextStyle(
                                  color: constantColors.whiteColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 30),
                                child: FloatingActionButton(
                                    backgroundColor: constantColors.blueColor,
                                    onPressed: () {
                                      if (emailController.text.isNotEmpty &&
                                          passwordController.text.length > 6) {
                                        Provider.of<Authentication>(context,
                                                listen: false)
                                            .loginWithEmail(
                                                emailController.text,
                                                passwordController.text)
                                            .whenComplete(() {
                                          Navigator.pushReplacement(
                                              context,
                                              PageTransition(
                                                  child: Home(),
                                                  type:
                                                      PageTransitionType.fade));
                                        });
                                      } else {
                                        warningText(
                                            context, "something went wrong!");
                                      }
                                    },
                                    child: Icon(
                                      Icons.done,
                                      color: constantColors.whiteColor,
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: constantColors.blueGreyColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
            ),
          );
        });
  }

  signUpSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 150, vertical: 10),
                    child: Divider(
                      thickness: 4.0,
                      color: constantColors.whiteColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Container(
                      child: Wrap(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://avatars.githubusercontent.com/u/72858063?s=60&v=4"),
                                radius: 40,
                                backgroundColor: Colors.black
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: emailController,
                              autofocus: true,
                              decoration: InputDecoration(
                                hintText: "Enter Email....",
                                hintStyle: TextStyle(
                                    color: constantColors.whiteColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                                prefixIcon: Icon(
                                  EvaIcons.email,
                                  color: constantColors.whiteColor,
                                ),
                              ),
                              style: TextStyle(
                                  color: constantColors.whiteColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: passwordController,
                              obscureText: true,
                              autofocus: true,
                              decoration: InputDecoration(
                                hintText: "Enter Passwors....",
                                hintStyle: TextStyle(
                                    color: constantColors.whiteColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                                prefixIcon: Icon(
                                  EvaIcons.lock,
                                  color: constantColors.whiteColor,
                                ),
                              ),
                              style: TextStyle(
                                  color: constantColors.whiteColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 30),
                                  child: FloatingActionButton(
                                    onPressed: () {
                                      if (emailController.text.isNotEmpty) {
                                        Provider.of<Authentication>(context,
                                                listen: false)
                                            .registerWithEmail(
                                                emailController.text,
                                                passwordController.text)
                                            .then((value) {
                                          Navigator.pushReplacement(
                                              context,
                                              PageTransition(
                                                  child: Home(),
                                                  type:
                                                      PageTransitionType.fade));
                                        });
                                      } else {
                                        warningText(
                                            context, "Fill all the data");
                                      }
                                    },
                                    backgroundColor: constantColors.blueColor,
                                    child: Icon(
                                      Icons.done,
                                      color: constantColors.whiteColor,
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: constantColors.blueGreyColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
            ),
          );
        });
  }

  warningText(BuildContext context, String warning) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                warning,
                style: TextStyle(
                    color: constantColors.whiteColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          );
        });
  }
}
