import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:get/get.dart';
import 'package:toppr1/controller/chapt.controller.dart';

class PolyConceptsPage extends StatelessWidget {
  PolyConceptsPage({super.key});
  final PolynomialVideoController controller =
      Get.find<PolynomialVideoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          ElevatedButton.icon(
            icon: Icon(
              Icons.search,
              color: Colors.grey.shade600,
              size: 20,
            ),
            label: Text(
              'Find',
              style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
            ),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                side: BorderSide(width: 1, color: Colors.grey.shade300),
                elevation: 0,
                backgroundColor: Colors.white,
                shape: const StadiumBorder(),
                minimumSize: const Size(0, 35)),
          ),
          Obx(() {
            return ElevatedButton(
              onPressed: () {
                controller.bkmark.value = !controller.bkmark.value;
              },
              style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 1, color: Colors.grey.shade300),
                  elevation: 0,
                  backgroundColor: controller.bkmark.isFalse
                      ? Colors.white
                      : const Color(0xff58bfc2),
                  shape: const StadiumBorder(),
                  minimumSize: const Size(0, 35)),
              child: Text(
                'Bookmark',
                style: TextStyle(
                    color: controller.bkmark.isFalse
                        ? Colors.grey.shade600
                        : Colors.white,
                    fontSize: 16),
              ),
            );
          }),
          Obx(() {
            return ElevatedButton(
              onPressed: () {
                controller.eg.value = !controller.eg.value;
              },
              style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 1, color: Colors.grey.shade300),
                  elevation: 0,
                  backgroundColor: controller.eg.isFalse
                      ? Colors.white
                      : Colors.lightBlueAccent.shade400,
                  shape: const StadiumBorder(),
                  minimumSize: const Size(0, 35)),
              child: Text(
                'Example',
                style: TextStyle(
                    color: controller.eg.isFalse
                        ? Colors.grey.shade600
                        : Colors.white,
                    fontSize: 16),
              ),
            );
          }),
        ]),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 12, left: 25, right: 25, bottom: 30),
          child: Column(
              children: List.generate(
                  controller.polyConcepts?.data?.concepts?.length ?? 0,
                  (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'EXAMPLE',
                                      style: TextStyle(
                                          letterSpacing: 1,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Colors.lightBlueAccent.shade400),
                                    ),
                                    const Icon(
                                      Icons.bookmark_outline,
                                      color: Colors.black87,
                                      size: 18,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                Text(
                                  controller.polyConcepts?.data?.concepts
                                          ?.elementAt(index)
                                          .title ??
                                      '',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TeXView(
                                  child: TeXViewImage.network(controller
                                          .polyConcepts?.data?.concepts
                                          ?.elementAt(index)
                                          .image ??
                                      ''),
                                ),
                                TeXView(
                                  child: TeXViewDocument(
                                      controller.polyConcepts?.data?.concepts
                                              ?.elementAt(index)
                                              .text ??
                                          '',
                                      style: const TeXViewStyle()),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))),
        ),
      ),
    );
  }
}
