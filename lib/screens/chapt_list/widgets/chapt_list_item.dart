import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/chapt.controller.dart';
import '../../../routes/app_routes.dart';

class ChapListItem extends StatelessWidget {
  ChapListItem({super.key});
  final PolynomialVideoController controller =
      Get.find<PolynomialVideoController>();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: controller.mathsChaptList?.data?.chapters?.length ?? 0,
      separatorBuilder: (BuildContext context, int index) => Divider(
        color: Colors.grey.shade200,
        thickness: 1,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: GestureDetector(
            onTap: () {
              Get.toNamed(Routes.polypage, parameters: {
                "chapTitle": controller.mathsChaptList?.data?.chapters
                        ?.elementAt(index)
                        .name ??
                    ''
              });
            },
            child: ListTile(
              minLeadingWidth: 10,
              contentPadding: EdgeInsets.zero,
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.grey.shade500,
              ),
              leading: Text(
                controller.mathsChaptList?.data?.chapters
                        ?.elementAt(index)
                        .sequenceNo
                        .toString() ??
                    '',
                style: const TextStyle(
                    color: Color(0xff58bfc2),
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              title: Text(
                controller.mathsChaptList?.data?.chapters
                        ?.elementAt(index)
                        .name ??
                    '',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              subtitle:
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text(
                  '${controller.mathsChaptList?.data?.chapters?.elementAt(index).nVideos ?? ''} Videos',
                  style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.circle,
                  size: 4,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '${controller.mathsChaptList?.data?.chapters?.elementAt(index).nConcepts ?? ''} Concepts',
                  style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.circle,
                  size: 4,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '${controller.mathsChaptList?.data?.chapters?.elementAt(index).nExercise ?? ''} Exercises',
                  style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
              ]),
            ),
          ),
        );
      },
    );
  }
}
