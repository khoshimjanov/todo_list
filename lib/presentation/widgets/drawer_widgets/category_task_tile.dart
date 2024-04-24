import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list/application/tasks_cubit/tasks_cubit.dart';
import 'package:todo_list/domain/category_model/category_model.dart';
import 'package:todo_list/domain/task_model/task_model.dart';
import 'package:todo_list/gen/assets.gen.dart';
import 'package:todo_list/presentation/helpers/app_styles.dart';
import 'package:todo_list/presentation/pages/drawer_pages/category_tasks_page.dart';
import 'package:todo_list/presentation/widgets/drawer_widgets/category_drawer_item.dart';

class CategoryTasksTile extends StatelessWidget {
  const CategoryTasksTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<TaskModel> tasks = context.watch<TasksCubit>().state.tasks;
    return ExpansionTile(
      title: Row(children: [
        SvgPicture.asset(Assets.icons.category, width: 20),
        const SizedBox(
          width: 15,
        ),
        const Text('Category', style: AppStyles.titleNameTextStyle),
      ]),
      children: [
        DrawerItem(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CategoryTasksPage(
                tasks: tasks,
                title: 'All',
              ),
            ));
          },
          title: 'All',
          icon: Assets.icons.all,
          number: tasks.length.toString(),
          
        ),
        DrawerItem(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CategoryTasksPage(
                    tasks: tasks
                        .where((element) => element.category == Category.work)
                        .toList(),
                    title: 'Work'),
              ));
            },
            title: 'Work',
            icon: Assets.icons.work,
            number: '1'),
        DrawerItem(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CategoryTasksPage(
                    tasks: tasks
                        .where(
                            (element) => element.category == Category.personal)
                        .toList(),
                    title: 'Personal'),
              ));
            },
            title: 'Personal',
            icon: Assets.icons.person,
            number: tasks
                .where((element) => element.category == Category.personal)
                .toList()
                .length
                .toString()),
        DrawerItem(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CategoryTasksPage(
                    tasks: tasks
                        .where(
                            (element) => element.category == Category.wishlist)
                        .toList(),
                    title: 'Wishlist'),
              ));
            },
            title: 'Wishlist',
            icon: Assets.icons.wishlist,
            number: tasks
                .where((element) => element.category == Category.wishlist)
                .toList()
                .length
                .toString()),
        DrawerItem(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CategoryTasksPage(
                    tasks: tasks
                        .where(
                            (element) => element.category == Category.birthday)
                        .toList(),
                    title: 'Birthday'),
              ));
            },
            title: 'Birthday',
            icon: Assets.icons.birthday,
            number: tasks
                .where((element) => element.category == Category.birthday)
                .toList()
                .length
                .toString()),
      ],
    );
  }
}
