import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomNews extends StatelessWidget {
  final String imageurl;
  final String des;
  const CustomNews({super.key, required this.imageurl, required this.des});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
      
      
       SingleChildScrollView(
        scrollDirection: Axis.horizontal,
         child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: 
                              Stack(
                                children: [
                                Image.network(imageurl,
                                fit: BoxFit.cover,
                                height: 100,
                                width: 100,
                                ),
                                
                                ]
                              )
                              ),
                              SizedBox(width: 6,),
                              Column(
                                children: [
                                  Text(des,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                  
                                     
                                ],
                              )
                            ],
         ),
       ),
       
        ]
                        ),
    );
  }
}