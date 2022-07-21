import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {

  final Color primaryColor;
  final Color secondaryColor;  
  final Color auxColor;       
  final Color textcolor; 

  CustomAppBar({
    required this.primaryColor,
    required this.secondaryColor,
    required this.auxColor,
    required this.textcolor
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.symmetric(horizontal:10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //name
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12,),
                        Text('Welcome to',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18, color: textcolor),),
                        const SizedBox(height: 8,),
                        Text('SkinCancer App',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: textcolor))
                      ],
                    ),
                    //applogo
                    Container(
                      padding: const EdgeInsets.all(5),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                                  BoxShadow(
                                    color: auxColor,
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(0, 7), // changes position of shadow
                                    ),
                              ],
                        ),
                      child: Image.asset('lib/icons/ai.png'))
                  ],
                ),
              );
  }
}