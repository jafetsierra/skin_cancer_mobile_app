import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:skin_cancer_app/pages/resultPage.dart';
import 'package:skin_cancer_app/utils/appbar.dart';
import 'dart:io';
import 'package:skin_cancer_app/utils/diagnose.dart';
import 'package:skin_cancer_app/utils/goHomePage.dart';
import 'package:skin_cancer_app/utils/result.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Prediction extends StatefulWidget {
  final Color primaryColor ;
  final Color secondaryColor ; 
  final Color auxColor;
  final Color textColor;

  const Prediction({Key? key, 
    required this.primaryColor,
    required this.secondaryColor,
    required this.auxColor,
    required this.textColor,

  }) : super(key: key);

  @override
  State<Prediction> createState() => _PredictionState();
}

class _PredictionState extends State<Prediction> {
  
  ///file variable
  final spinkit = SpinKitFadingCircle(
    //color: Colors.white,
    size: 60,
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven ? Colors.white : Colors.cyan,
            shape: BoxShape.circle,

          ),
        );
      },
    );
  bool isLoading = false;
  PlatformFile? pickedFile;
  final String url = "https://skin-cancer-preimg.herokuapp.com/";

  ///file selection from galery
  Future selectFile() async{
    final result =  await FilePicker.platform.pickFiles(type: FileType.image);
    if (result==null) return;
    setState(() {
      pickedFile = result.files.first; 
    });
  }
  ///make a prediction with tensorflow model endpoint
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomAppBar(primaryColor: widget.primaryColor, secondaryColor: widget.secondaryColor, auxColor: widget.auxColor,textcolor: widget.textColor,),
              const SizedBox(height: 30,),
              ///if the file was upload or selected i'll be displayed on the screen
              if (pickedFile != null)
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 300,
                        color: widget.secondaryColor,
                        child: //Text(pickedFile!.name)
                          //Text('${pickedFile.runtimeType}'),
                          Image.file(
                            File(pickedFile!.path.toString()),
                            fit: BoxFit.cover,
                          )
                      ),
                      ///button for prediction or diagnosis
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(20.0),
                            primary: widget.textColor,
                            textStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                            backgroundColor: widget.secondaryColor,
                            shadowColor: widget.auxColor,
                            elevation: 20
                          ),
                          onPressed: () async{
                            setState(() {
                              isLoading = true;
                            });
                            var response = await sendImage(url, pickedFile!.path.toString());
                            if (response.statusCode!=200){
                              showDialog(context: context, 
                              builder: (BuildContext context) => errorResult(context, response.statusCode.toString()));
                            }
                            else {
                              var values = json.decode(response.body);
                              values.forEach((k,v) => print(v['prediction'].toString()));
                              //go to the response page
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ResultPage(rta: values.toString(), primaryColor: widget.primaryColor, secondaryColor: widget.secondaryColor, auxColor: widget.auxColor, textColor: widget.textColor))
                              );
                              //showDialog(context: context, 
                              //builder: (BuildContext context) => predictionResult(context, values.toString()));
                            }
                            setState(() {
                              isLoading = false;
                            });
                          },
                          child: isLoading
                            ? spinkit
                            : const Text('Make Diagnosis'),
                        ),
                      )
                    ],
                  ),
                ),

              ///Diagnosis container
              if (pickedFile == null)
                Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(20.0),
                            primary: widget.textColor,
                            textStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                            backgroundColor: widget.secondaryColor,
                            shadowColor:widget.auxColor,
                            elevation: 20
                          ),
                          onPressed: selectFile,
                          child: const Text('Select file from galery'),
                        ),
                      ),
              if (pickedFile == null)
                Padding(padding: EdgeInsets.symmetric(horizontal:30),
                  child: Text(
                    'Select a photo as close to the skin lesion as posible. Hint(use the "macro" camera for better results.)',
                    style: TextStyle(color: widget.textColor,fontWeight: FontWeight.bold,fontSize: 18),),
                ),
              ///return to the home page
              GoHomePage(primaryColor: widget.primaryColor, secondaryColor: widget.secondaryColor, auxColor: widget.auxColor, textColor: widget.textColor),
              const SizedBox(height: 50,),

            ]
          ),
        )
        ),
    );
  }
}