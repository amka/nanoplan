import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/data/appwrite_provider.dart';
import 'app/data/services/auth.dart';
import 'app/routes/app_pages.dart';
import 'app/themes/dark.dart';
import 'app/themes/light.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appwrite = AppwriteProvider(
    baseUrl: "https://cloud.appwrite.io/v1",
    projectId: "nanoplan",
    locale: Get.locale.toString(),
    selfSigned: true,
  );

  final authService = AuthService(provider: appwrite);
  Get.put(authService);

  runApp(
    GetMaterialApp(
      title: "Void Tracker",
      darkTheme: ThemeData(
        colorScheme: darkScheme,
        textTheme: GoogleFonts.nunitoSansTextTheme(),
      ),
      theme: ThemeData(
        colorScheme: lightScheme,
        textTheme: GoogleFonts.nunitoSansTextTheme(),
      ),
      defaultTransition: Transition.fadeIn,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      builder: EasyLoading.init(),
    ),
  );
}
