import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list/application/task_cubit/task_cubit.dart';
import 'package:todo_list/gen/assets.gen.dart';
import 'package:todo_list/presentation/helpers/app_styles.dart';
import 'package:todo_list/presentation/widgets/new_task/buttons/task_button.dart';
import 'package:todo_list/presentation/widgets/new_task/dialogues/time_picker_dialogue/choose_time_widget.dart';
import 'package:todo_list/presentation/widgets/new_task/dialogues/time_picker_dialogue/time_picker_widget.dart';

import '../../../../helpers/app_colors.dart';
import '../../buttons/confirm_button.dart';

class ShowTimePickerDialoge extends StatelessWidget {
  const ShowTimePickerDialoge({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: AppColors.mainBoxColor,
      contentPadding: const EdgeInsets.all(0.1),
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
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text(
                  'Set Time',
                  style: AppStyles.titleNameTextStyle,
                ),
                SvgPicture.asset(
                  Assets.icons.time,
                  width: 20,
                )
              ]),
              const TimePickerWidget(),
              const ChooseTimeWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  NewTaskButton(
                    title: 'Cancel',
                    onPressed: () {
                      Navigator.of(context).pop();
                      context.read<TaskCubit>().changeDate(
                            DateTime.now(),
                          );
                    },
                  ),
                  const SizedBox(width: 10),
                  ConfirmButton(
                    title: 'Done',
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              )
            ]),
      ),
    );
  }
}
