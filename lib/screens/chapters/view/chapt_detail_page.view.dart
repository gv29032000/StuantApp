import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toppr1/controller/chapt.controller.dart';
import 'package:toppr1/screens/chapters/widgets/poly_concepts.view.dart';

import '../../../routes/app_routes.dart';

class PolynomialViewAllPage extends StatelessWidget {
  PolynomialViewAllPage({Key? key}) : super(key: key);
  final PolynomialVideoController controller =
      Get.find<PolynomialVideoController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      // initialIndex: Routes.polypage == true ? 1 : 0,
      child: SafeArea(
        child: Scaffold(
          ///floatingActionButton: FloatingActionButton.,
          appBar: AppBar(
            elevation: 1,
            bottom: TabBar(
              tabs: const [
                Text(
                  'VIDEOS',
                ),
                Text(
                  'CONCEPTS',
                )
              ],
              indicatorColor: const Color(0xff58bfc2),
              indicatorPadding: const EdgeInsets.only(left: 20, right: 20),
              indicatorWeight: 3,
              unselectedLabelColor: Colors.grey.shade500,
              labelColor: Colors.black,
              labelPadding: const EdgeInsets.all(15),
            ),
            centerTitle: false,
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back),
              color: const Color.fromARGB(255, 10, 10, 10),
            ),
            title: Text(controller.polyVideos?.data?.chapter?.name ?? '',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500)),
            titleSpacing: -5,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
                color: Colors.black,
              )
            ],
          ),
          body: TabBarView(children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Theme(
                      data: ThemeData().copyWith(
                        dividerColor: Colors.transparent,
                      ),
                      child: ExpansionTile(
                        initiallyExpanded: true,
                        onExpansionChanged: (bool expanded) {
                          controller.customTileExpanded.value =
                              !controller.customTileExpanded.value;
                        },
                        title: Text(
                          controller.polySet1?.data?.name ?? '',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        subtitle: Obx(() {
                          return controller.customTileExpanded.value
                              ? const SizedBox()
                              : Row(
                                  children: [
                                    Text(
                                      '${controller.polySet1?.data?.nVideos ?? 0} Videos',
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    const Icon(
                                      Icons.circle,
                                      size: 4,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    const Text(
                                      '36 mins',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                );
                        }),
                        trailing: GetX<PolynomialVideoController>(
                            builder: (controller) {
                          return controller.customTileExpanded.value
                              ? const Icon(
                                  Icons.expand_less,
                                  color: Colors.grey,
                                  size: 20,
                                )
                              : const Icon(
                                  Icons.expand_more,
                                  color: Colors.grey,
                                  size: 20,
                                );
                        }),
                        children: [
                          Column(
                            children: List.generate(
                                controller.polySet1?.data?.videos?.length ?? 0,
                                (index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 20.0, left: 20, right: 20),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed(Routes.mathspolyvideo,
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
                                        });
                                  },
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: CachedNetworkImage(
                                            imageUrl: controller
                                                    .polySet1?.data?.videos
                                                    ?.elementAt(index)
                                                    .thumbnails
                                                    ?.s360 ??
                                                '',
                                            width: 135,
                                            height: 75,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        SizedBox(
                                          height: 75,
                                          width: 150,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                controller
                                                        .polySet1?.data?.videos
                                                        ?.elementAt(index)
                                                        .title ??
                                                    '',
                                                maxLines: 2,
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.5),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                  '${controller.polySet1?.data?.videos?.elementAt(index).durationMin ?? 0} mins')
                                            ],
                                          ),
                                        ),
                                        controller.polySet1?.data?.videos
                                                    ?.elementAt(index)
                                                    .isDownloadable ==
                                                true
                                            ? const Icon(Icons.download)
                                            : const SizedBox()
                                      ]),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                    Theme(
                      data: ThemeData().copyWith(
                        dividerColor: Colors.transparent,
                      ),
                      child: ExpansionTile(
                        initiallyExpanded: true,
                        onExpansionChanged: (bool expanded) {
                          controller.customTileExpanded1.value = expanded;
                        },
                        title: Text(
                          controller.polySet2?.data?.name ?? '',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        subtitle: Obx(() {
                          return controller.customTileExpanded1.value
                              ? const SizedBox()
                              : Row(
                                  children: [
                                    Text(
                                      '${controller.polySet2?.data?.nVideos ?? 0} Videos',
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    const Icon(
                                      Icons.circle,
                                      size: 4,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    const Text(
                                      ' 25 mins',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                );
                        }),
                        trailing: GetX<PolynomialVideoController>(
                            builder: (controller) {
                          return controller.customTileExpanded1.value
                              ? const Icon(
                                  Icons.expand_less,
                                  color: Colors.grey,
                                  size: 20,
                                )
                              : const Icon(
                                  Icons.expand_more,
                                  color: Colors.grey,
                                  size: 20,
                                );
                        }),
                        children: [
                          Column(
                            children: List.generate(
                                controller.polySet2?.data?.videos?.length ?? 0,
                                (index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 20.0, left: 20, right: 20),
                                child: GestureDetector(
                                  onTap: () =>
                                      Get.toNamed(Routes.mathspolyvideo),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: CachedNetworkImage(
                                            imageUrl: controller
                                                    .polySet2?.data?.videos
                                                    ?.elementAt(index)
                                                    .thumbnails
                                                    ?.s360 ??
                                                '',
                                            width: 135,
                                            height: 75,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        SizedBox(
                                          height: 75,
                                          width: 150,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                controller
                                                        .polySet2?.data?.videos
                                                        ?.elementAt(index)
                                                        .title ??
                                                    '',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14.5,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                  '${controller.polySet2?.data?.videos?.elementAt(index).durationMin ?? 0} mins')
                                            ],
                                          ),
                                        ),
                                        controller.polySet2?.data?.videos
                                                    ?.elementAt(index)
                                                    .isDownloadable ==
                                                true
                                            ? const Icon(Icons.download)
                                            : const SizedBox()
                                      ]),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            PolyConceptsPage(),
          ]),
        ),
      ),
    );
  }
}
