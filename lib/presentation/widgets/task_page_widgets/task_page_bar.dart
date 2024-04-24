import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo_list/application/tasks_cubit/tasks_cubit.dart';
import 'package:todo_list/domain/task_model/task_model.dart';
import 'package:todo_list/gen/assets.gen.dart';
import 'package:todo_list/presentation/helpers/app_colors.dart';
import 'package:todo_list/presentation/helpers/app_styles.dart';
import 'package:todo_list/presentation/widgets/drawer_widgets/drawer_tasks_appbar.dart';

import 'package:todo_list/presentation/widgets/tasks_page_widgets/show_tasks/dialogues/confirm_dialogue.dart';

class TaskPageBar extends StatelessWidget {
  // final String taskTitle;
  // final String? taskSubtitle;
  final Function() onSubmitted;
  const TaskPageBar({
    super.key,
    required this.task,
    required this.isChanged,
    required this.onSubmitted,
    // required this.taskTitle,
    // required this.taskSubtitle,
  });

  final TaskModel task;
  final ValueNotifier<bool> isChanged;

  @override
  Widget build(BuildContext context) {
    return CustomAppbar(
      title: task.taskName,
      icon: Assets.icons.moreVertical,
      onIconPressed: () {
        showMenu(
          context: context,
          position: const RelativeRect.fromLTRB(20, 20, 0, 0),
          items: [
            PopupMenuItem(
              labelTextStyle:
                  const MaterialStatePropertyAll(AppStyles.simpleTextStyle),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const ConfirmDialogue(
                      title: 'Do you want to mark it as done?',
                      cancelText: 'No',
                      confirmText: 'Yes',
                    );
                  },
                ).then(
                  (value) {
                    if (value == true) {
                      context.read<TasksCubit>().compleTask(task.id);
                      Navigator.pop(context);
                    }
                  },
                );
              },
              child: const Text(
                "Mark As Done",
              ),
            ),
            PopupMenuItem(
              labelTextStyle: const MaterialStatePropertyAll(
                AppStyles.simpleTextStyle,
              ),
              onTap: () {
                showDialog<bool>(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return const ConfirmDialogue(
                      title: 'Delete task?',
                      cancelText: 'Cancel',
                      confirmText: 'Done',
                    );
                  },
                ).then(
                  (value) {
                    if (value == true) {
                      BlocProvider.of<TasksCubit>(context)
                          .deleteTask(task.id, task.notificationId);
                      Navigator.pop(context);
                    }
                  },
                );
              },
              child: const Text(
                "Delete",
              ),
            ),
          ],
          color: AppColors.mainBackgroundColor,
        );
      },
      onExitPressed: () {
        if (isChanged.value == false) {
          Navigator.pop(context);
        } else {
          showDialog<bool>(
            context: context,
            builder: (context) => const ConfirmDialogue(
              title: 'Do you want to save changes?',
              cancelText: 'No',
              confirmText: 'Yes',
            ),
          ).then((value) {
            if (value == true) {
              try {
                onSubmitted();
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: AppColors.mainBoxColor,
                    content: Text('Changes saved!'),
                    duration: Duration(seconds: 1),
                  ),
                );
              } catch (e) {
                print('error:$e');
              }
            } else {
              Navigator.pop(context);
            }
          });
        }
      },
    );
  }
}

String as =
    """Been studying at Najot-Ta'lim center ,which teaches its students how to code with
high-level skills and helps them to reach the high levels of programming, since
December 2022.
Identified and resolved complex technical issues through debugging and
troubleshooting, ensuring optimal software performance.
With a year of experience in Flutter﻿ development, proven track record of building and
deploying high-performance mobile applications., good understanding of Flutter﻿ ,
Dart and Material Design, and skilled in using these technologies to create user-
friendly, cross-platform and visually appealing applications.""";
