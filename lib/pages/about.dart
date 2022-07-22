import 'package:skin_cancer_app/utils/appbar.dart';
import 'package:skin_cancer_app/utils/goDiagnosisPage.dart';
import 'package:skin_cancer_app/utils/listcat.dart';
import 'package:flutter/material.dart';
import 'package:skin_cancer_app/utils/goHomePage.dart';


class AboutPage extends StatefulWidget {
  final Color primaryColor ;
  final Color secondaryColor ; 
  final Color auxColor;
  final Color textColor;

  const AboutPage({Key? key, 
    required this.primaryColor,
    required this.secondaryColor,
    required this.auxColor,
    required this.textColor,

  }) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/images/background.jpg'),
              fit: BoxFit.cover
              ),   
          ),
          child: Column(
            children: [
              //*************appbar
              CustomAppBar(primaryColor: widget.primaryColor, secondaryColor: widget.secondaryColor, auxColor: widget.auxColor,textcolor: widget.textColor,),
              const SizedBox(height: 30,),
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
                    height: 315,
                    child: Column(
                      children: [
                        const Text('Types of lesions',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                        const SizedBox(height: 10,),
                        Image.asset('lib/images/dic.png',height: 180,),
                        const SizedBox(height: 5,),
                        Text("The model is able to diagnose 7 diferent types of skin lesions. Even though it has an accuracy above 90% it's just for prevention. Do not use as a final diagnose and pay your demartologist a visit in case of suspicion of cancer.",
                            style: TextStyle(color: Colors.white),),
                        // Text('Checkout the official repository for a better insight and specific information',
                        //   style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: widget.textColor),
                        //   overflow: TextOverflow.ellipsis,
                        // )

                      ],
                    ),
                ),
              ),

              Padding(padding: EdgeInsets.all(10),
                child: Container(
                  child: Text('The API was build using transfer learning techique with RestNet50 V2 as the base model. For further information please go to the official repository at -> ',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: widget.textColor),
                  ),
                ),
              ),

              ///---------diagnosis page
              GoDiagnosisPage(primaryColor: widget.primaryColor, secondaryColor: widget.secondaryColor, auxColor: widget.auxColor, textColor: widget.textColor),
              ///---------Home page
              GoHomePage(primaryColor: widget.primaryColor, secondaryColor: widget.secondaryColor, auxColor: widget.auxColor, textColor: widget.textColor)
            ],
          ),
        ),
      ),

    );
  }
}