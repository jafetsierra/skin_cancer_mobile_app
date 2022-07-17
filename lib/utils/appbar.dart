import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {

  final Color primaryColor;
  final Color secondaryColor;  
  final Color auxColor;       
    

  CustomAppBar({
    required this.primaryColor,
    required this.secondaryColor,
    required this.auxColor,
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
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                                  BoxShadow(
                                    color: auxColor,
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(0, 7), // changes position of shadow
                                    ),
                              ],
                        ),
                      child: Image.asset('lib/icons/ai.png'))
                  ],
                ),
              );
  }
}