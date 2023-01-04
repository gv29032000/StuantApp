import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toppr1/controller/chapt.controller.dart';
import 'package:toppr1/screens/chapters/widgets/video.dart';

import '../../../routes/app_routes.dart';

class PolynomialVideoPage extends StatelessWidget {
  PolynomialVideoPage({Key? key}) : super(key: key);

  final PolynomialVideoController controller =
      Get.find<PolynomialVideoController>();

  @override
  Widget build(BuildContext context) {
    final poly = controller.polyVideos?.data?.videos;

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   actions: const [
      //     Padding(
      //       padding: EdgeInsets.only(right: 18.0),
      //       child: Icon(Icons.more_vert),
      //     )
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 395,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 0, 20, 20),
                  child: Text(
                    'Related Videos',
                    style: TextStyle(
                        color: Color(0xff7f7f7f),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Column(
                  children: List.generate(
                    poly?.length ?? 0,
                    ((index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 15, top: 15, bottom: 15),
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.mathspolyvideo, parameters: {
                              "youtubeUrl": controller.polySet1?.data?.videos
                                      ?.elementAt(index)
                                      .youtubeUrl ??
                                  '',
                              "title": controller.polySet1?.data?.videos
                                      ?.elementAt(index)
                                      .title ??
                                  ''
                            });
                          },
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: CachedNetworkImage(
                                imageUrl:
                                    poly?.elementAt(index).thumbnails?.s360 ??
                                        '',
                                height: 60,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                              poly?.elementAt(index).title ?? '',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                            subtitle: Text(
                              '${poly?.elementAt(index).durationMin ?? 0} mins',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
            MyVideo(),
          ],
        ),
      ),
    );
  }
}
