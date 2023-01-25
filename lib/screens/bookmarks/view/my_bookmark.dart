import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toppr1/screens/previous_paper/widgets/build_text.dart';

class MyBookMarkView extends StatelessWidget {
  const MyBookMarkView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              //   titleSpacing: 0,
              // centerTitle: true,
              title: const BuildText(
                text: 'My BookMarks',
                colors: Colors.black,
              ),
              automaticallyImplyLeading: false,
              elevation: 1,
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back),
                color: Colors.black,
              ),
              expandedHeight: 160,
              floating: false,
              pinned: true,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xffc8e5e6), Colors.white],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: const FlexibleSpaceBar(
                  //titlePadding: const EdgeInsets.only(left: 20, bottom: 20),
                  centerTitle: true,
                  title: Text(
                    '',
                    // controller.mathsChaptList?.data?.subject?.name ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              bottom: PreferredSize(
                  preferredSize: const Size(300, 40),
                  child: SizedBox(
                    width: 300,
                    child: TabBar(
                        indicatorColor: Colors.red.shade400,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey.shade500,
                        tabs: const [
                          Tab(
                            text: 'SUBJECTS',
                          ),
                          Tab(
                            text: 'NOTEBOOKS',
                          )
                        ]),
                  )),
            ),
            SliverFillRemaining(
              child: TabBarView(children: [
                Column(
                  children: [
                    const Spacer(),
                    Icon(
                      Icons.bookmark,
                      color: Colors.grey.shade500,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BuildText(
                      text: 'Your bookmarks will appear here',
                      colors: Colors.grey.shade500,
                      weight: FontWeight.bold,
                      size: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, top: 8),
                      child: BuildText(
                        text: 'You can bookmark concepts, video lectures and ',
                        colors: Colors.grey.shade500,
                        size: 16,
                        textalign: TextAlign.center,
                      ),
                    ),
                    Center(
                      child: BuildText(
                        text: 'questions',
                        colors: Colors.grey.shade500,
                        size: 16,
                      ),
                    ),
                    const Spacer()
                  ],
                ),
                Column(
                  children: [
                    const Spacer(),
                    Icon(
                      Icons.note_add,
                      color: Colors.grey.shade500,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BuildText(
                      text: 'Your Notebooks will appear here',
                      colors: Colors.grey.shade500,
                      weight: FontWeight.bold,
                      size: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, top: 8),
                      child: BuildText(
                        text:
                            'Notebooks let you to group items together so you can ',
                        colors: Colors.grey.shade500,
                        size: 14,
                        textalign: TextAlign.center,
                      ),
                    ),
                    Center(
                      child: BuildText(
                        text: 'quickly refer them later',
                        colors: Colors.grey.shade500,
                        size: 14,
                      ),
                    ),
                    const Spacer()
                  ],
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
