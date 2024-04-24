import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list/application/tasks_cubit/tasks_cubit.dart';
import 'package:todo_list/constants/functions.dart';
import 'package:todo_list/domain/task_model/task_model.dart';
import 'package:todo_list/presentation/helpers/app_colors.dart';
import 'package:todo_list/presentation/helpers/app_styles.dart';
import 'package:todo_list/presentation/widgets/calendar_widgets/calendart_page_appbar.dart';
import 'package:todo_list/presentation/widgets/new_task/buttons/create_new_task_button.dart';
import 'package:todo_list/presentation/widgets/tasks_page_widgets/show_tasks/task_item.dart';
import '../../application/task_cubit/task_cubit.dart';

class CalendarPage extends HookWidget {
  const CalendarPage({super.key});
  @override
  Widget build(BuildContext context) {
    var choosenDate = useState(DateTime.now());
    var tasks = context
        .watch<TasksCubit>()
        .state
        .tasks
        .where((element) => isSameDay(element.time, choosenDate.value))
        .toList();

    return Scaffold(
      appBar: emptyAppBar(),
      backgroundColor: AppColors.mainBackgroundColor,
      body: Column(
        children: [
          CalendarAppBar(
            chosenDate: context.watch<TaskCubit>().state.time,
            isExpanded: false,
            onBackward: () {},
            onForward: () {},
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _showCalendar(choosenDate),
                Expanded(
                  child: _showTasks(tasks),
                ),
                const CreateNewTaskButton()
              ],
            ),
          ),
        ],
      ),
    );
  }



  Widget _showCalendar(ValueNotifier<DateTime> choosenDate) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: TableCalendar(
        availableGestures: AvailableGestures.all,
        calendarStyle: const CalendarStyle(
          rangeHighlightColor: AppColors.borderColor,
          markerDecoration: BoxDecoration(
            color: AppColors.borderColor,
          ),
          selectedTextStyle: TextStyle(
            backgroundColor: AppColors.borderColor,
            color: Colors.white,
          ),
        ),
        currentDay: choosenDate.value,
        calendarFormat: CalendarFormat.month,
        focusedDay: choosenDate.value,
        firstDay: DateTime.now().subtract(const Duration(days: 30)),
        lastDay: DateTime.now().add(
          const Duration(days: 3650),
        ),
        onPageChanged: (focusedDay) {},
        onDaySelected: (selectedDay, focusedDay) {
          choosenDate.value = selectedDay;
        },
        availableCalendarFormats: const {
          CalendarFormat.month: 'Month',
          CalendarFormat.week: 'Week'
        },
        daysOfWeekVisible: true,
        headerStyle: const HeaderStyle(
          titleCentered: true,
        ),
      ),
    );
  }

  Padding _showTasks(List<TaskModel> tasks) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: tasks.isEmpty
          ? const Padding(
              padding: EdgeInsets.all(
                8.0,
              ),
              child: Text(
                'No tasks',
                style: AppStyles.titleNameTextStyle,
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: List.generate(
                  tasks.length,
                  (index) {
                    return TaskItem(
                      task: tasks[index],
                    );
                  },
                ),
              ),
            ),
    );
  }
}
