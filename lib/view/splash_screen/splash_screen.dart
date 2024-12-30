import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app_task/view/bottom_navigation_screen/bottom_navigation_bar_screen.dart';
import 'package:news_app_task/view/home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
   Timer(Duration(seconds: 3), 
   () { 
     Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavigationBarScreen()));
    
   });
    super.initState();
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
       child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Icon(Icons.newspaper_outlined,color: Colors.blue,size: 35,),
           SizedBox(width: 5,),
           Text("News",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.black),),
            SizedBox(width: 5,),
           Text("Watch",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.blue),),

        ],

       ),
      ),
    );
  }
}