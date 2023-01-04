// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_routes.dart';

class HomeController extends GetxController {
  final getStorage = GetStorage();
  var name = "";
  @override
  void onInit() {
    name = getStorage.read('name');
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

  logout() {
    getStorage.erase();
    Get.offAllNamed(Routes.login);
  }
}
