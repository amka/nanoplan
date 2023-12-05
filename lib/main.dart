import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nanoplan/app/data/providers/task.dart';
import 'package:nanoplan/app/data/services/storage/repository.dart';

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
        textTheme: GoogleFonts.notoSansTextTheme(),
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blue,
        brightness: Brightness.dark,
        useMaterial3: true,
        textTheme: GoogleFonts.notoSansTextTheme(),
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      builder: EasyLoading.init(),
    ),
  );
}

Future initServices() async {
  await GetStorage.init();

  await Get.putAsync(() => StorageService().init());

  final taskProvider = TaskProvider();
  Get.put(TaskRepository(taskProvider: taskProvider));
}
