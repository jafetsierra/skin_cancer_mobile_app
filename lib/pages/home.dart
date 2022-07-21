import 'package:skin_cancer_app/utils/appbar.dart';
import 'package:skin_cancer_app/utils/listcat.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  final Color primaryColor ;
  final Color secondaryColor ; 
  final Color auxColor;
  final Color textColor;

  const HomePage({Key? key, 
    required this.primaryColor,
    required this.secondaryColor,
    required this.auxColor,
    required this.textColor,

  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
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
                                Text('Deep neural network for skin cancer diagnosis and prevention',
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: widget.textColor),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(height: 10,),
                                    Text('V_003',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: widget.textColor),),
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
                  children: [
                    Text('Technologies and Libraries used',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: widget.textColor),),
                    Text('References',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300, color: widget.textColor),)
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
                    ListCat(imgPath: 'lib/icons/tensorflow-icon.png',category: 'Tensorflow',primaryColor: widget.primaryColor,secondaryColor: widget.secondaryColor,auxColor: widget.auxColor,textcolor: widget.textColor,),
                    ListCat(imgPath: 'lib/icons/python.png',category: 'Python',primaryColor: widget.primaryColor,secondaryColor: widget.secondaryColor,auxColor: widget.auxColor,textcolor: widget.textColor,),
                    ListCat(imgPath: 'lib/icons/flutter-icon.png',category: 'Flutter',primaryColor: widget.primaryColor,secondaryColor: widget.secondaryColor,auxColor: widget.auxColor,textcolor: widget.textColor,),
                    ListCat(imgPath: 'lib/icons/docker-icon.png',category: 'Docker',primaryColor: widget.primaryColor,secondaryColor: widget.secondaryColor,auxColor: widget.auxColor,textcolor: widget.textColor,),
                    ListCat(imgPath: 'lib/icons/github.png',category: 'GitHub',primaryColor: widget.primaryColor,secondaryColor: widget.secondaryColor,auxColor: widget.auxColor,textcolor: widget.textColor,),
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
                    color: widget.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                     boxShadow: [
                      BoxShadow(
                        color: widget.auxColor,
                        spreadRadius: 1,
                        blurRadius: 1,
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
                            Text('Make a diagnosis',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, color: widget.textColor,),),
                            const SizedBox(height: 10,),
                            Text('Upload an image to make a diagnosis.',style: TextStyle(color: widget.textColor,),),
                            const SizedBox(height: 10,),
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: widget.secondaryColor,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [BoxShadow(
                                  color: widget.auxColor,
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(0,7)
                                  )]),
                              child: Center(
                                child: 
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/prediction');
                                  },
                                  child: 
                                      Expanded(
                                      child: Text(
                                        'Diagnose',
                                        style: TextStyle(color: widget.textColor,fontWeight: FontWeight.bold),
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
                    color: widget.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                                  BoxShadow(
                                    color: widget.auxColor,
                                    spreadRadius: 1,
                                    blurRadius: 1,
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
                            Text('About the project',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: widget.textColor,),),
                            const SizedBox(height: 10,),
                            Text('How the model was made and more.',style: TextStyle(color: widget.textColor,),),
                            const SizedBox(height: 10,),
                            Container(
                              height: 50,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: widget.secondaryColor, 
                                boxShadow: [
                                  BoxShadow(
                                    color: widget.auxColor,
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(0, 7), // changes position of shadow
                                    ),
                              ],
                              borderRadius: BorderRadius.circular(12)),
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/about');
                                  },
                                  child: 
                                      Text(
                                        'About and documentation',
                                        style: TextStyle(color: widget.textColor,fontWeight: FontWeight.bold),
                                      ),
                                ),
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