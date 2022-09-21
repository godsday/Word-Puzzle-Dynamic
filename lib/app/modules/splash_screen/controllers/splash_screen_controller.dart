import 'package:get/get.dart';
import 'package:mobigictest/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigationTOHome();
  }

  Future navigationTOHome() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAndToNamed(Routes.HOME);
  }
}
