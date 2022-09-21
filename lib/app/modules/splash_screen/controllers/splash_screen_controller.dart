import 'package:get/get.dart';
import 'package:mobigictest/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
 

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
     navigationTOHome();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

 Future navigationTOHome()async{
 await Future.delayed(const Duration(seconds: 3)); 
 Get.offAndToNamed(Routes.HOME);
}