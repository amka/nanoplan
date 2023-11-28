import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

import 'package:get/get.dart';

// import '../../../widgets/sidebar_column.dart';
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
            // SidebarColumn(),

            // Main content area
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: kToolbarHeight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          const Icon(TablerIcons.brand_netflix),
                          const SizedBox(width: 8),
                          Text(
                            'Nanoplan',
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onBackground),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.authService.user.value?.name ?? 'Anonymous',
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.onBackground)
                                ),
                                Text(
                                  controller.authService.user.value?.email ?? '',
                                  style: TextStyle(
                                    fontSize: 14,
                                      color:
                                          Theme.of(context).colorScheme.onBackground.withAlpha(150))
                                ),
                              ],
                            ),
                          ),
                          MenuAnchor(
                            menuChildren: [
                              MenuItemButton(
                                child: const Text('Sign Out'),
                                onPressed: () async {
                                  await controller.signOut();
                                },
                              ),
                            ],
                            builder: (context, controller, Widget? child) {
                              return IconButton(
                                  visualDensity: VisualDensity.compact,
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    if (controller.isOpen) {
                                      controller.close();
                                    } else {
                                      controller.open();
                                    }
                                  },
                                  icon: const Icon(TablerIcons.dots_vertical));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Heading',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onBackground),
                      ),
                    ],
                  ),
                  // ListView.builder(
                  //   itemBuilder: (BuildContext context, int index) {

                  //   },
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
