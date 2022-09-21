import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobigictest/app/modules/home/controllers/home_controller.dart';

import '../controllers/gridview_screen_controller.dart';

class GridviewScreenView extends GetView<GridviewScreenController> {
  GridviewScreenView(
      {Key? key,
      required this.columns,
      required this.rows,
      required this.alphabets})
      : super(key: key);
  final gridviewScreenController = Get.put(GridviewScreenController());
  final homeController = Get.put(HomeController());
  final int rows;
  final int columns;
  final String alphabets;

  @override
  Widget build(BuildContext context) {
    gridviewScreenController.convertToList(alphabets);
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text('GridviewScreenView'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: controller.searchController,
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  suffixIcon: IconButton(
                    onPressed: () {
                      gridviewScreenController.serachItem(
                          gridviewScreenController.searchController.text
                              .toString()
                              .toUpperCase());
                    },
                    icon: Icon(Icons.search),
                  ),
                ),
                onChanged: (Value) =>
                    gridviewScreenController.serachItem(Value),
                //  gridviewScreenController.serachItem(
                //     searchController.text.toString().toUpperCase()),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  crossAxisCount: rows,
                  children: List.generate(
                    columns,
                    (index) {
                      final data = gridviewScreenController.lettersList[index];

                      return GridviewItems(
                          color: Colors.amber, letter: data, index: index);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          gridviewScreenController.cleardata();
        },
        child: const Icon(Icons.clear),
      ),
    );
  }
}

class GridviewItems extends StatelessWidget {
  GridviewItems(
      {Key? key,
      required this.letter,
      required this.color,
      required this.index})
      : super(key: key);
  final String letter;
  final width = Get.width;
  final height = Get.height;
  Color color;
  List position = [];
  var index;

  final gridviewScreenController = Get.put(GridviewScreenController());
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    //  gridviewScreenController.changecolor(color,letter);
    return GetBuilder<GridviewScreenController>(builder: (cxt) {
      if (gridviewScreenController.searchList.length > homeController.rows!) {
        return Container(
          height: 30,
          width: 40,
        );
      } else if (gridviewScreenController.searchList.length >
          homeController.columns.toInt()) {
        return Container(
          height: 30,
          width: 40,
        );
      }
      for (var i = 0; i < gridviewScreenController.searchList.length; i++) {
        if (i == 0 && letter == gridviewScreenController.searchList[i]) {
          color = Colors.red;
          gridviewScreenController.firstPosition.add(index);
          position = gridviewScreenController.firstPosition.toSet().toList();
          // print(position);
        }

        for (var j = 0; j < position.length; j++) {
// // print(gridviewScreenController.lettersList[position[j]+1] )
          if (gridviewScreenController.searchList.length > 1 &&
              gridviewScreenController.lettersList[position[j] + i] ==
                  gridviewScreenController.searchList[1]) {
            color = Colors.red;

            print("object");
          }
//       // print('ha${gridviewScreenController.searchList[1]}');

        }

        //  else if (letter == gridviewScreenController.searchList[i]) {
        //    color = Colors.red;
        //  }

        // for (var i = 0; i < gridviewScreenController.lettersList.length; i++) {
        //   if(i==0 && gridviewScreenController.lettersList[position[i]+1]==gridviewScreenController.searchList[i+1]){
        //     color=Colors.red;
        //   }

      }

      return Container(
        alignment: Alignment.center,
        width: width / 5,
        height: height / 7,
        color: color,
        child: Text(cxt.lettersList[index],
            style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
      );
    });
  }
}
