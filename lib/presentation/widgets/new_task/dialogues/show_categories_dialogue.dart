import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:todo_list/application/task_cubit/task_cubit.dart';
import 'package:todo_list/constants/functions.dart';
import 'package:todo_list/domain/category_model/category_model.dart';
import 'package:todo_list/presentation/widgets/new_task/buttons/task_button.dart';

import '../../../helpers/app_colors.dart';
import '../../../helpers/app_styles.dart';
import '../buttons/category_button.dart';
import '../buttons/confirm_button.dart';

class ShowCategoriesDialogue extends StatelessWidget {
  const ShowCategoriesDialogue({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: AppColors.mainBoxColor,
      contentPadding: const EdgeInsets.all(0.1),
      content: Container(
        decoration: dialogueDecoration(),
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.35,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Set category",
                    style: AppStyles.titleNameTextStyle,
                  ),
                ),
              ),
              const Expanded(
                flex: 2,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CategoryButton(category: Category.nocategory),
                        CategoryButton(category: Category.work),
                        CategoryButton(category: Category.personal)
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CategoryButton(category: Category.wishlist),
                        CategoryButton(category: Category.birthday),
                        CategoryButton(category: Category.daily)
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    NewTaskButton(
                      title: 'Cancel',
                      onPressed: () {
                        Navigator.of(context).pop();
                        context
                            .read<TaskCubit>()
                            .changeCategory(Category.nocategory);
                      },
                    ),
                    const Gap(10),
                    ConfirmButton(
                      title: 'Set',
                      onPressed: () {
                        // context.read<TasksCubit>().addTask(TaskModel.demo());
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
