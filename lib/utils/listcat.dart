import 'package:flutter/material.dart';

class ListCat extends StatelessWidget {

  final imgPath;
  final String category;

  ListCat({
    required this.imgPath,
    required this.category
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:15.0),
      child: Container(
              decoration: BoxDecoration(color: Colors.deepPurple[100],borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(10),
              child: Row(

                children: [
                  Image.asset(imgPath,height: 40,),
                  const SizedBox(width: 8,),
                  Text(category,style: const TextStyle(fontWeight: FontWeight.bold),),
                ],
              )
            ),
    );
  }
}