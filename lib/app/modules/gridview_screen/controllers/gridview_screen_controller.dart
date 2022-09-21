
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobigictest/app/modules/home/controllers/home_controller.dart';

import '../../../routes/app_pages.dart';

class GridviewScreenController extends GetxController {

  final homeController = Get.find<HomeController>();

   List<String> lettersList=[];
   List<String> searchList=[];
   List <int> firstPosition=[];
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  final searchController = TextEditingController();

  
  bool highLights=false;
  convertToList(String alphabets){
   
    lettersList= alphabets.toUpperCase().split("");
update();
   
  }
  final queryList =[];


  serachItem(String query){
    searchList= query.toUpperCase().split("");
    //  searchController.text==""?queryList.clear():null;
          searchController.text==""?firstPosition.clear():null;
          searchController.text.isEmpty||searchController.text==""?searchList.clear():null;
        

    for (var i = 0; i < lettersList.length; i++) {

          for(var j=0;j<searchList.length;j++){

        if(lettersList[i]==searchList[j]){

       queryList.add(searchList[j]);
      //  queryList.toSet().toList();

        }       
   
    }
    
    }
    //  print(queryList);
    // for (var element in lettersList) {

    //   element.toUpperCase().contains(query.toUpperCase());
    //   queryList.add(element);
    //   log(queryList.toString());
    // }
    
  update();

  }

  changecolor(Color color,String letter){
    for (var i = 0; i <searchList.length; i++) {
        if (i == 0 && letter == searchList[i]) {
          color = Colors.red;
        //  firstPosition.add(index);
          // position =firstPosition.toSet().toList();
          // print(position);
        } else if (letter ==searchList[i]){
                    color = Colors.red;

        }
        // (lettersList[position[0] + i] ==
        //     searchList[i]) {
        //   color = Colors.red;
        // }
      }


}

cleardata(){

  homeController.columns.value=0;
  homeController.rows=0;
  homeController.datas=0;
  homeController.displayValue.value=false;
  homeController.noOfColumController.clear();
  homeController.noOfRowController.clear();
  homeController.alphabetController.clear();
  
  
  Get.offAndToNamed(Routes.HOME);
  print(homeController.rows);
  print(homeController.columns);

}
}
