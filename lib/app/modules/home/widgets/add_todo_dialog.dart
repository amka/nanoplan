import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';

class AddTodoDialog extends StatelessWidget {
  const AddTodoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(TablerIcons.x)),
                TextButton(
                  onPressed: () {},
                  child: const Text('Done'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
