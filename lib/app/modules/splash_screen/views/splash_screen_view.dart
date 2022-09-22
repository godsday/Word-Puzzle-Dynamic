import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
   SplashScreenView({Key? key}) : super(key: key);
  final splashScreenController= Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      
   
      body:  Center(
      
          
        child:Text("Splash",
          style:  TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.cyan),

        
      )));
    
  }
}
