// ignore_for_file: unnecessary_overrides, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:toppr1/screens/home/model/select_class.dart';

import '../../../routes/app_routes.dart';

class HomeController extends GetxController {
  SelectClass? selectClass;
  var selectedClass = ''.obs;

  var classSelected = false.obs;
  var selectedClassList = [].obs;
  // var standared = 0.obs;
  var standared = ''.obs;

  var valuefirst = false.obs;
  var phoneNumber = ''.obs;
  var userName = ''.obs;
  final formKey = GlobalKey<FormState>();
  final textcontroller = TextEditingController();
  final userController = TextEditingController();
  var submitted = false.obs;
  late final ValueChanged<String> onSubmit;

  String? get errorText {
    final text = textcontroller.value.text;
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 4) {
      return 'Too short';
    }
    return null;
  }

  void submit() {
    submitted.value = true;
    if (errorText == null) {
      onSubmit(textcontroller.value.text);
    }
  }

  final getStorage = GetStorage();
  var name;
  @override
  void onInit() {
    name = getStorage.read('name');
    fetchSelectClass();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    textcontroller.dispose();
    super.onClose();
  }

  logout() {
    getStorage.erase();
    Get.offAllNamed(Routes.login);
  }

  Future<void> fetchSelectClass() async {
    final response = await rootBundle.loadString('json/login/start.json');
    selectClass = SelectClass.fromJson(jsonDecode(response));
  }
}
