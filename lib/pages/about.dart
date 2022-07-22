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