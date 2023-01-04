import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toppr1/screens/chapt_list/widgets/chapt_list_item.dart';

import '../../../controller/chapt.controller.dart';
import '../../../routes/app_routes.dart';

class MathsChapterPage extends StatelessWidget {
  MathsChapterPage({super.key});
  final PolynomialVideoController controller =
      Get.find<PolynomialVideoController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            //   titleSpacing: 0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            elevation: 1,
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              )
            ],
            leading: IconButton(
              onPressed: () => Get.toNamed(Routes.home),
              icon: const Icon(Icons.arrow_back),
              color: Colors.black,
            ),
            expandedHeight: 140,
            floating: false,
            pinned: true,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xffc8e5e6), Colors.white],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              child: FlexibleSpaceBar(
                //titlePadding: const EdgeInsets.only(left: 20, bottom: 20),
                centerTitle: true,
                title: Text(
                  controller.mathsChaptList?.data?.subject?.name ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SliverFillRemaining(child: ChapListItem()),
        ],
      ),
    ));
  }
}
