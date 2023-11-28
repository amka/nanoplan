import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AppWriteProvider extends GetxService {
  late final Client client;

  late final Account account;
  late final Realtime realtime;
  late final Databases databases;

  AppWriteProvider(String endpoint) {
    log('AppWrite initalizing with endpoint $endpoint');
    client = Client();
    client.setEndpoint(endpoint).setProject('nanoplan').setSelfSigned(
          status: kDebugMode,
        ); // For self signed certificates, only use for development

    account = Account(client);
    realtime = Realtime(client);
    databases = Databases(client);
  }
}
