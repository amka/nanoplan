import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:get/get.dart';

import '../providers/appwrite.dart';

enum AuthStatus {
  uninitialized,
  authenticated,
  unauthenticated,
}

class AuthService extends GetxService {
  final AppWriteProvider provider;

  final authenticated = false.obs;
  final user = Rx<User?>(null);

  final status = Rx<AuthStatus>(AuthStatus.uninitialized);

  RealtimeSubscription? subscription;

  // Getter methods
  String? get username => user.value?.name;
  String? get email => user.value?.email;
  String? get userid => user.value?.$id;

  AuthService({required this.provider});

  Future<AuthService> init() async {
    await loadUser();
    if (user.value != null) {
      subscription = provider.realtime.subscribe(['account']);

      subscription?.stream.listen((event) {
        log('AuthEvent: $event');
      });
    }
    return this;
  }

  @override
  void onClose() {
    subscription?.close();
  }

  Future<User?> loadUser() async {
    log('Loading user...');
    try {
      user.value = await provider.account.get();
      status.value = AuthStatus.authenticated;
      return user.value;
    } catch (e) {
      status.value = AuthStatus.unauthenticated;
      return null;
    }
  }

  Future<void> signUp({required String email, required String password}) async {
    await provider.account.create(
      userId: ID.unique(),
      email: email,
      password: password,
    );
    await signIn(email: email, password: password);
  }

  Future<void> signIn({required String email, required String password}) async {
    await provider.account.createEmailSession(email: email, password: password);
    final user = await provider.account.get();
    this.user.value = user;
    status.value = AuthStatus.authenticated;
  }

  Future<void> signOut() async {
    await provider.account.deleteSession(sessionId: 'current');
    status.value = AuthStatus.unauthenticated;
  }
}
