import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanoplan/app/data/models/project.dart';
import 'package:nanoplan/app/data/services/project/service.dart';

import 'app/data/services/storage/service.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initServices();

  runApp(
    GetMaterialApp(
      title: "NanoPlan",
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
        textTheme: GoogleFonts.interTextTheme(),
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blue,
        brightness: Brightness.dark,
        useMaterial3: true,
        textTheme: GoogleFonts.interTextTheme(),
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      builder: EasyLoading.init(),
    ),
  );
}

Future initServices() async {
  final storage = await StorageService().init(schemes: [
    ProjectSchema,
  ]);

  Get.put(storage);
  Get.put(ProjectService(storage: storage));
}
