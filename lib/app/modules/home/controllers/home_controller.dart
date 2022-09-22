import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final noOfRowController = TextEditingController();
  final noOfColumController = TextEditingController();
  final alphabetController = TextEditingController();

  RxInt columns = 0.obs;
  RxBool displayValue = false.obs;

  int? rows;
  int? datas;

  updateLetters() {
    rows = int.parse(noOfRowController.text);
    datas = int.parse(noOfColumController.text);
    columns.value = (rows! * datas!);
    displayValue = true.obs;
    update();
  }
}
