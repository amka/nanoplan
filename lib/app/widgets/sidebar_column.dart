import 'package:flutter/material.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';

import '../data/services/auth.dart';

class SidebarColumn extends StatelessWidget {
  SidebarColumn({super.key});

  final AuthService authService = Get.find();

  final _navItems = const [
    NavItemModel(name: 'Inbox', icon: TablerIcons.inbox),
    NavItemModel(name: 'Watching', icon: TablerIcons.sunglasses),
    NavItemModel(name: 'Uncategorized', icon: TablerIcons.chef_hat),
  ];
  final _accountItems = const [
    NavItemModel(name: 'Item 4', icon: Icons.access_alarms_sharp),
    NavItemModel(name: 'Item 5', icon: Icons.accessibility_new_sharp),
    NavItemModel(name: 'Item 6', icon: Icons.ac_unit_sharp),
  ];

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      backgroundColor: Theme.of(context).colorScheme.tertiary.withAlpha(35),
      hasResizerToggle: false,
      resizerData: ResizerData(
        resizerHoverColor: Theme.of(context).colorScheme.primary,
      ),
      builder: (data) => SideMenuData(
        header: Column(
          children: [
            ListTile(
              leading: const Icon(TablerIcons.brand_netflix),
              title: const Text('Nanoplan').showOrNull(data.isOpen),
              trailing: const Icon(Icons.search).showOrNull(data.isOpen),
            ),
          ],
        ),
        items: [
          ..._navItems
              .map(
                (e) => SideMenuItemDataTile(
                  isSelected: e.name == 'Inbox',
                  hasSelectedLine: false,
                  onTap: () {},
                  title: e.name,
                  icon: Icon(
                    e.icon,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              )
              .toList(),
          const SideMenuItemDataDivider(divider: Divider()),
          SideMenuItemDataTitle(
            title: 'Account',
            titleStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onTertiaryContainer),
            padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
          ),
          ..._accountItems
              .map(
                (e) => SideMenuItemDataTile(
                  isSelected: false,
                  onTap: () {},
                  title: e.name,
                  margin: const EdgeInsetsDirectional.symmetric(horizontal: 8),
                  icon: Icon(
                    e.icon,
                    color: const Color(0xff8e8e8e),
                  ),
                  // badgeContent: const Text(
                  //   '23',
                  //   style: TextStyle(
                  //     fontSize: 8,
                  //     color: Colors.white,
                  //   ),
                  // ).showOrNull(data.isOpen),
                ),
              )
              .toList(),
        ],
        footer: Obx(
          () => ListTile(
            title: Text(
              authService.user.value?.name ?? 'name',
            ).showOrNull(data.isOpen),
            subtitle: Text(
              authService.user.value?.email ?? 'email',
            ).showOrNull(data.isOpen),
            leading: const Icon(Icons.person_pin),
            trailing: MenuAnchor(
              menuChildren: [
                MenuItemButton(
                  child: const Text('Sign Out'),
                  onPressed: () async {
                    await authService.signOut();
                    Get.offAllNamed('/');
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
          ),
        ),
      ),
    );
  }
}

extension on Widget {
  Widget? showOrNull(bool isShow) => isShow ? this : null;
}

class NavItemModel {
  const NavItemModel({
    required this.name,
    required this.icon,
  });

  final String name;
  final IconData icon;
}
