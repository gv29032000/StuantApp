// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:toppr1/routes/app_routes.dart';

class LoginController extends GetxController {
  final getStorage = GetStorage();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  login() {
    getStorage.write('id', 2);
    getStorage.write('name', 'Subitha');
    Get.offAllNamed(Routes.home);
  }
}
