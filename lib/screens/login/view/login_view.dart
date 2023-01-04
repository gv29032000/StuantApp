import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toppr1/screens/login/controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Please Login to continue...'),
            ElevatedButton(
                onPressed: () {
                  controller.login();
                },
                child: const Text('Login'))
          ],
        ),
      ),
    );
  }
}
