import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gap/gap.dart';

import 'package:todo_list/application/task_cubit/task_cubit.dart';
import 'package:todo_list/application/tasks_cubit/tasks_cubit.dart';
import 'package:todo_list/domain/category_model/category_model.dart';
import 'package:todo_list/presentation/helpers/app_colors.dart';
import 'package:todo_list/presentation/helpers/app_styles.dart';
import 'package:todo_list/presentation/widgets/task_page_widgets/category_change_button.dart';
import 'package:todo_list/presentation/widgets/new_task/buttons/confirm_button.dart';
import 'package:todo_list/presentation/widgets/new_task/buttons/task_button.dart';

class ShowChangeCategoriesDialogue extends StatelessWidget {
  final String taskId;
  final Function(Category category) onCategoryChanged;
  const ShowChangeCategoriesDialogue({
    super.key,
    required this.taskId,
    required this.onCategoryChanged,
  });
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: AppColors.mainBoxColor,
      contentPadding: const EdgeInsets.all(0.2),
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainBoxColor,
          boxShadow: const [
            BoxShadow(
              
              color: AppColors.borderColor,
              offset: Offset(-0.5, -0.5),
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Set category",
                    style: AppStyles.titleNameTextStyle,
                  ),
                ),
              ),
              const Expanded(
                child: Column(
                  children: [
                    CategoryChangeButton(
                      category: Category.nocategory,
                    ),
                    CategoryChangeButton(
                      category: Category.work,
                    ),
                    CategoryChangeButton(
                      category: Category.personal,
                    ),
                    CategoryChangeButton(
                      category: Category.wishlist,
                    ),
                    CategoryChangeButton(
                      category: Category.birthday,
                    ),
                    CategoryChangeButton(
                      category: Category.daily,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    NewTaskButton(
                      title: 'Cancel',
                      onPressed: () {
                        Navigator.of(context).pop();
                        context.read<TaskCubit>().changeCategory(
                              Category.nocategory,
                            );
                      },
                    ),
                    const Gap(10),
                    ConfirmButton(
                      title: 'Set',
                      onPressed: () {
                        final category =
                            context.read<TaskCubit>().state.category;
                        context
                            .read<TasksCubit>()
                            .changeTask(id: taskId, category: category);
                            onCategoryChanged(category);
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
