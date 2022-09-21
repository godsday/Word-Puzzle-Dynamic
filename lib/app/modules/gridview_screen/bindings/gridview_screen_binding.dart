import 'package:get/get.dart';

import '../controllers/gridview_screen_controller.dart';

class GridviewScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GridviewScreenController>(
      () => GridviewScreenController(),
    );
  }
}
