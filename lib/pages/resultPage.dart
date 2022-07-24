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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomAppBar(primaryColor: widget.primaryColor, secondaryColor: widget.secondaryColor, auxColor: widget.auxColor,textcolor: widget.textColor,),
              Text('The Diagnosis is '+widget.rta.substring(25,27)+', with a probability of '+widget.rta.substring(28,35),
              style: TextStyle(color: widget.textColor,fontWeight: FontWeight.bold,fontSize: 25),),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20.0),
                child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: widget.primaryColor, boxShadow: [
                      BoxShadow(
                        color: widget.auxColor,
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(0, 7), // changes position of shadow
                        ),
                    ],
                    borderRadius: BorderRadius.circular(10)),
                    height: 350,
                    child: Column(
                      children: [
                        const Text('How to interpretate the results',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                        const SizedBox(height: 10,),
                        Image.asset('lib/images/dic.png',height: 180,),
                        const SizedBox(height: 5,),
                        const Text("The model is able to diagnose 7 diferent types of skin lesions. The name indicates the type, and the number indicates what the model think is the probability of that particular lesion in a range (0-1). Even though it has an accuracy above 90% it's just for prevention. Do not use as a final diagnose and pay your demartologist a visit in case of suspicion of cancer.",
                            style: TextStyle(color: Colors.white),),
                      ],
                    ),
                ),
              ),
              GoDiagnosisPage(primaryColor: widget.primaryColor, secondaryColor: widget.secondaryColor, auxColor: widget.auxColor, textColor: widget.textColor),
              GoHomePage(primaryColor: widget.primaryColor, secondaryColor: widget.secondaryColor, auxColor: widget.auxColor, textColor: widget.textColor),
            ],
          ),
        ),
      ),
    );
  }
}