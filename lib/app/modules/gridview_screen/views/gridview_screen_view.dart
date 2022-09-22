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
                controller: controller.searchController.value,
                decoration: InputDecoration(
                  hintText: "Search",
                  // prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  suffixIcon: IconButton(
                    onPressed: () {
                      gridviewScreenController.serachItem(
                          gridviewScreenController.searchController.value.text
                              .toString()
                              .toUpperCase());
                    },
                    icon: const Icon(Icons.search),
                  ),
                ),
                onChanged: (value) =>
                    gridviewScreenController.serachItem(value),
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

class GridviewItems extends StatefulWidget {
  GridviewItems(
      {Key? key,
      required this.letter,
      required this.color,
      required this.index})
      : super(key: key);
  final String letter;
  Color color;
  int index;

  @override
  State<GridviewItems> createState() => _GridviewItemsState();
}

class _GridviewItemsState extends State<GridviewItems> {
  final width = Get.width;

  final height = Get.height;

  List position = [];

  final gridviewScreenController = Get.put(GridviewScreenController());

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GridviewScreenController>(builder: (cxt) {
      if(gridviewScreenController.searchList.isEmpty){
       widget.color=Colors.amber;
      }
      if (gridviewScreenController.searchList.length > homeController.rows!) {
        return const SizedBox(
          height: 30,
          width: 40,
        );
      } else if (gridviewScreenController.searchList.length >
          homeController.columns.toInt()) {
        return const SizedBox(
          height: 30,
          width: 40,
        );
      }
      for (var i = 0; i < gridviewScreenController.searchList.length; i++) {
        if (i == 0 && widget.letter == gridviewScreenController.searchList[i]) {
         widget. color = Colors.red;
          gridviewScreenController.firstPosition.add(widget.index);
          position = gridviewScreenController.firstPosition.toSet().toList();
           print(position);
        }
        //  if(i == 0 && gridviewScreenController.lettersList[i] != gridviewScreenController.searchList[i]){
        //   return SizedBox(height: 30,width: 30,);
        // }



        for (var j = 0; j < position.length; j++) {
          
          if (
             i==1&&
              // gridviewScreenController.searchList.length > 1 &&
              gridviewScreenController.lettersList[position[j] + i] ==
                  gridviewScreenController.searchList[i]) {
                    print("hell");
           widget. color = Colors.red;
          }
          //  print('ha${gridviewScreenController.searchList[1]}');
          //  print(gridviewScreenController.lettersList[position[j]+1] );

        }

        // if (gridviewScreenController.searchList.length > 1 &&
        //     letter == gridviewScreenController.searchList[i]) {
        //   color = Colors.red;
        // }

        // for (var i = 0; i < gridviewScreenController.lettersList.length; i++) {
        //   if(i==0 && gridviewScreenController.lettersList[position[i]+1]==gridviewScreenController.searchList[i+1]){
        //     color=Colors.red;
        //   }

      }

      return Container(
        alignment: Alignment.center,
        width: width / 5,
        height: height / 7,
        color: widget.color,
        child: Text(cxt.lettersList[widget.index],
            style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
      );
    });
  }
}
