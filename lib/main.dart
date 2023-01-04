import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:toppr1/screens/home/view/home_view.dart';

import 'constants/glow_behaviour.dart';
import 'routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: ScrollConfiguration(
          behavior: NoGlowBehavior(),
          child: child!,
        ),
      ),
      // theme: ThemeData(fontFamily: 'Karla'),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
