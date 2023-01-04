import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toppr1/routes/app_routes.dart';

import '../../../controller/chapt.controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final PolynomialVideoController controller =
      Get.put(PolynomialVideoController());

  @override
  Widget build(BuildContext context) {
    final poly = controller.polyVideos?.data?.videos;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          actions: const [
            Icon(
              Icons.search,
              color: Colors.black,
            )
          ],
          title: Container(
            width: 170,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.teal.shade50),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'JEE Advanced',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  Icon(
                    Icons.expand_more,
                    color: Colors.lightBlue.shade300,
                    size: 18,
                  )
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Learn',
                      style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 33),
                    Row(
                      children: [
                        Text(
                          'Learn',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue.shade600,
                              fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          ' with Video Classes',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                            onTap: () => Get.toNamed(Routes.mathschaptpage),
                            child: SizedBox(
                              height: 80,
                              width: 80,
                              child: Image.asset(
                                'assets/images/mathslogo.png',
                              ),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Maths",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 8,
                color: Colors.grey.shade100,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.historypage),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Continue Studying',
                            style: TextStyle(
                                fontSize: 21,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          Icon(Icons.arrow_forward)
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children:
                          List.generate(poly?.take(3).length ?? 0, ((index) {
                        final poly1 = poly?.elementAt(index);
                        return Padding(
                          padding: const EdgeInsets.only(top: 13.0),
                          child: GestureDetector(
                            onTap: () => Get.toNamed(Routes.mathspolyvideo),
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: CachedNetworkImage(
                                  imageUrl: poly1?.thumbnails?.s360 ?? "",
                                  width: 100,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(
                                poly1?.title ?? '',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ),
                              subtitle: Text(
                                '${poly1?.durationMin} mins',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ),
                          ),
                        );
                      })),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 8,
                color: Colors.grey.shade100,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Trending Chapters',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 15),
                      child: GestureDetector(
                        onTap: () => Get.toNamed(Routes.polypage),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Image.asset('assets/images/mathslogo.png',
                              height: 37, width: 37),
                          title: const Text(
                            'Polynomials',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          subtitle: Text(
                            '67 people are studying this now',
                            style: TextStyle(
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 8,
                color: Colors.grey.shade100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Text(
                      'Recommended Learning',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        ..._buildCourses(),
                      ],
                    ),
                  )
                ],
              ),
              Divider(
                thickness: 8,
                color: Colors.grey.shade100,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.orangeAccent.shade200,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          width: 170,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Revise quickly with Concepts',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 13,
                              ),
                              Text(
                                'Explore concepts from trending chapters',
                                style: TextStyle(
                                    color: Colors.brown.shade50,
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 13,
                              ),
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(150, 35),
                                    backgroundColor: Colors.white,
                                    elevation: 0,
                                    shape: const StadiumBorder(),
                                  ),
                                  child: const Text('Explore',
                                      style: TextStyle(
                                          color: Color(0xff79a303),
                                          fontWeight: FontWeight.bold)))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 8,
                color: Colors.grey.shade100,
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 80,
                color: Colors.grey.shade100,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/toppr_icon.png',
                                  height: 25,
                                  width: 25,
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                const Text('toppr',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Better learning. Better results.',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade500,
                                  fontWeight: FontWeight.w400),
                            )
                          ]),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Phone: ',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                ),
                              ),
                              Text(
                                '18002099199',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Email: ',
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                ),
                              ),
                              Text(
                                'support@toppr.com',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> _buildCourses() {
  final PolynomialVideoController controller =
      Get.find<PolynomialVideoController>();
  final poly = controller.polyVideos?.data?.videos;
  return List.generate(
    controller.polyVideos?.data?.videos?.length ?? 0,
    (index) {
      final poly = controller.polyVideos?.data?.videos?.elementAt(index);

      return Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: () => Get.toNamed(Routes.mathspolyvideo),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: CachedNetworkImage(
                        imageUrl: poly?.thumbnails?.s360 ?? '',
                        height: 100,
                        width: 180,
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 180,
                  child: Text(
                    poly?.title ?? '',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  '${poly?.durationMin} mins',
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade600),
                ),
              ],
            ),
          ));
    },
  );
}
