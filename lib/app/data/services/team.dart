import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';

import '../models/member.dart';
import '../providers/appwrite.dart';

class TeamService extends GetxService {
  final AppWriteProvider provider;
  final String databaseId;
  static const collectionId = 'members';

  TeamService({required this.provider, required this.databaseId});

  Future<List<TeamMember>> loadMembers({int? limit, int? offset}) async {
    limit = limit ?? 15;
    offset = offset ?? 0;

    try {
      final docs = await provider.databases.listDocuments(
        databaseId: databaseId,
        collectionId: collectionId,
        queries: [
          Query.limit(limit),
          Query.offset(offset),
        ],
      );

      return docs.documents.map((e) => TeamMember.fromJson(e.data)).toList();
    } catch (e) {
      log('Error loading members: $e');
      return [];
    }
  }
}
