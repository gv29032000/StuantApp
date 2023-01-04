import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toppr1/screens/splash/controller/splash_controller.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);
  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 50,
          width: 50,
          child: Image.asset(
            'assets/images/toppr_icon.png',
          ),
        ),
      ),
    );
  }
}
