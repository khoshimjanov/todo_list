import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_list/constants/functions.dart';

import 'package:todo_list/domain/task_model/task_model.dart';
import 'package:todo_list/gen/assets.gen.dart';
import 'package:todo_list/presentation/helpers/app_colors.dart';
import 'package:todo_list/presentation/helpers/app_styles.dart';
import 'package:todo_list/presentation/widgets/drawer_widgets/drawer_tasks_appbar.dart';
import 'package:todo_list/presentation/widgets/search_app_bar.dart';
import 'package:todo_list/presentation/widgets/tasks_page_widgets/show_tasks/task_item.dart';

class CategoryTasksPage extends HookWidget {
  final String title;
  final List<TaskModel> tasks;
  const CategoryTasksPage({
    super.key,
    required this.tasks,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    var isSearch = useState(false);
    var searchedText = useState('~');
    var searchedTasks = tasks
        .where((element) => element.taskName.contains(searchedText.value))
        .toList();

    return Scaffold(
      appBar: emptyAppBar(),
      backgroundColor: AppColors.mainBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _appBar(isSearch, searchedText),
          Expanded(
            child: _body(isSearch, searchedTasks),
          ),
        ],
      ),
    );
  }

  Widget _appBar(
      ValueNotifier<bool> isSearch, ValueNotifier<String> searchedText) {
    return isSearch.value == false
        ? CustomAppbar(
            title: title,
            icon: Assets.icons.search,
            onIconPressed: () {
              isSearch.value = true;
            },
          )
        : SearchAppBar(
            onValueChange: (value) {
              searchedText.value = value;
            },
            onSearchPressed: () {
              isSearch.value = true;
            },
            onSearchExit: () {
              isSearch.value = false;
            },
          );
  }

  Widget _body(ValueNotifier<bool> isSearch, List<TaskModel> searchedTasks) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: isSearch.value == true
          ? SingleChildScrollView(
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
            )
          : Column(
              children: tasks.isEmpty
                  ? [
                      const Padding(
                        padding: EdgeInsets.all(
                          8.0,
                        ),
                        child: Text(
                          'No tasks',
                          style: AppStyles.titleNameTextStyle,
                        ),
                      )
                    ]
                  : List.generate(
                      tasks.length,
                      (index) {
                        return TaskItem(
                          task: tasks[index],
                        );
                      },
                    ),
            ),
    );
  }
}
