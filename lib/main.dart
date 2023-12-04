import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/data/services/storage/service.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initServices();

  runApp(
    GetMaterialApp(
      title: "NanoPlan",
      theme: ThemeData(
        colorSchemeSeed: Colors.pink.shade600,
        useMaterial3: true,
        textTheme: GoogleFonts.notoSansTextTheme(),
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

Future initServices() async {
  await GetStorage.init();

  await Get.putAsync(() => StorageService().init());
}
