import 'package:get/get.dart';
import 'package:nanoplan/app/data/models/member.dart';

import '../../../data/services/team.dart';

class SchedulerController extends GetxController {
  final TeamService teamService = Get.find();

  final teamMembers = <TeamMember>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    loadMembers();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future loadMembers() async {
    teamMembers.value = await teamService.loadMembers();
  }
}
