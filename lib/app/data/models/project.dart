import 'package:isar/isar.dart';
import 'package:nanoplan/app/core/extensions.dart';

part 'project.g.dart';

@collection
class Project {
  String? id;

  Id get isarId => id!.fastHash();

  String title;
  String? description;
  String color;
  int? icon;

  DateTime? createdAt;
  DateTime? updatedAt;

  Project({
    required this.title,
    this.description,
    this.color = '#61AFEF',
    this.icon,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    this.createdAt = createdAt ?? DateTime.now().toUtc();
    this.updatedAt = updatedAt ?? DateTime.now().toUtc();
  }
}
