import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/data/providers/appwrite.dart';
import 'app/data/services/auth.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initServices();

  runApp(
    NanoplanApp(),
  );
}

class NanoplanApp extends StatelessWidget {
  NanoplanApp({
    super.key,
  });

  final AuthService authService = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "NanoPlan",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
        textTheme: GoogleFonts.ibmPlexSansTextTheme(),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.ibmPlexSansTextTheme(),
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}

Future initServices() async {
  await GetStorage.init();

  const apiUrl = String.fromEnvironment('API_URL');
  final provider = AppWriteProvider(apiUrl);

  await Get.putAsync(() => AuthService(provider: provider).init());
}
