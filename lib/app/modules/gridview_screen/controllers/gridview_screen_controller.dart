import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobigictest/app/modules/home/controllers/home_controller.dart';

import '../../../routes/app_pages.dart';

class GridviewScreenController extends GetxController {
  final homeController = Get.find<HomeController>();

  List<String> lettersList = [];
  List<String> searchList = [];
  List<int> firstPosition = [];

  final searchController = TextEditingController().obs;

  bool highLights = false;
  convertToList(String alphabets) {
    lettersList = alphabets.toUpperCase().split("");
    update();
  }

  final queryList = [];

  serachItem(String query) {
    searchList = query.toUpperCase().split("");
    //  searchController.text==""?queryList.clear():null;
    searchController.value.text == "" ? firstPosition.clear() : null;
    searchController.value.text.isEmpty || searchController.value.text == ""

        ? searchList.clear()
        : null;

 
    // for (var i = 0; i < lettersList.length; i++) {
    //       for(var j=0;j<searchList.length;j++){
    //     if(lettersList[i]==searchList[j]){
    //    queryList.add(searchList[j]);
    //   //  queryList.toSet().toList();
    update();
  }

  changecolor(Color color, String letter) {
    // for (var i = 0; i < searchList.length; i++) {
    //   if (i == 0 && letter == searchList[i]) {
    //     color = Colors.red;
    //     //  firstPosition.add(index);
    //     // position =firstPosition.toSet().toList();
    //     // print(position);
    //   } else if (letter == searchList[i]) {
    //     color = Colors.red;
    //   }
    //   // (lettersList[position[0] + i] ==
    //   //     searchList[i]) {
    //   //   color = Colors.red;
    //   // }
    // }
       if (searchList.length > homeController.rows!) {
        return const SizedBox(
          height: 30,
          width: 40,
        );
      } else if (searchList.length >
          homeController.columns.toInt()) {
        return const SizedBox(
          height: 30,
          width: 40,
        );
      }
      for (var i = 0; i < searchList.length; i++) {
        
        if (i == 0 && letter == searchList[i]) {
          color = Colors.red;
          // firstPosition.add(index);
          // position = firstPosition.toSet().toList();
          // print(position);
        }
         if(i == 0 && lettersList[i] != searchList[i]){
          return SizedBox(height: 30,width: 30,);
        }

        // for (var j = 0; j < position.length; j++) {
        //   // print(gridviewScreenController.lettersList[position[j]+1] )
        //   if (gridviewScreenController.searchList.length > 1 &&
        //       gridviewScreenController.lettersList[position[j] + i] ==
        //           gridviewScreenController.searchList[1]) {
        //     color = Colors.red;
        //   }else {
        //     return SizedBox(height: 30,width: 40,);
        //   }
        //   // print('ha${gridviewScreenController.searchList[1]}');

        // }

        if (searchList.length > 1 &&
            letter == searchList[i]) {
          color = Colors.red;
        }

        // for (var i = 0; i < gridviewScreenController.lettersList.length; i++) {
        //   if(i==0 && gridviewScreenController.lettersList[position[i]+1]==gridviewScreenController.searchList[i+1]){
        //     color=Colors.red;
        //   }

      }
      update();
  }

  cleardata() {
    homeController.columns.value = 0;
    homeController.rows = 0;
    homeController.datas = 0;
    homeController.displayValue.value = false;
    homeController.noOfColumController.clear();
    homeController.noOfRowController.clear();
    homeController.alphabetController.clear();

    Get.offAndToNamed(Routes.HOME);
    }
}
