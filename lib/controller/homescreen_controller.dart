// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart'as http;
// import 'package:news_app_task/model/home_screen_model.dart';

// class HomescreenController with ChangeNotifier{
//     bool loading=false;
//     CategoryResModel? categorylist;
    
//    Future<void> getCategory({String? category}) async {
//         final url=Uri.parse("https://newsapi.org/v2/everything?q=$category&apiKey=business&apiKey=6cb8e140977944db9424ef3013da11e9");
//         try{
//             loading=true;
//             notifyListeners();
//              final response=await  http.get(url);
//              if(response.statusCode==200){
//                 categorylist=categoryResModelFromJson(response.body);
               
                
//              }


//         }
//         catch (e){

//                print(e);
//         }
//          loading=false;
//             notifyListeners();
        
    
//     }

//     getRecentNews(){ 

//     }
  
// }

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_task/model/home_screen_model.dart';




class HomeScreenController with ChangeNotifier {
  List<Article> articlesList = [];
  bool isLoading = false;
  int selecredcategory=0;
  getNews(String category) async {
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$category&apiKey=37cd22cee6d14bf78b9a3cfed10783c7");
    try {
      isLoading = true;
      notifyListeners();
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = homemodelFromJson(response.body);
        print(jsonData);

        articlesList = jsonData.articles ?? [];
        print(articlesList);
        log(articlesList.toString());
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }

  

  void   oncategoryselection({required int clickedindex}){
    selecredcategory=clickedindex;
    print(selecredcategory);
    notifyListeners();

     
    }
}