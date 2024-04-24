import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:todo_list/application/tasks_cubit/tasks_cubit.dart';
import 'package:todo_list/gen/assets.gen.dart';
import 'package:todo_list/presentation/helpers/app_styles.dart';
import 'package:todo_list/presentation/widgets/new_task/buttons/task_button.dart';
import 'package:todo_list/presentation/widgets/new_task/dialogues/time_picker_dialogue/choose_time_button.dart';
import '../../../helpers/app_colors.dart';
import '../../new_task/buttons/confirm_button.dart';

class ShowChangeTimeDialoge extends HookWidget {
  final String id;
  final DateTime date;
  final Function(DateTime datetime) onTimeChanged;
  const ShowChangeTimeDialoge({
    super.key,
    required this.id,
    required this.date,
    required this.onTimeChanged,
  });
  @override
  Widget build(BuildContext context) {
    var currentDate = useState(date);
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
            TimePickerSpinner(
              is24HourMode: false,
              spacing: 20,
              time: currentDate.value,
              normalTextStyle: const TextStyle(
                  color: AppColors.mainBackgroundColor, fontSize: 30),
              highlightedTextStyle:
                  const TextStyle(color: Colors.white, fontSize: 30),
              onTimeChange: (time) {
                currentDate.value = currentDate.value
                    .copyWith(hour: time.hour, minute: time.minute);
                onTimeChanged(
                  date.copyWith(
                    hour: time.hour,
                    minute: time.minute,
                   
                  ),
                );
              },
            ),
            ChooseTimeWidget(
              onTimeChoosen: (int hour) {
                currentDate.value = currentDate.value.copyWith(hour: hour);
              },
              currentHour: currentDate.value.hour,
              currentMinute: currentDate.value.minute,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                NewTaskButton(
                  title: 'Cancel',
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(width: 10),
                ConfirmButton(
                  title: 'Done',
                  onPressed: () {
                    context.read<TasksCubit>().changeTask(
                          id: id,
                          date: currentDate.value,
                        );
                    Navigator.of(context).pop();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ChooseTimeWidget extends StatelessWidget {
  final Function(int hour) onTimeChoosen;
  final int currentHour;
  final int currentMinute;
  const ChooseTimeWidget({
    super.key,
    required this.onTimeChoosen,
    required this.currentHour,
    required this.currentMinute,
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
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.spaceBetween,
      runAlignment: WrapAlignment.spaceBetween,
      spacing: 15,
      children: List.generate(
        timeTitles.length,
        (i) => ChooseTimeButton(
          text: timeTitles[i],
          action: () {
            onTimeChoosen(
              timeCounts[i],
            );
          },
          isSelected: currentHour == timeCounts[i] && currentMinute == 0,
        ),
      ),
    );
  }
}
