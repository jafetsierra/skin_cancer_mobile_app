import 'package:flutter/material.dart';
import 'package:skin_cancer_app/utils/appbar.dart';
import 'package:skin_cancer_app/utils/goHomePage.dart';
import 'package:skin_cancer_app/utils/goDiagnosisPage.dart';

class ResultPage extends StatefulWidget {
  final rta;
  final Color primaryColor ;
  final Color secondaryColor ; 
  final Color auxColor;
  final Color textColor;

  const ResultPage({Key? key,
    this.rta, 
    required this.primaryColor,
    required this.secondaryColor,
    required this.auxColor,
    required this.textColor,

  }) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: 
       Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/images/background.jpg'),
              fit: BoxFit.cover
            ),
          ),
        child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(widget.rta,
              style: TextStyle(color: widget.textColor),),
              GoDiagnosisPage(primaryColor: widget.primaryColor, secondaryColor: widget.secondaryColor, auxColor: widget.auxColor, textColor: widget.textColor),
              GoHomePage(primaryColor: widget.primaryColor, secondaryColor: widget.secondaryColor, auxColor: widget.auxColor, textColor: widget.textColor),
            ],
          ),
        ),
      ),
    );
  }
}