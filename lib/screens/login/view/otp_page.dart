import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toppr1/routes/app_routes.dart';
import 'package:toppr1/screens/home/controller/home_controller.dart';
import 'package:toppr1/screens/previous_paper/widgets/build_text.dart';

class OTPPage extends StatelessWidget {
  OTPPage({super.key});
  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Icon(Icons.arrow_back),
              const SizedBox(
                height: 10,
              ),
              const BuildText(
                text: 'Join Toppr',
                weight: FontWeight.bold,
                size: 16,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network(
                      'https://www.shutterstock.com/image-vector/india-flag-260nw-182339339.jpg',
                      height: 30,
                      width: 30,
                    ),
                    const BuildText(text: 'India'),
                    const Icon(Icons.keyboard_arrow_down)
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BuildText(
                text: '+91 ${controller.phoneNumber.value ?? '8438362709'} ',
                weight: FontWeight.bold,
              ),
              const SizedBox(width: 320, child: Divider()),
              SizedBox(
                width: 320,
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
                            borderSide: BorderSide(color: Colors.grey.shade500),
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  // builddefaultDialog();
                  Get.dialog(builddefaultDialog());
                },
                child: Container(
                  height: 50,
                  width: 320,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 8,
                      ),
                      BuildText(
                        text: 'Select Class',
                        weight: FontWeight.bold,
                        size: 16,
                        colors: Colors.grey,
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 18,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
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
              const Spacer(),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: BuildText(
                  text: 'I HAVE AN INVITE CODE',
                  colors: Colors.blue,
                  size: 18,
                  weight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  // if (controller.userName.value.isEmpty) {
                  //   Get.defaultDialog(middleText: 'Please select the class');
                  // } else {

                  Get.toNamed(Routes.home);
                  // }
                },
                child: Center(
                  child: Container(
                    width: 320,
                    height: 40,
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
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: BuildText(
                  text: 'I ALREADY HAVE AN ACCOUNT',
                  colors: Colors.grey.shade500,
                ),
              ),
              const SizedBox(
                height: 20,
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
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  builddefaultDialog() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          height: 400,
          width: 400,
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
                height: 340,
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
                            controller.standared.value = index;
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
                              height: 7,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: controller.standared.value == index
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
                              )),
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
    // Center(
    //   child: SizedBox(
    //     height: 500,
    //     width: 500,
    //     child: Column(
    //       children: [
    //         Row(
    //           children: [
    //             const BuildText(text: 'Select Class'),
    //             const Spacer(),
    //             IconButton(
    //                 onPressed: () {
    //                   Get.close(1);
    //                 },
    //                 icon: const Icon(Icons.close))
    //           ],
    //         ),
    //         SizedBox(
    //           height: 340,
    //           child: Padding(
    //             padding: const EdgeInsets.all(30),
    //             child: GridView.builder(
    //                 gridDelegate:
    //                     const SliverGridDelegateWithFixedCrossAxisCount(
    //                         crossAxisCount: 3,
    //                         mainAxisExtent: 80,
    //                         childAspectRatio: 1 / 1,
    //                         mainAxisSpacing: 16,
    //                         crossAxisSpacing: 16),
    //                 itemCount:
    //                     controller.selectClass?.data?.klassesList?.length,
    //                 itemBuilder: (BuildContext context, int index) {
    //                   return GestureDetector(
    //                     onTap: () {
    //                       controller.standared.value = index;
    //                       controller.selectedClass.value = controller
    //                               .selectClass?.data?.klassesList
    //                               ?.elementAt(index)
    //                               .klass ??
    //                           '';

    //                       print(
    //                           'Hellloo ${controller.selectedClassList.value}');
    //                     },
    //                     child: Obx(
    //                       () => Container(
    //                         // height: 7,
    //                         // width: 30,
    //                         decoration: BoxDecoration(
    //                           borderRadius: BorderRadius.circular(8),
    //                           color: controller.standared.value == index
    //                               ? Colors.green.shade500
    //                               : Colors.white,
    //                           border: Border.all(color: Colors.grey.shade300),
    //                         ),
    //                         child: Center(
    //                             child: BuildText(
    //                           text: controller.selectClass?.data?.klassesList
    //                                   ?.elementAt(index)
    //                                   .klass ??
    //                               '9',
    //                           colors: Colors.black,
    //                           weight: FontWeight.bold,
    //                           size: 22,
    //                         )),
    //                       ),
    //                     ),
    //                   );
    //                 }),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // ),
  }
}
