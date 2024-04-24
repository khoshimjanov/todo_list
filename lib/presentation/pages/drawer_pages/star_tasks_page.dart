import 'package:flutter/material.dart';
import 'package:todo_list/constants/functions.dart';
import 'package:todo_list/presentation/helpers/app_colors.dart';
import 'package:todo_list/presentation/widgets/drawer_widgets/drawer_tasks_appbar.dart';

import '../../../gen/assets.gen.dart';

class StarTasksPage extends StatelessWidget {
  static const pageName = 'StarTasksPageName';
  const StarTasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: emptyAppBar(),
      backgroundColor: AppColors.mainBackgroundColor,
      body: Column(
        children: [
          CustomAppbar(
            title: 'StarTasks',
            icon: Assets.icons.search,
            onIconPressed: () {},
          ),
          const Text(
            "StarTasksPageName",
          ),
        ],
      ),
    );
  }
}
