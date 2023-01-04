import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/chapt.controller.dart';
import '../../../routes/app_routes.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});
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
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ],
          title: const Text(
            'Your History',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: List.generate(poly?.length ?? 0, ((index) {
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
        ),
      ),
    );
  }
}
