import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:skin_cancer_app/utils/appbar.dart';
import 'dart:io';

import 'package:skin_cancer_app/utils/diagnose.dart';
import 'package:skin_cancer_app/utils/result.dart';

class Prediction extends StatefulWidget {
  Prediction({Key? key}) : super(key: key);

  @override
  State<Prediction> createState() => _PredictionState();
}

class _PredictionState extends State<Prediction> {
  
  ///file variable
  PlatformFile? pickedFile;
  final String url = "https://skin-cancer-img.herokuapp.com/";
  ///color theme 
  final Color primaryColor   = Colors.white;
  final Color secondaryColor = Colors.cyan.shade200; 
  final Color auxColor       = Colors.indigo.shade300;
  
  ///file selection from galery
  Future selectFile() async{
    final result =  await FilePicker.platform.pickFiles(type: FileType.image);
    if (result==null) return;
    setState(() {
      pickedFile = result.files.first; 
    });
  }
  ///make a prediction with tensorflow model endpoint
  String makePrediction(){
    return 'prediction made';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [primaryColor,secondaryColor,auxColor])
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomAppBar(primaryColor: primaryColor, secondaryColor: secondaryColor, auxColor: auxColor),
              const SizedBox(height: 30,),
              ///if the file was upload or selected i'll be displayed on the screen
              if (pickedFile != null)
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 300,
                        color: secondaryColor,
                        child: //Text(pickedFile!.name)
                          //Text('${pickedFile.runtimeType}'),
                          Image.file(
                            File(pickedFile!.path.toString()),
                            fit: BoxFit.cover,
                          )
                      ),
                      ///button for prediction or diagnosis
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: auxColor,
                                blurRadius: 5,
                                spreadRadius: 1,
                                offset: Offset(0,7)
                                )
                            ]
                          ),
                          child: ElevatedButton(
                            onPressed: () async{
                              var response = await sendImage(url, pickedFile!.path.toString());
                              print(response.statusCode);
                              var values = json.decode(response.body);
                              print(values.runtimeType);
                              showDialog(context: context, 
                                builder: (BuildContext context) => predictionResult(context, values.toString()));
                              
                            },
                            child: const Text('Make prediction',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                            style: ElevatedButton.styleFrom(
                              primary: auxColor,
                              shadowColor: primaryColor,
                              minimumSize: Size(300, 100),
                            )
                          ),
                        ),
                      )
                    ],
                  ),
                ),

              ///Diagnosis container
              if (pickedFile ==null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      boxShadow: [BoxShadow(
                        color: auxColor,
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0,0)
                      ),]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(onPressed: selectFile , child: const Text('Select File'),style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(250,100)),),),
                        ],
                    )
                  ),
                ),
              ///return to the home page
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20.0),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  height: 90,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(12),
                     boxShadow: [
                      BoxShadow(
                        color: auxColor,
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 7), // changes position of shadow
                        )
                     ]
                    ),
                  child: Row(
                    children: [
                      //text
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [       
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [BoxShadow(
                                  color: auxColor,
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(0,7)
                                  )]),
                              child: Center(
                                child: 
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: 
                                    Expanded(
                                      child: Text(
                                        'Return Home',
                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                      ),
                                    )
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30,),

            ]
          ),
        )
        ),
    );
  }
}