import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:get/get.dart';

class MyVideo extends StatelessWidget {
  MyVideo({super.key});
  final dynamic url = Get.parameters['youtubeUrl'];
  final dynamic title = Get.parameters['title'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TeXView(
                  child: TeXViewVideo.youtube(url),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 300,
                        child: Text(
                          title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                      const Icon(
                        Icons.download,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Polynomials',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildIconData(Icons.bookmark_outline, 'Bookmark'),
                      const SizedBox(
                        width: 15,
                      ),
                      _buildIconData(Icons.sentiment_satisfied, 'Rate'),
                      const SizedBox(
                        width: 15,
                      ),
                      _buildIconData(Icons.language, 'Language'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildIconData(IconData icon, String iconName) {
  return Column(
    children: [
      Icon(
        icon,
        color: Colors.white,
      ),
      Container(
        margin: const EdgeInsets.all(5),
        child: Text(
          iconName,
          style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
        ),
      )
    ],
  );
}
