import 'package:get/get.dart';

import '../../models/project.dart';
import '../storage/service.dart';

class ProjectService extends GetxService {
  late final StorageService storage;

  ProjectService({required this.storage});

  Future<Project?> get(String id) async {
    return await storage.get<Project>(id);
  }

  Future<List<Project>> getAll() async {
    return await storage.getAll<Project>();
  }
}
