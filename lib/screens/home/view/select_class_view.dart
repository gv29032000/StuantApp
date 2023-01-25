import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toppr1/screens/home/controller/home_controller.dart';
import 'package:toppr1/screens/previous_paper/widgets/build_text.dart';

class SelectClassView extends StatelessWidget {
  SelectClassView({super.key});
  HomeController controller = Get.find();
  int selectcard = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.grey.shade600,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Row(
          children: const [
            CircleAvatar(
              backgroundImage: NetworkImage(
                'https://cdn4.vectorstock.com/i/1000x1000/43/98/student-education-logo-vector-14724398.jpg',
              ),
            ),
            BuildText(
              text: 'toppr',
              colors: Colors.black,
            )
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const BuildText(
              text: 'I am in Class', weight: FontWeight.w700, size: 22),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 340,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: 80,
                      childAspectRatio: 1 / 1,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16),
                  itemCount: controller.selectClass?.data?.klassesList?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        controller.standared.value = index;
                        controller.selectedClass.value = controller
                                .selectClass?.data?.klassesList
                                ?.elementAt(index)
                                .klass ??
                            '';

                        print('Hellloo ${controller.selectedClassList.value}');
                      },
                      child: Obx(
                        () => Container(
                          // height: 7,
                          // width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: controller.standared.value == index
                                ? Colors.green.shade500
                                : Colors.white,
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Center(
                              child: BuildText(
                            text: controller.selectClass?.data?.klassesList
                                    ?.elementAt(index)
                                    .klass ??
                                '9',
                            colors: Colors.black,
                            weight: FontWeight.bold,
                            size: 22,
                          )),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          const Spacer(),
          SizedBox(
              width: 240,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade500),
                  onPressed: () {},
                  child: const BuildText(text: 'Next')))
        ],
      ),
    );
  }
}
