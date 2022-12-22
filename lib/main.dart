import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      theme: ThemeData(
        backgroundColor: const Color(0xFF131E27),
        primaryColor: const Color(0xffeb8034),
        brightness: Brightness.dark,
        highlightColor: Colors.white60,
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
