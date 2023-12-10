import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:get/get.dart';

import '../appwrite_provider.dart';

enum AuthStatus {
  uninitialized,
  authenticated,
  unauthenticated,
}

class AuthService extends GetxService {
  late final AppwriteProvider provider;

  final status = Rx<AuthStatus>(AuthStatus.uninitialized);
  final user = Rx<User?>(null);

  AuthService({required this.provider});

  Future<AuthService> init() async {
    await loadUser();

    return this;
  }

  Future loadUser() async {
    try {
      final user = await provider.account.get();
      status.value = AuthStatus.authenticated;
      this.user.value = user;
    } catch (e) {
      status.value = AuthStatus.unauthenticated;
    }
  }

  Future<void> signUp({required String email, required String password}) async {
    await provider.account.create(
      userId: ID.unique(),
      email: email,
      password: password,
      name: email.split('@')[0],
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
