import 'package:skin_cancer_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:skin_cancer_app/pages/prediction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => HomePage(),
        '/prediction':(context) => Prediction(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}