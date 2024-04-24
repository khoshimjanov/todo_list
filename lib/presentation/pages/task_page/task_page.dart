import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_list/application/tasks_cubit/tasks_cubit.dart';
import 'package:todo_list/constants/functions.dart';
import 'package:todo_list/domain/task_model/task_model.dart';
import 'package:todo_list/gen/assets.gen.dart';
import 'package:todo_list/presentation/helpers/app_colors.dart';
import 'package:todo_list/presentation/helpers/app_styles.dart';
import 'package:todo_list/presentation/widgets/task_page_widgets/category_change_dialogue.dart';
import 'package:todo_list/presentation/widgets/task_page_widgets/dialogues/show_change_date_dialogue.dart';
import 'package:todo_list/presentation/widgets/task_page_widgets/dialogues/show_change_time_dialogue.dart';
import 'package:todo_list/presentation/widgets/task_page_widgets/task_info_item.dart';
import 'package:todo_list/presentation/widgets/task_page_widgets/task_page_bar.dart';

class TaskPage extends HookWidget {
  final TaskModel taskItem;
  const TaskPage({
    super.key,
    required this.taskItem,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: emptyAppBar(),
      backgroundColor: AppColors.mainBackgroundColor,
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    var task = useState(taskItem);
    var isChanged = useState(false);
    final textController = TextEditingController(text: taskItem.taskName);
    final subTaskController = TextEditingController(text: taskItem.subTaskName);
    return Column(
      children: [
        TaskPageBar(
          onSubmitted: () {
            context.read<TasksCubit>().changeTask(
                  id: taskItem.id,
                  title: textController.text,
                  subtitle: subTaskController.text,
                );
          },
          task: taskItem,
          isChanged: isChanged,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 20,
            ),
            child: Column(
              children: [
                _tasksNameChange(textController, isChanged),
                _subtitleChange(isChanged, subTaskController),
                _dataAndTimeChange(task, context),
                _categoryAndReminder(task, context),
                _notesAndRepitition(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _tasksNameChange(
      TextEditingController textController, ValueNotifier<bool> isChanged) {
    return TextFormField(
      controller: textController,
      style: AppStyles.simpleTextStyle,
      onChanged: (value) {
        isChanged.value = true;
      },
    );
  }

  Widget _dataAndTimeChange(
      ValueNotifier<TaskModel> task, BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TaskInfoItem(
            title: 'Date',
            subtitle: formatDate(
              task.value.time,
            ),
            icon: Assets.icons.calendar,
            onTap: () => showDialog(
              context: context,
              builder: (context) {
                return ShowChangeDateDialogue(
                  onDateChanged: (datetime) {
                    final newTask = task.value.copyWith(
                        time: task.value.time.copyWith(
                      year: datetime.year,
                      month: datetime.month,
                      day: datetime.day,
                    ));
                    task.value = newTask;
                  },
                  id: task.value.id,
                  date: task.value.time,
                );
              },
            ),
          ),
        ),
        Expanded(
          child: TaskInfoItem(
            title: 'Time',
            subtitle: getCurrentTime(task.value.time),
            icon: Assets.icons.time,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return ShowChangeTimeDialoge(
                    id: task.value.id,
                    date: task.value.time,
                    onTimeChanged: (datetime) {
                      final newTask = task.value.copyWith(
                          time: task.value.time.copyWith(
                        hour: datetime.hour,
                        minute: datetime.minute,
                      ));
                      task.value = newTask;
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _subtitleChange(
      ValueNotifier<bool> isChanged, TextEditingController subTaskController) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            onChanged: (value) {
              isChanged.value = true;
            },
            controller: subTaskController,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              hintText: subTaskController.text.isEmpty
                  ? 'Subtask name'
                  : subTaskController.text,
              border: InputBorder.none,
              hintStyle: AppStyles.greybuttonTextStyle,
            ),
            style: AppStyles.greybuttonTextStyle,
          ),
        ),
        const Icon(
          Icons.add_box_outlined,
          color: Colors.grey,
        ),
      ],
    );
  }

  Widget _categoryAndReminder(
      ValueNotifier<TaskModel> task, BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TaskInfoItem(
            title: 'Category',
            subtitle: task.value.category.value,
            icon: Assets.icons.category,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return ShowChangeCategoriesDialogue(
                    taskId: task.value.id,
                    onCategoryChanged: (category) {
                      final newTask = task.value.copyWith(category: category);
                      task.value = newTask;
                    },
                  );
                },
              );
            },
          ),
        ),
        Expanded(
          child: TaskInfoItem(
            title: 'Reminder',
            subtitle: formatDate(task.value.time),
            icon: Assets.icons.reminder,
            onTap: () {},
          ),
        ),
      ],
    );
  }

  Widget _notesAndRepitition() {
    return Row(
      children: [
        Expanded(
          child: TaskInfoItem(
            title: 'Notes',
            subtitle: 'Important',
            icon: Assets.icons.notes,
            onTap: () {},
          ),
        ),
        Expanded(
          child: TaskInfoItem(
            title: 'Repeat Tasks',
            subtitle: 'Monthly',
            icon: Assets.icons.repeat,
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
