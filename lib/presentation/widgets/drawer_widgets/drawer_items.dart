import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/application/tasks_cubit/tasks_cubit.dart';
import 'package:todo_list/gen/assets.gen.dart';
import 'package:todo_list/l10n/l10n.dart';
import 'package:todo_list/presentation/pages/drawer_pages/category_tasks_page.dart';
import 'package:todo_list/presentation/pages/drawer_pages/completed_tasks_page.dart';
import 'package:todo_list/presentation/pages/drawer_pages/faq_page.dart';
import 'package:todo_list/presentation/pages/drawer_pages/settings_page.dart';
import 'package:todo_list/presentation/pages/drawer_pages/star_tasks_page.dart';
import 'package:todo_list/presentation/widgets/drawer_widgets/category_drawer_item.dart';
import 'package:todo_list/presentation/widgets/drawer_widgets/category_task_tile.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final tasks = context
        .watch<TasksCubit>()
        .state
        .tasks
        .where((element) => element.isCompleted == true)
        .toList();
    final l10n = context.l10n!;
    return Column(
      children: [
        DrawerItem(
            onTap: () =>
                Navigator.of(context).pushNamed(StarTasksPage.pageName),
            title: l10n.starTasks,
            icon: Assets.icons.star),
        const CategoryTasksTile(),
        DrawerItem(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CategoryTasksPage(
                tasks: tasks,
                title: l10n.completedTasks,
              ),
            ));
          },
          title: 'All',
          icon: Assets.icons.all,
          number: tasks.length.toString(),
        ),
        DrawerItem(
            onTap: () =>
                Navigator.of(context).pushNamed(CompletedTasksPage.pageName),
            title: l10n.completedTasks,
            icon: Assets.icons.completed),
        DrawerItem(
            onTap: () {}, title: l10n.feedback, icon: Assets.icons.feedback),
        DrawerItem(
          onTap: () => fadePush(context, const FaqPage()),
          title: l10n.faq,
          icon: Assets.icons.faq,
        ),
        DrawerItem(
            onTap: () => Navigator.of(context).pushNamed(SettingsPage.pageName),
            title: l10n.settings,
            icon: Assets.icons.settings),
      ],
    );
  }
}

void fadePush(BuildContext context, Widget child) {
  Navigator.of(context).push(
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return child;
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0;
        const end = 1.0;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(
          curve: curve,
        ));

        var offsetAnimation = animation.drive(tween);

        return FadeTransition(
          opacity: offsetAnimation,
          child: child,
        );
      },
    ),
  );
}
