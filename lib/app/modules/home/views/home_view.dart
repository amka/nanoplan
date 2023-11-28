import 'package:flutter/material.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';

import 'package:get/get.dart';

import '../../../widgets/sidebar_column.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            // Sidebar view
            SidebarColumn(),

            // Main content area
            Expanded(
              child: Center(
                child: Text(
                  'Home',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
            ),

            SideMenu(
              position: SideMenuPosition.right,
              builder: (data) => const SideMenuData(
                customChild: Text('Custom view'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
