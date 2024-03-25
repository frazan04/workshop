import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Students", // beri nama aplikasi
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
