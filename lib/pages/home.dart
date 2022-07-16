import 'package:skin_cancer_app/utils/listcat.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            //appbar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //name
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(height: 12,),
                      Text('Welcome to',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      SizedBox(height: 8,),
                      Text('SkinCancer App',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)
                    ],
                  ),
                  //applogo
                  Container(
                    padding: const EdgeInsets.all(5),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[100],
                      borderRadius: BorderRadius.circular(15)
                      ),
                    child: Image.asset('lib/icons/ai.png'))
                ],
              ),
            ),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.0),
              child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.pinkAccent[100],borderRadius: BorderRadius.circular(12)),
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
                                  Text('V_003',style: TextStyle(fontSize: 10),),
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
            //---------About
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.0),
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(color: Colors.deepPurple[100],borderRadius: BorderRadius.circular(12)),
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
                            decoration: BoxDecoration(color: Colors.deepPurple[300],borderRadius: BorderRadius.circular(12)),
                            child: const Center(child: Text('About an docs',style: TextStyle(color: Colors.white),),),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30,),

            //---------card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.0),
              child: Container(
                padding: const EdgeInsets.all(15),
                height: 160,
                decoration: BoxDecoration(color: Colors.deepPurple[100],borderRadius: BorderRadius.circular(12)),
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
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(color: Colors.deepPurple[300],borderRadius: BorderRadius.circular(12)),
                            child: const Center(child: Text('Diagnose',style: TextStyle(color: Colors.white),),),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20,),
            //horizontallistview
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
                  ListCat(imgPath: 'lib/icons/tensorflow-icon.png',category: 'Tensorflow',),
                  ListCat(imgPath: 'lib/icons/python.png',category: 'Python',),
                  ListCat(imgPath: 'lib/icons/flutter-icon.png',category: 'Flutter',),
                  ListCat(imgPath: 'lib/icons/docker-icon.png',category: 'Docker',),
                  ListCat(imgPath: 'lib/icons/github.png',category: 'GitHub',),
                ]
              ),
            ),
            //doctor list
          ],
        ),
      ),

    );
  }
}