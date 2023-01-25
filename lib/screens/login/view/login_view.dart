import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:toppr1/routes/app_routes.dart';
import 'package:toppr1/screens/home/controller/home_controller.dart';
import 'package:toppr1/screens/login/controller/login_controller.dart';
import 'package:toppr1/screens/previous_paper/widgets/build_text.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final LoginController controller = Get.put(LoginController());
  HomeController mycontroller = Get.find();
  final List<String> imgList = [
    'https://cdn01.vulcanpost.com/wp-uploads/2020/06/jomstudy-app-005.jpg',
    'https://cellularnews.com/wp-content/uploads/2019/09/Study-Apps_10_Quizlet-600x338.jpg',
    'https://article.study24x7.com/live/published/70d256e0-5b01-11eb-a10e-fd18d97d9012.png',
    'https://images.sftcdn.net/images/t_app-cover-l,f_auto/p/3afdc80c-e864-4ed3-afba-f81263a855ee/4133104254/dear-sir-the-learning-app-online-course-free-screenshot.png',
    'https://images.sftcdn.net/images/t_app-cover-l,f_auto/p/3afdc80c-e864-4ed3-afba-f81263a855ee/1028062102/dear-sir-the-learning-app-online-course-free-screenshot.png'
  ];
  final List<String> title = [
    'A complete learning app for class \t 5-12 Students',
    'Learn from Chapter-wise Videos',
    'Revise faster with Concepts',
    'Practice with unique questions',
    'Doubts? Get them out '
  ];
  final List<String> subtitle = [
    'Covers all boards and competitive exams',
    'Grasp concepts easily and become a happy learner',
    'Do quick revisions with definitions,formulae and examples',
    'Solve different questions to clear your concepts',
    'Have instant answers to your questions'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/logo_stuant.jpg',
                  // 'https://cdn4.vectorstock.com/i/1000x1000/43/98/student-education-logo-vector-14724398.jpg',
                  height: 50,
                  width: 50,
                ),
                const BuildText(
                  text: 'Stuant',
                  size: 18,
                  weight: FontWeight.w700,
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              // color: Colors.blue,
              height: 420,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                itemCount: imgList.length,
                onPageChanged: (value) {
                  controller.pageIndex.value = value;
                },
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  return Column(
                    children: [
                      Container(
                        height: 260,
                        padding: const EdgeInsets.all(16),
                        // color: Colors.white,
                        child: ColorFiltered(
                          colorFilter: const ColorFilter.mode(
                              Colors.white, BlendMode.dstOver),
                          child: Image.network(
                            imgList[index],
                            height: 220,
                            width: 220,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: BuildText(
                          textalign: TextAlign.center,
                          text: title[index],
                          size: 22,
                          weight: FontWeight.w700,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: BuildText(
                          text: subtitle[index],
                          textalign: TextAlign.center,
                          size: 14,
                          colors: Colors.grey.shade500,
                          weight: FontWeight.w300,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    indicators(imgList.length, controller.pageIndex.value),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              height: 182,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8))),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 18, top: 8, right: 8, bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const BuildText(
                        text: 'Get started Using Phone number',
                        size: 16,
                        weight: FontWeight.bold),
                    const SizedBox(
                      height: 12,
                    ),
                    buildTextformfield(mycontroller),
                    const SizedBox(
                      height: 32,
                    ),
                    GestureDetector(
                      onTap: () {
                        // if (mycontroller.phoneNumber.value.length == 10) {
                        //   // Get.toNamed();
                        //   Get.offNamed(Routes.otppage);
                        // } else {
                        //   Get.defaultDialog(
                        //     title: 'Alert! Number Invalid',
                        //     titleStyle: TextStyle(
                        //       color: Colors.red.shade400,
                        //     ),
                        //     middleText:
                        //         'Please Enter the 10 digit mobile Number',
                        //   );
                        // }
                        Get.offNamed(Routes.otppage);
                        print('helllllllo ${mycontroller.phoneNumber.value}');
                      },
                      child: Container(
                          width: 320,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.green.shade400),
                          child: const Center(
                            child: BuildText(
                              text: 'Get Started',
                              colors: Colors.white,
                              size: 16,
                              weight: FontWeight.bold,
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: 8,
        height: 8,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.black : Colors.black26,
            shape: BoxShape.circle),
      );
    });
  }

  buildTextformfield(HomeController controller) {
    return ValueListenableBuilder(
        valueListenable: controller.textcontroller,
        builder: (context, TextEditingValue value, __) {
          return Container(
            height: 35,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 4,
                ),
                const BuildText(
                  text: '+91',
                  weight: FontWeight.bold,
                  size: 14,
                ),
                const SizedBox(
                  width: 4,
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey.shade400,
                ),
                const VerticalDivider(
                  thickness: 2,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 20,
                      width: 200,
                      child: TextFormField(
                        controller: mycontroller.textcontroller,
                        showCursor: true,
                        cursorColor: Colors.grey.shade400,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          mycontroller.phoneNumber.value = value;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10)
                        ],
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            // errorText: controller.submitted.value
                            //     ? controller.errorText
                            //     : null,
                            hintStyle: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                            hintText: 'Enter Mobile Number'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
