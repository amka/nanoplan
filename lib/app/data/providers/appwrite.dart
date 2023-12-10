import 'package:appwrite/appwrite.dart';

class AppwriteProvider {
  late final Client _client;

  final String baseUrl;
  final String projectId;
  final String locale;
  final bool selfSigned;

  late final Account account;
  late final Avatars avatars;
  late final Databases databases;

  AppwriteProvider({
    required this.baseUrl,
    required this.projectId,
    this.locale = 'en-US',
    this.selfSigned = false,
  }) {
    _client = Client()
        .setEndpoint(baseUrl)
        .setProject(projectId)
        .setLocale(locale)
        .setSelfSigned(status: selfSigned);

    account = Account(_client);
    avatars = Avatars(_client);
    databases = Databases(_client);
  }
}
