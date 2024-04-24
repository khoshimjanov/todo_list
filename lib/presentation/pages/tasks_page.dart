import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list/application/tasks_cubit/tasks_cubit.dart';
import 'package:todo_list/application/tasks_cubit/tasks_state.dart';
import 'package:todo_list/constants/functions.dart';
import 'package:todo_list/domain/task_model/task_model.dart';
import 'package:todo_list/gen/assets.gen.dart';
import 'package:todo_list/presentation/helpers/app_colors.dart';
import 'package:todo_list/presentation/helpers/app_styles.dart';
import 'package:todo_list/presentation/widgets/new_task/buttons/create_new_task_button.dart';
import 'package:todo_list/presentation/widgets/search_app_bar.dart';
import 'package:todo_list/presentation/widgets/tasks_page_widgets/show_tasks/show_tasks.dart';
import 'package:todo_list/presentation/widgets/tasks_page_widgets/show_tasks/task_item.dart';
import 'package:todo_list/presentation/widgets/tasks_page_widgets/user_info.dart';

class TasksPage extends HookWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    var isSearch = useState(false);
    var searchedText = useState('~');
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        var tasks = state.tasks;
        var searchedTasks = state.tasks
            .where((element) => element.taskName.contains(searchedText.value))
            .toList();

        return Scaffold(
          appBar: emptyAppBar(),
          backgroundColor: AppColors.mainBackgroundColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _appBar(isSearch, searchedText),
              Expanded(child: _body(isSearch, tasks, searchedTasks)),
              const CreateNewTaskButton(),
            ],
          ),
        );
      },
    );
  }

  Widget _appBar(
      ValueNotifier<bool> isSearch, ValueNotifier<String> searchedText) {
    return isSearch.value == false
        ? UserInfo(
            trailingWidget: CupertinoButton(
              onPressed: () {
                isSearch.value = true;
              },
              child: SvgPicture.asset(Assets.icons.search),
            ),
          )
        : SearchAppBar(
            onValueChange: (value) {
              searchedText.value = value;
            },
            onSearchExit: () {
              isSearch.value = false;
            },
            onSearchPressed: () {
              isSearch.value = true;
            },
          );
  }

  Widget _body(ValueNotifier<bool> isSearch, List<TaskModel> tasks,
      List<TaskModel> searchedTasks) {
    return isSearch.value == false
        ? SingleChildScrollView(
            child: Column(
              children: [
                ShowTasks(tasks: tasks),
              ],
            ),
          )
        : tasks.isEmpty
            ? const Padding(
                padding: EdgeInsets.all(
                  8.0,
                ),
                child: Text(
                  'No tasks',
                  style: AppStyles.titleNameTextStyle,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: List.generate(
                    searchedTasks.length,
                    (index) {
                      return TaskItem(
                        task: searchedTasks[index],
                      );
                    },
                  ),
                ),
              );
  }
}
