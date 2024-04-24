import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/application/task_cubit/task_cubit.dart';
import 'package:todo_list/application/tasks_cubit/tasks_cubit.dart';
import 'package:todo_list/constants/functions.dart';
import 'package:todo_list/l10n/l10n.dart';
import 'package:todo_list/presentation/widgets/new_task/dialogues/show_categories_dialogue.dart';
import 'package:todo_list/presentation/widgets/new_task/dialogues/show_date_picker_dialogue.dart';
import 'package:todo_list/presentation/widgets/new_task/buttons/task_button.dart';
import 'package:todo_list/presentation/widgets/new_task/error_dialogue.dart';
import 'package:todo_list/presentation/widgets/new_task/subtask_input.dart';

import '../../../helpers/app_colors.dart';
import '../../../helpers/app_styles.dart';
import '../buttons/confirm_button.dart';

class ShowNewTaskDialogue extends StatelessWidget {
  const ShowNewTaskDialogue({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n!;
    final controller = TextEditingController();
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: AppColors.mainBoxColor,
      contentPadding: const EdgeInsets.all(0.1),
      content: Container(
        decoration: dialogueDecoration(),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        width: MediaQuery.of(context).size.width * 0.9,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  l10n.addTask,
                  style: AppStyles.titleNameTextStyle,
                ),
              ),
              Column(
                children: [
                  textInput(context, l10n, controller),
                  const SubTaskInput(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NewTaskButton(
                    title: l10n.category,
                    onPressed: () => showDialog(
                        context: context,
                        builder: (context) => const ShowCategoriesDialogue()),
                  ),
                  NewTaskButton(
                    title: l10n.dateAndTime,
                    onPressed: () => showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => const ShowDatePickerDialogue(),
                    ),
                  ),
                  ConfirmButton(
                    title: l10n.set,
                    onPressed: () =>
                        _onTaskConfirmed(context, controller.value.text),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget textInput(BuildContext context, AppLocalizations l10n,
      TextEditingController controller) {
    return TextFormField(
      onSaved: (newValue) =>
          context.read<TaskCubit>().changeName(newValue ?? l10n.newTask),
      onFieldSubmitted: (value) => context.read<TaskCubit>().changeName(value),
      onChanged: (value) => context.read<TaskCubit>().changeName(value),
      controller: controller,
      textInputAction: TextInputAction.search,
      decoration: const InputDecoration(
        hintText: 'Title',
        hintStyle: AppStyles.buttonTextStyle,
      ),
      style: AppStyles.titleNameTextStyle,
    );
  }

  void _onTaskConfirmed(BuildContext context, String text) {
    final l10n = context.l10n!;

    if (text == '' || text.isEmpty) {
      showErrorDialog(context, 'Please,complete the fields');
    } else {
      final task = context.read<TaskCubit>();
      context.read<TasksCubit>().addTask(task.getNewTask());
      task.createNewTask();
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.mainBoxColor,
          content: Text(l10n.taskAdded),
          duration: const Duration(seconds: 1),
        ),
      );
    }
  }
}
