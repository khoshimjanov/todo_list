import 'package:flutter/material.dart';

import 'package:todo_list/constants/functions.dart';
import 'package:todo_list/domain/task_model/task_model.dart';
import 'package:todo_list/l10n/l10n.dart';
import 'package:todo_list/presentation/widgets/tasks_page_widgets/show_tasks/show_tasks_list.dart';

class ShowTasks extends StatelessWidget {
  final List<TaskModel> tasks;
  const ShowTasks({
    super.key,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    List<TaskModel> previousTasks = tasks
        .where(
            (element) => element.isCompleted == false && !isToday(element.time))
        .toList();
    List<TaskModel> todaysTasks =
        tasks.where((element) => isToday(element.time)).toList();
    List<TaskModel> completedTasks =
        tasks.where((element) => element.isCompleted == true).toList();
    return Padding(
      padding: const EdgeInsets.all(
        20,
      ),
      child: Column(
        children: [
          ShowTasksList(
            tasks: previousTasks,
            title: context.l10n!.previousTasks,
          ),
          ShowTasksList(
            tasks: completedTasks,
            title: context.l10n!.completedTasks,
          ),
          ShowTasksList(
            tasks: todaysTasks,
            title: context.l10n!.todaysdTasks,
          ),
        ],
      ),
    );
  }
}
