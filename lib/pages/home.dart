import 'package:skin_cancer_app/utils/appbar.dart';
import 'package:skin_cancer_app/utils/listcat.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color primaryColor   = Colors.white;
  final Color secondaryColor = Colors.cyan.shade200; 
  final Color auxColor       = Colors.indigo.shade300;
  final Color textColor      = Colors.orangeAccent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomRight,colors: [primaryColor,secondaryColor,auxColor]),
          ),
          child: Column(
            children: [
              //*************appbar
              CustomAppBar(primaryColor: primaryColor, secondaryColor: secondaryColor, auxColor: auxColor),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20.0),
                child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: primaryColor, boxShadow: [
                      BoxShadow(
                        color: auxColor,
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 7), // changes position of shadow
                        ),
                    ],
                    borderRadius: BorderRadius.circular(12)),
                    height: 120,
                    child: Row(
                      children: [
                        Image.asset('lib/images/skin.jpg'),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Deep neural network for skin cancer diagnosis and prevention',
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    SizedBox(height: 10,),
                                    Text('V_003',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                ),
              ),


              const SizedBox(height: 30,),


              ///libraries used
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:22.0),
                child: Container(child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Technologies and Libraries used',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                    Text('References',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300),)
                  ],
                ),),
              ),
              const SizedBox(height: 5,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ListCat(imgPath: 'lib/icons/tensorflow-icon.png',category: 'Tensorflow',primaryColor: primaryColor,secondaryColor: secondaryColor,auxColor: auxColor,),
                    ListCat(imgPath: 'lib/icons/python.png',category: 'Python',primaryColor: primaryColor,secondaryColor: secondaryColor,auxColor: auxColor,),
                    ListCat(imgPath: 'lib/icons/flutter-icon.png',category: 'Flutter',primaryColor: primaryColor,secondaryColor: secondaryColor,auxColor: auxColor,),
                    ListCat(imgPath: 'lib/icons/docker-icon.png',category: 'Docker',primaryColor: primaryColor,secondaryColor: secondaryColor,auxColor: auxColor,),
                    ListCat(imgPath: 'lib/icons/github.png',category: 'GitHub',primaryColor: primaryColor,secondaryColor: secondaryColor,auxColor: auxColor,),
                  ]
                ),
              ),


              const SizedBox(height: 30,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20.0),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  height: 160,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(12),
                     boxShadow: [
                      BoxShadow(
                        color: auxColor,
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 7), // changes position of shadow
                        )
                     ]
                    ),
                  child: Row(
                    children: [
                      //picture
                      Image.asset('lib/icons/skin.png'),
                      const SizedBox(width: 15,),
                      //text
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            const Text('Make a diagnosis',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            const SizedBox(height: 10,),
                            const Text('Upload an image to make a diagnosis.'),
                            const SizedBox(height: 10,),
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
                                    Navigator.pushNamed(context, '/prediction');
                                  },
                                  child: 
                                      const Expanded(
                                      child: Text(
                                        'Diagnose',
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


              SizedBox(height: 30,),


              ///---------About
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20.0),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color:primaryColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                                  BoxShadow(
                                    color: auxColor,
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: const Offset(0, 7), // changes position of shadow
                                    ),
                              ]),
                  child: Row(
                    children: [
                      //picture
                      //text
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:  [
                            const Text('About the project',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            const SizedBox(height: 10,),
                            const Text('How the model was made and more.'),
                            const SizedBox(height: 10,),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: secondaryColor, 
                                boxShadow: [
                                  BoxShadow(
                                    color: auxColor,
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: const Offset(0, 7), // changes position of shadow
                                    ),
                              ],
                              borderRadius: BorderRadius.circular(12)),
                              child: const Center(child: Text('About an docs',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}