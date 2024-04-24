import 'package:flutter/foundation.dart';

import 'package:todo_list/domain/task_model/task_model.dart';

enum TaskStatus { pure, loading, loaded }

class TasksState {
  final List<TaskModel> tasks;
  final TaskStatus status;
  TasksState({
    required this.tasks,
    required this.status,
  });
  TasksState.empty()
      : this(
          status: TaskStatus.pure,
          tasks: [],
        );

  TasksState copyWith({
    List<TaskModel>? tasks,
    TaskStatus? status,
  }) {
    return TasksState(
      tasks: tasks ?? this.tasks,
      status: status ?? this.status,
    );
  }

  @override
  bool operator ==(covariant TasksState other) {
    if (identical(this, other)) return true;

    return listEquals(other.tasks, tasks) && other.status == status;
  }

  @override
  int get hashCode => tasks.hashCode ^ status.hashCode;
}
