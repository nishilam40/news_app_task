// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';

// class CustomBuilder extends StatelessWidget {
//   final String imageurl;
//   const CustomBuilder({super.key, required this.imageurl});

//   @override
//   Widget build(BuildContext context) {
//     return   CarouselSlider.builder(
//             itemCount:4,
           
       
//        options: CarouselOptions(
        
//         height: 200,
      
      
//       viewportFraction: 1,
//       initialPage: 0,
//       enableInfiniteScroll: true,
//       reverse: true,
//       autoPlay: true,
//       autoPlayInterval: Duration(seconds: 2),
//       autoPlayAnimationDuration: Duration(milliseconds: 1000),
//       autoPlayCurve: Curves.bounceIn,
      
//       scrollDirection: Axis.horizontal,
//        ),
//        itemBuilder: (context, index, realIndex) => Padding(
//          padding: const EdgeInsets.symmetric(horizontal: 16),
//          child: Container(
//       decoration: BoxDecoration(
        
//         image: DecorationImage(image: NetworkImage(imageurl),
//          fit: BoxFit.fill,
//         ),
       
//         borderRadius: BorderRadius.circular(20)
//       ),
         
//          ),
//        ),
       
      
        
        
                 
//                   )   ;
//   }
// }