import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/application/tasks_cubit/tasks_cubit.dart';
import 'package:todo_list/constants/functions.dart';
import 'package:todo_list/domain/task_model/task_model.dart';
import 'package:todo_list/gen/assets.gen.dart';
import 'package:todo_list/presentation/helpers/app_colors.dart';
import 'package:todo_list/presentation/helpers/app_styles.dart';
import 'package:todo_list/presentation/widgets/drawer_widgets/drawer_tasks_appbar.dart';
import 'package:todo_list/presentation/widgets/tasks_page_widgets/show_tasks/task_item.dart';

class CompletedTasksPage extends StatelessWidget {
  static const pageName = 'CompletedTasksPageName';
  const CompletedTasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    List<TaskModel> tasks = context
        .watch<TasksCubit>()
        .state
        .tasks
        .where((element) => element.isCompleted == true)
        .toList();
    return Scaffold(
      appBar:emptyAppBar(),
      backgroundColor: AppColors.mainBackgroundColor,
      body: Column(
        children: [
          CustomAppbar(
            title: 'Completed Tasks',
            icon: Assets.icons.search,
            onIconPressed: () {},
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: tasks.isEmpty
                  ? [
                      const Padding(
                        padding: EdgeInsets.all(
                          8.0,
                        ),
                        child: Text(
                          'No tasks',
                          style: AppStyles.titleNameTextStyle,
                        ),
                      )
                    ]
                  : List.generate(
                      tasks.length,
                      (index) {
                        return TaskItem(
                          task: tasks[index],
                        );
                      },
                    ),
            ),
          )),
        ],
      ),
    );
  }
}
