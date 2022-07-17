import 'package:flutter/material.dart';

class ListCat extends StatelessWidget {

  final imgPath;
  final String category;
  final Color primaryColor;
  final Color secondaryColor;
  final Color auxColor; 

  ListCat({
    required this.imgPath,
    required this.category,
    required this.primaryColor,
    required this.secondaryColor,
    required this.auxColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:15.0),
      child: Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(
                                  color: auxColor,
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(-5,0)
                                  )]),
              padding: const EdgeInsets.all(10),
              
              child: Row(

                children: [
                  Image.asset(imgPath,height: 40,),
                  const SizedBox(width: 8,),
                  Text(category,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                ],
              )
            ),
    );
  }
}