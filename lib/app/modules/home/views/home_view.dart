import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final ThemeData dark = ThemeData(
    backgroundColor: const Color(0xFF131E27),
    primaryColor: const Color(0xffeb8034),
    brightness: Brightness.dark,
    highlightColor: Colors.white60,
  );
  final ThemeData light = ThemeData(
    backgroundColor: const Color(0xffEBEBEB),
    primaryColor: const Color(0xffeb8034),
    brightness: Brightness.light,
    highlightColor: Colors.black38,
  );
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    final heightApp = Get.height -
        context.mediaQueryPadding.top -
        context.mediaQueryPadding.bottom;
    final widhtApp = Get.width;
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: widhtApp,
                  // color: Colors.amberAccent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 20),
                      SingleChildScrollView(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Obx(
                            () => Text(
                              "${controller.hasil}",
                              style: TextStyle(
                                fontSize: 70,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => Text(
                          "${controller.text}",
                          style: TextStyle(
                            fontSize: 20,
                            color: context.theme.highlightColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: heightApp * 0.6,
                // color: Colors.amber,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        itemBtn(
                          text: "^",
                          value: "^",
                        ),
                        itemBtn(
                          text: "C",
                          value: "Clear",
                        ),
                        itemBtn(
                          text: "AC",
                          value: "AllClear",
                        ),
                        Material(
                          color: context.theme.primaryColor,
                          borderRadius: BorderRadius.circular(15),
                          elevation: 10,
                          child: InkWell(
                            onTap: () {
                              Get.changeTheme(Get.isDarkMode ? light : dark);
                            },
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              width: Get.width * 0.20,
                              height: Get.width * 0.15,
                              // color: Colors.purple,
                              child: Center(
                                  child: Icon(
                                Icons.color_lens_outlined,
                                color: Colors.white,
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        itemBtn(
                          text: "(",
                          value: "(",
                        ),
                        itemBtn(
                          text: ")",
                          value: ")",
                        ),
                        itemBtn(
                          text: "%",
                          value: "%",
                        ),
                        itemBtn(
                          text: ":",
                          value: "/",
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        itemBtn(
                          text: "7",
                          value: "7",
                        ),
                        itemBtn(
                          text: "8",
                          value: "8",
                        ),
                        itemBtn(
                          text: "9",
                          value: "9",
                        ),
                        itemBtn(
                          text: "*",
                          value: "*",
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        itemBtn(
                          text: "4",
                          value: "4",
                        ),
                        itemBtn(
                          text: "5",
                          value: "5",
                        ),
                        itemBtn(
                          text: "6",
                          value: "6",
                        ),
                        itemBtn(
                          text: "-",
                          value: "-",
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        itemBtn(
                          text: "1",
                          value: "1",
                        ),
                        itemBtn(
                          text: "2",
                          value: "2",
                        ),
                        itemBtn(
                          text: "3",
                          value: "3",
                        ),
                        itemBtn(
                          text: "+",
                          value: "+",
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        itemBtn(
                          text: "0",
                          value: "0",
                        ),
                        itemBtn(
                          text: ".",
                          value: ".",
                        ),
                        Material(
                          color: context.theme.primaryColor,
                          borderRadius: BorderRadius.circular(15),
                          elevation: 10,
                          child: InkWell(
                            onTap: () {
                              controller.eksekusi();
                            },
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              width: Get.width * 0.20 * 2.2,
                              height: Get.width * 0.15,
                              // color: Colors.purple,
                              child: Center(
                                child: const Text(
                                  "=",
                                  style: TextStyle(
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class itemBtn extends GetView<HomeController> {
  const itemBtn({
    Key? key,
    required this.text,
    required this.value,
  }) : super(key: key);

  final String text;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      color: context.theme.backgroundColor,
      elevation: 3,
      child: InkWell(
        onTap: () {
          controller.changeText(value);
        },
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: Get.width * 0.20,
          height: Get.width * 0.15,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
