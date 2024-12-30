import 'package:flutter/material.dart';
import 'package:news_app_task/controller/homescreen_controller.dart';
import 'package:news_app_task/view/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (create)=>HomeScreenController())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:SplashScreen() ,
      ),
    );
  }
}