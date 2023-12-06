import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';


import '../controllers/home_controller.dart';
import '../widgets/project_card.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projects'.tr),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Obx(
          () => GridView.count(
            crossAxisCount: (MediaQuery.of(context).size.width / 160).floor(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            children: [
              ...controller.projects
                  .map((project) => ProjectCard(
                        project: project,
                        onTap: () {},
                      ))
                  .toList(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(TablerIcons.plus),
      ),
    );
  }
}
