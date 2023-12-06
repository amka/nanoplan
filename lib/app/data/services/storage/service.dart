import 'dart:io';

import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:nanoplan/app/core/extensions.dart';
import 'package:path_provider/path_provider.dart';

class StorageService extends GetxService {
  late final Isar _isar;

  late final Directory dir;

  Future init({
    required List<CollectionSchema<dynamic>> schemes,
    Directory? dir,
  }) async {
    this.dir = dir ?? await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      schemes,
      directory: this.dir.path,
    );
    return this;
  }

  Future<T?> get<T>(String id) async {
    return await _isar.collection<T>().get(id.fastHash());
  }

  Future<List<T>> getAll<T>() async {
    return await _isar.collection<T>().where().findAll();
  }
}
