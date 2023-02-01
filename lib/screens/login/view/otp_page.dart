import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toppr1/screens/home/controller/home_controller.dart';
import 'package:toppr1/screens/previous_paper/widgets/build_text.dart';

import '../../../routes/app_routes.dart';

class OTPPage extends StatelessWidget {
  OTPPage({super.key});
  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  // height: 10,
                  height: size.height * 0.01,
                ),
                const Icon(Icons.arrow_back),
                SizedBox(
                  height: size.height * 0.01,
                ),
                const BuildText(
                  text: 'Join Toppr',
                  weight: FontWeight.bold,
                  size: 16,
                ),
                SizedBox(
                  // height: 30,
                  height: size.height * 0.04,
                ),
                Container(
                  // width: 150,
                  width: size.width * 0.32,
                  height: size.height * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.network(
                        'https://www.mapsofindia.com/maps/india/india-flag.jpg',
                        // height: 30,
                        height: size.height * 0.03,
                        width: size.width * 0.08,
                        // width: 30,
                      ),
                      const BuildText(text: 'India'),
                      const Icon(Icons.keyboard_arrow_down)
                    ],
                  ),
                ),
                SizedBox(
                  // height: 20,
                  height: size.height * 0.02,
                ),
                BuildText(
                  text: '+91 ${controller.phoneNumber.value} ',
                  weight: FontWeight.bold,
                ),
                SizedBox(
                    // width: 320,
                    width: size.width * 0.9,
                    child: const Divider()),
                SizedBox(
                  width: size.width * 0.9,
                  child: ValueListenableBuilder(
                      valueListenable: controller.userController,
                      builder: (context, TextEditingValue value, __) {
                        return TextFormField(
                          controller: controller.userController,
                          cursorColor: Colors.grey.shade500,
                          onChanged: ((value) {
                            controller.userName.value == value;
                          }),
                          decoration: InputDecoration(
                            labelText: 'Name',
                            labelStyle: TextStyle(color: Colors.grey.shade500),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade500)),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade500),
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  // height: 20,
                  height: size.height * 0.03,
                ),
                GestureDetector(
                  onTap: () {
                    // builddefaultDialog();
                    Get.dialog(builddefaultDialog(size));
                  },
                  child: Container(
                    // height: 50,
                    height: size.height * 0.06,
                    // width: 320,\
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        SizedBox(
                          // width: 8,
                          width: size.width * 0.016,
                        ),
                        const BuildText(
                          text: 'Select Class',
                          weight: FontWeight.bold,
                          size: 16,
                          colors: Colors.grey,
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 18,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          // width: 6,
                          width: size.width * 0.014,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  // height: 40,
                  height: size.height * 0.06,
                ),
                Row(
                  children: [
                    // const Icon(Icons.check_box),
                    Obx(
                      () => Checkbox(
                        checkColor: Colors.white,
                        activeColor: Colors.green,
                        value: controller.valuefirst.value,
                        onChanged: (value) {
                          controller.valuefirst.value = value!;
                        },
                      ),
                    ),
                    const BuildText(
                        text: 'Get doubts solved instantly on whatsApp')
                  ],
                ),
                // const Spacer(),
                SizedBox(
                  // height: 146,
                  height: size.height * 0.19,
                ),
                const Center(
                  child: BuildText(
                    text: 'I HAVE AN INVITE CODE',
                    colors: Colors.blue,
                    size: 18,
                    weight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  // height: 30,
                  height: size.height * 0.04,
                ),
                GestureDetector(
                  onTap: () {
                    // if (controller.userName.value.isEmpty) {
                    //   Get.defaultDialog(middleText: 'Please select the class');
                    // } else {

                    // Get.toNamed(Routes.home);
                    Get.offNamed(Routes.home);
                    // }
                  },
                  child: Container(
                    // width: 320,
                    width: size.width * 0.9,
                    // height: 40,
                    height: size.height * 0.05,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.green.shade400),
                    child: const Center(
                      child: BuildText(
                        text: 'Get OTP',
                        colors: Colors.white,
                        size: 16,
                        weight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  // height: 20,
                  height: size.height * 0.03,
                ),
                Center(
                  child: BuildText(
                    text: 'I ALREADY HAVE AN ACCOUNT',
                    colors: Colors.grey.shade500,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  children: const [
                    BuildText(text: 'By signing up you agree to our', size: 14),
                    BuildText(
                      text: ' T&C',
                      colors: Colors.blue,
                      size: 14,
                    ),
                    BuildText(
                      text: ' and',
                      size: 14,
                    ),
                    BuildText(
                      text: ' privacy policy',
                      size: 14,
                      colors: Colors.blue,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  builddefaultDialog(Size size) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          // height: 400,
          height: size.height * 0.5,
          // width: 400,
          width: size.width * 0.99,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const DefaultTextStyle(
                style: TextStyle(),
                child: BuildText(
                  text: 'Select Class',
                  colors: Colors.black,
                  size: 18,
                  weight: FontWeight.bold,
                ),
              ),
              SizedBox(
                // height: 340,
                height: size.height * 0.45,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisExtent: 80,
                              childAspectRatio: 1 / 1,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16),
                      itemCount:
                          controller.selectClass?.data?.klassesList?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            print('Heloooo ${controller.standared}');
                            controller.standared.value = index.toString();
                            controller.selectedClass.value = controller
                                    .selectClass?.data?.klassesList
                                    ?.elementAt(index)
                                    .klass ??
                                '';

                            print(
                                'Hellloo ${controller.selectedClassList.value}');
                          },
                          child: Obx(
                            () => Container(
                              // height: 7,
                              height: size.height * 0.07,
                              // width: 30,
                              width: size.width * 0.09,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: controller.standared.value ==
                                        index.toString()
                                    ? Colors.green.shade500
                                    : Colors.white,
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Center(
                                child: DefaultTextStyle(
                                  style: const TextStyle(),
                                  child: BuildText(
                                    text: controller
                                            .selectClass?.data?.klassesList
                                            ?.elementAt(index)
                                            .klass ??
                                        '9',
                                    colors: Colors.black,
                                    weight: FontWeight.bold,
                                    size: 22,
                                  ),
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
        ),
      ),
    );
  }
}
