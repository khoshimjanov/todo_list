import 'package:flutter/material.dart';
import 'package:todo_list/l10n/l10n.dart';
import 'package:todo_list/presentation/helpers/app_colors.dart';
import 'package:todo_list/presentation/helpers/app_styles.dart';
import 'package:todo_list/presentation/widgets/new_task/dialogues/show_new_task_dialogue.dart';

class CreateNewTaskButton extends StatelessWidget {
  const CreateNewTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => const ShowNewTaskDialogue(),
          );
        },
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.borderColor),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.add_box_outlined,
                  color: Colors.white,
                ),
                Text(
                  context.l10n!.addTask,
                  style: AppStyles.buttonTextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
