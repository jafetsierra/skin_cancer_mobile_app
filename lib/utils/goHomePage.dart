import 'package:flutter/material.dart';

class GoHomePage extends StatelessWidget {

  final Color primaryColor ;
  final Color secondaryColor ; 
  final Color auxColor;
  final Color textColor;

  GoHomePage({
    required this.primaryColor,
    required this.secondaryColor,
    required this.auxColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(20.0),
          primary: textColor,
          textStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
          backgroundColor: primaryColor,
          shadowColor:auxColor,
          elevation: 20
        ),
        onPressed: () => Navigator.pushNamed(context, '/'),
        child: const Text('Return to HomePage'),
      ),
    );
  }
}