import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:skin_cancer_app/utils/appbar.dart';

class Prediction extends StatefulWidget {
  Prediction({Key? key}) : super(key: key);

  @override
  State<Prediction> createState() => _PredictionState();
}

class _PredictionState extends State<Prediction> {
  PlatformFile? pickedFile;

  final Color primaryColor   = Colors.white;
  final Color secondaryColor = Colors.cyan.shade200; 
  final Color auxColor       = Colors.indigo.shade300;
  
  Future selectFile() async{
    final result =  await FilePicker.platform.pickFiles();
    if (result==null) return;
    setState(() {
      pickedFile = result.files.first; 
    });
  }
  Future uploadFile() async {
    
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
              if (pickedFile != null)
                Expanded(
                  child: Container(
                    color: secondaryColor,
                    child: Text(pickedFile!.name)
                  ),
                ),
              //Diagnosis container
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20.0),
                child: Container(
                  height: 120,
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
                      ElevatedButton(onPressed: selectFile , child: const Text('Select File')),
                      ElevatedButton(onPressed: uploadFile, child: const Text('Update File')),
                    ],
                  )
                ),
              ),
  

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