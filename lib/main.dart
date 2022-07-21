import 'package:skin_cancer_app/pages/about.dart';
import 'package:skin_cancer_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:skin_cancer_app/pages/prediction.dart';
import 'package:skin_cancer_app/pages/test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Color primaryColor   = Colors.white.withOpacity(0.1);
  final Color secondaryColor = Colors.cyan.withOpacity(0.5); 
  final Color auxColor       = Colors.indigo.withOpacity(0.2);
  static Color textColor     = Colors.white;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => HomePage(primaryColor: primaryColor,secondaryColor: secondaryColor,auxColor: auxColor,textColor: textColor,),
        '/prediction':(context) => Prediction(primaryColor: primaryColor,secondaryColor: secondaryColor,auxColor: auxColor,textColor: textColor,),
        '/about':(context) => AboutPage(primaryColor: primaryColor, secondaryColor: secondaryColor, auxColor: auxColor, textColor: textColor),
        '/test': (context) => Test()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}