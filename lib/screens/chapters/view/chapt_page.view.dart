import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toppr1/controller/chapt.controller.dart';
import 'package:toppr1/controller/crash_course_controller.dart';
import 'package:toppr1/controller/ncert_solution_controller.dart';

import '../../../controller/previous_paper_controller.dart';
import '../../../routes/app_routes.dart';

class PolynomialPage extends StatelessWidget {
  PolynomialPage({Key? key}) : super(key: key);
  final PolynomialVideoController controller =
      Get.find<PolynomialVideoController>();

  PreviousQuestionPaperController myController =
      Get.put(PreviousQuestionPaperController());

  CrashCourseController crashController = Get.put(CrashCourseController());
  NCERTSolutionController ncertSolutionController =
      Get.put(NCERTSolutionController());

  @override
  Widget build(BuildContext context) {
    dynamic title1 = Get.parameters['chapTitle'];

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
              onPressed: () => Get.back(),
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
                // titlePadding: const EdgeInsets.symmetric(horizontal: 20,),
                centerTitle: true,
                title: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Text(
                    title1 ?? '',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                left: 20,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'VIDEO CLASSES',
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5),
                        ),
                        GestureDetector(
                          onTap: () => Get.toNamed(Routes.polyviewall),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'View All',
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: Colors.grey.shade500,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            controller.polyVideos?.data?.videos?.length ?? 0,
                            (index) {
                              final poly = controller.polyVideos?.data?.videos
                                  ?.elementAt(index);

                              return Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: GestureDetector(
                                    onTap: () => Get.toNamed(
                                        Routes.mathspolyvideo,
                                        parameters: {
                                          "youtubeUrl": controller
                                                  .polySet1?.data?.videos
                                                  ?.elementAt(index)
                                                  .youtubeUrl ??
                                              '',
                                          "title": controller
                                                  .polySet1?.data?.videos
                                                  ?.elementAt(index)
                                                  .title ??
                                              ''
                                        }),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                poly?.thumbnails?.s360 ?? '',
                                            height: 100,
                                            width: 185,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        SizedBox(
                                          height: 40,
                                          width: 185,
                                          child: Text(
                                            poly?.title ?? '',
                                            maxLines: 2,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '${poly?.durationMin} mins',
                                          style: TextStyle(
                                              color: Colors.grey.shade500),
                                        )
                                      ],
                                    ),
                                  ));
                            },
                          ),
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'QUICK PRACICE',
                      style: TextStyle(
                          letterSpacing: 0.5,
                          fontSize: 13,
                          color: Color(0xff999999),
                          fontWeight: FontWeight.w500),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.ncert, parameters: {
                                "CardTitle": ncertSolutionController
                                        .polyNCERTSolutions
                                        .value
                                        .data
                                        ?.pageTitle ??
                                    'NCERT Solutions',
                              });
                            },
                            child: _buildQuickPractice(
                                Icons.assignment,
                                controller.ncertSolutions?.data?.pageTitle ??
                                    ''),
                          ),
                          const SizedBox(
                            width: 35,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.crashcourse, parameters: {
                                "CardTitle": crashController
                                        .crashCourse?.data?.pageTitle ??
                                    'Crash Course'
                              });
                            },
                            child: _buildQuickPractice(
                                Icons.electric_bolt_rounded,
                                controller.crashCourse?.data?.pageTitle ?? ''),
                          ),
                          const SizedBox(
                            width: 35,
                          ),
                          GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.previousquestionpaper);
                              },
                              child: _buildQuickPractice(
                                  Icons.star,
                                  myController.previousQuestionPapers?.data
                                          ?.pageTitle ??
                                      'Previous Papers')),
                          const SizedBox(
                            width: 35,
                          ),
                          _buildQuickPractice(
                              Icons.brightness_medium, 'Medium'),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 35, bottom: 25),
                      child: Text(
                        'QUICK REVISION',
                        style: TextStyle(
                            fontSize: 13,
                            letterSpacing: 0.5,
                            color: Color(0xff999999),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    GestureDetector(
                      onTap: () =>
                          Get.toNamed(Routes.polyviewall, arguments: 1),
                      child: ListTile(
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade100,
                                    blurRadius: 4,
                                    spreadRadius: 4,
                                    offset: const Offset(0, 3))
                              ]),
                          child: const Icon(Icons.tips_and_updates),
                        ),
                        title: const Text(
                          'Revise with concepts',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          'Revise definitions, formulaes, examples',
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                        ),
                        trailing: const Icon(
                          Icons.chevron_right,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

Widget _buildQuickPractice(IconData icon, String title) {
  return Column(
    children: [
      const SizedBox(
        height: 15,
      ),
      Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade100,
                  blurRadius: 4,
                  spreadRadius: 4,
                  offset: const Offset(0, 3))
            ]),
        child: Icon(icon),
      ),
      const SizedBox(
        height: 25,
      ),
      Text(
        title,
        style: const TextStyle(
            color: Color(0xff999999), fontWeight: FontWeight.w500),
      )
    ],
  );
}
