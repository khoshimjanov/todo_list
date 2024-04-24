import 'package:flutter/material.dart';
import 'package:todo_list/presentation/helpers/app_colors.dart';
import 'package:todo_list/presentation/helpers/app_styles.dart';
import 'package:todo_list/presentation/widgets/new_task/buttons/confirm_button.dart';
import 'package:todo_list/presentation/widgets/new_task/buttons/task_button.dart';

class ConfirmDialogue extends StatelessWidget {
  final String title;
  final String cancelText;
  final String confirmText;

  const ConfirmDialogue({
    required this.title,
    required this.cancelText,
    required this.confirmText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: AppStyles.dialoguetitleTextStyle,
        overflow: TextOverflow.ellipsis,
      ),
      backgroundColor: AppColors.mainBoxColor,
      insetPadding: EdgeInsets.zero,
      actionsPadding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      titlePadding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      actions: [
        NewTaskButton(
          title: cancelText,
          onPressed: () => Navigator.of(context).pop(false),
        ),
        ConfirmButton(
          title: confirmText,
          onPressed: () => Navigator.of(context).pop(true),
        )
      ],
    );
  }
}
