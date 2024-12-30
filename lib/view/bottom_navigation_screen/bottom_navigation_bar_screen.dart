import 'package:flutter/material.dart';

import 'package:news_app_task/view/home_screen/home_screen.dart';
import 'package:news_app_task/view/settings_screen/setting_screen.dart';


class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() => _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int selectedIndex=0;
  final List screens=[
   NewsHomePage(),
  

    
    
    
     
     
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: screens[selectedIndex],
     bottomNavigationBar: BottomNavigationBar(
      unselectedItemColor: Colors.grey.shade600,
      currentIndex: selectedIndex,
      selectedItemColor: Colors.blue,
      
      onTap: (value) {
        setState(() {
          selectedIndex=value;
          print(selectedIndex);
        });
      },
      type: BottomNavigationBarType.fixed,
      items: [
      BottomNavigationBarItem(icon: Icon(Icons.home,size: 21,),label: "home"),
        
          BottomNavigationBarItem(icon: Icon(Icons.settings,size: 21,),label: "Settings"),

            
     ]),
    );
  }
}