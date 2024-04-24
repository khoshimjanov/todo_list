import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list/application/task_cubit/task_cubit.dart';
import 'package:todo_list/constants/functions.dart';
import 'package:todo_list/gen/assets.gen.dart';
import 'package:todo_list/presentation/widgets/new_task/buttons/set_time_button.dart';
import 'package:todo_list/presentation/widgets/new_task/dialogues/time_picker_dialogue/show_time_picker_dialogue.dart';
import 'package:todo_list/presentation/widgets/new_task/buttons/task_button.dart';

import '../../../helpers/app_colors.dart';
import '../buttons/confirm_button.dart';

class ShowDatePickerDialogue extends StatelessWidget {
  const ShowDatePickerDialogue({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final date = context.watch<TaskCubit>().state.time;
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: AppColors.mainBoxColor,
      contentPadding: const EdgeInsets.all(0.1),
      content: Container(
        decoration: dialogueDecoration(),
        padding: const EdgeInsets.all(
          10,
        ),
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    TableCalendar(
                      calendarStyle: const CalendarStyle(
                        selectedDecoration: BoxDecoration(
                          color: AppColors.borderColor,
                        ),
                        selectedTextStyle: TextStyle(
                          backgroundColor: AppColors.borderColor,
                          color: Colors.white,
                        ),
                      ),
                      currentDay: date,
                      calendarFormat: CalendarFormat.month,
                      focusedDay: date,
                      firstDay: date,
                      lastDay: DateTime.now().add(const Duration(days: 3600)),
                      onDaySelected: (selectedDay, focusedDay) {
                        context.read<TaskCubit>().changeDate(selectedDay);
                      },
                    ),
                    SetTimeButton(
                      title: "Time",
                      data: 'No',
                      icon: Assets.icons.time,
                      action: () {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => const ShowTimePickerDialoge(),
                        );
                      },
                    ),
                    SetTimeButton(
                      title: "Reminder",
                      data: 'No',
                      icon: Assets.icons.reminder,
                      action: () {},
                    ),
                    SetTimeButton(
                      title: "Time",
                      data: 'No Repeat',
                      icon: Assets.icons.repeat,
                      action: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    NewTaskButton(
                      title: 'Cancel',
                      onPressed: () {
                        Navigator.of(context).pop();
                        context.read<TaskCubit>().changeDate(DateTime.now());
                      },
                    ),
                    const SizedBox(width: 10),
                    ConfirmButton(
                      title: 'Done',
                      onPressed: () {
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
