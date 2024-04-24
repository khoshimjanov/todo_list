import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/application/tasks_cubit/tasks_state.dart';
import 'package:todo_list/constants/functions.dart';
import 'package:todo_list/domain/task_model/task_model.dart';
import 'package:todo_list/infrastructure/db_helper.dart';
import 'package:todo_list/infrastructure/notifications/local_notification.dart';

import '../../domain/category_model/category_model.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksState.empty()) {
    getTask();
  }

  void addTask(TaskModel newTask) {
    emit(state.copyWith(status: TaskStatus.loading));

    emit(
      state.copyWith(
        status: TaskStatus.loaded,
        tasks: [...state.tasks, newTask],
      ),
    );

    DbHelper.addTask(newTask);
    if (isAfter(newTask.time)) {
      LocalNotifications.showScheduledNotification(
        newTask.notificationId,
        newTask.taskName,
        'day_1',
        newTask.time,
      );
    }
  }

  void compleTask(String id) {
    emit(
      state.copyWith(
        status: TaskStatus.loading,
      ),
    );

    List<TaskModel> updatedList = state.tasks.map(
      (task) {
        if (task.id == id) {
          return task.copyWith(
            isCompleted: true,
          );
        } else {
          return task;
        }
      },
    ).toList();
    emit(
      state.copyWith(
        status: TaskStatus.loaded,
        tasks: updatedList,
      ),
    );
    DbHelper.completeTask(id);
  }

  void changeTask({
    required String id,
    DateTime? date,
    Category? category,
    String? title,
    String? subtitle,
  }) {
    emit(state.copyWith(status: TaskStatus.loading));

    TaskModel newTask = state.tasks.firstWhere(
      (element) => element.id == id,
    );

    if (date != null) {
      newTask = newTask.copyWith(time: date);
    }
    if (category != null) {
      newTask = newTask.copyWith(category: category);
    }
    if (title != null) {
      newTask = newTask.copyWith(taskName: title);
    }
    if (subtitle != null) {
      newTask = newTask.copyWith(subTaskName: subtitle);
    }
    List<TaskModel> updatedList = state.tasks.map(
      (task) {
        if (task.id == id) {
          return newTask;
        } else {
          return task;
        }
      },
    ).toList();
    emit(state.copyWith(status: TaskStatus.loaded, tasks: updatedList));
    DbHelper.changeTask(newTask);
  }

  void deleteTask(String id, int notificationId) async {
    emit(state.copyWith(status: TaskStatus.loading));

    final List<TaskModel> items = state.tasks
      ..removeWhere(
        (element) => element.id == id,
      );
    DbHelper.removeTask(id);

    LocalNotifications.cancelScheduledNotification(notificationId);

    emit(
      state.copyWith(
        status: TaskStatus.loaded,
        tasks: items,
      ),
    );
  }

  void getTask() {
    final data = DbHelper.getTasks();
    emit(
      state.copyWith(
        status: TaskStatus.loaded,
        tasks: data,
      ),
    );
  }

  int totalTasks() {
    return state.tasks.length;
  }

  int completedTasks() {
    return state.tasks
        .where((item) => item.isCompleted == true)
        .toList()
        .length;
  }

  int uncompletedTasks() {
    return state.tasks
        .where((item) => item.isCompleted == false)
        .toList()
        .length;
  }

  int getCategoryPercentage(Category category) {
    switch (category) {
      case Category.birthday:
        return state.tasks
            .where((element) => element.category == Category.birthday)
            .length;

      case Category.daily:
        return state.tasks
            .where((element) => element.category == Category.daily)
            .length;
      case Category.personal:
        return state.tasks
            .where((element) => element.category == Category.personal)
            .length;
      case Category.wishlist:
        return state.tasks
            .where((element) => element.category == Category.wishlist)
            .length;
      case Category.work:
        return state.tasks
            .where((element) => element.category == Category.work)
            .length;
      default:
        return state.tasks
            .where((element) => element.category == Category.nocategory)
            .length;
    }
  }
}
