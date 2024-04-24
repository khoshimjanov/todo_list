import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo_list/application/task_cubit/task_cubit.dart';

import 'package:todo_list/presentation/widgets/new_task/dialogues/time_picker_dialogue/choose_time_button.dart';


class ChooseTimeWidget extends StatelessWidget {
  const ChooseTimeWidget({
    super.key,
  });
  final List<String> timeTitles = const [
    'No time',
    '02:00 AM',
    '04:00 AM',
    '06:00 AM',
    '08:00 AM',
    '10:00 AM',
    '02:00 PM',
    '04:00 PM',
    '06:00 PM',
    '08:00 PM',
    '10:00 PM',
    '11:00 PM',
  ];
  final List<int> timeCounts = const [
    0,
    2,
    4,
    6,
    8,
    10,
    14,
    16,
    18,
    20,
    22,
    23
  ];
  @override
  Widget build(BuildContext context) {
    final time = context.watch<TaskCubit>().state.time;

    return Wrap(
        // alignment: WrapAlignment.spaceBetween,
        // crossAxisAlignment: WrapCrossAlignment.start,
        // runSpacing: 5,
        // runAligment: WrapAlignment.end,
        // direction: //,
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.spaceBetween,
        // crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.spaceBetween,
        spacing: 15,
        children: List.generate(
            timeTitles.length,
            (i) => ChooseTimeButton(
                text: timeTitles[i],
                action: () => context.read<TaskCubit>().changeTime(
                    DateTime.now()
                        .copyWith(hour: timeCounts[i], minute: 0, second: 0)),
                isSelected: time.hour == timeCounts[i] && time.minute == 0)));
  }
}
