import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:todo_list/application/task_cubit/task_cubit.dart';

import '../../../../helpers/app_colors.dart';

class TimePickerWidget extends StatelessWidget {
  const TimePickerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return 
    TimePickerSpinner(
      is24HourMode: false,
      spacing: 20,
      normalTextStyle:
          const TextStyle(color: AppColors.mainBackgroundColor, fontSize: 30),
      highlightedTextStyle: const TextStyle(color: Colors.white, fontSize: 30),
      onTimeChange: (time) {
        context.read<TaskCubit>().changeTime(time);
      },
    );
  }
}
