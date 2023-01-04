// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:toppr1/routes/app_routes.dart';

class SplashController extends GetxController {
  final getStorage = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    if (getStorage.read('id') != null) {
      Future.delayed(const Duration(milliseconds: 0), () {
        Get.offAllNamed(Routes.home);
      });
    } else {
      Get.offAllNamed(Routes.login);
    }
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
