import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CloseCard extends StatelessWidget {
  const CloseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            height: 390,
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 75,
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade100,
                            blurRadius: 4,
                            spreadRadius: 4,
                            offset: const Offset(0, 3))
                      ]),
                  child: const Icon(Icons.auto_graph_outlined),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Material(
                  color: Colors.transparent,
                  child: Text(
                    'Are you sure you want to exit?',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  width: 250,
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      'You have attempted 10 out of 10 questions',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          letterSpacing: 0.2,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey.shade600,
                          fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                BuildElevatedButton(
                    onPressed: () {
                      Get.close(2);
                    },
                    text: 'EXIT',
                    shape: const StadiumBorder(),
                    color: const Color(0xff7ed321),
                    textColor: Colors.white),
                const SizedBox(
                  height: 10,
                ),
                BuildElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  text: 'CANCEL',
                  shape: StadiumBorder(
                      side: BorderSide(color: Colors.grey.shade500)),
                  color: Colors.white,
                  textColor: Colors.grey.shade600,
                ),
              ],
            )),
      ),
    );
  }
}

class BuildElevatedButton extends CloseCard {
  const BuildElevatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.shape,
    required this.color,
    required this.textColor,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String text;
  final OutlinedBorder shape;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            minimumSize: const Size(270, 50),
            shape: shape,
            backgroundColor: color),
        child: Text(
          text,
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.w800, fontSize: 16),
        ));
  }
}
