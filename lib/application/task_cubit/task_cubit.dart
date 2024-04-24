import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/constants/functions.dart';
import 'package:todo_list/domain/category_model/category_model.dart';
import 'package:todo_list/domain/task_model/task_model.dart';
import 'package:uuid/uuid.dart';

class TaskCubit extends Cubit<TaskModel> {
  TaskCubit() : super(TaskModel.initial());

  void changeName(final String newName) {
    emit(
      state.copyWith(
        taskName: newName,
      ),
    );
  }

  void changeCategory(Category newCategory) {
    emit(
      state.copyWith(
        category: newCategory,
      ),
    );
  }

  void changeSubTaskName(final String newName) {
    emit(state.copyWith(subTaskName: newName));
  }

  void changeDate(final DateTime newDate) {
    emit(
      state.copyWith(
        time: state.time.copyWith(
          year: newDate.year,
          month: newDate.month,
          day: newDate.day,
        ),
      ),
    );
  }

  void changeTime(final DateTime newDate) {
    emit(
      state.copyWith(
        time: state.time.copyWith(
          hour: newDate.hour,
          minute: newDate.minute,
          second: newDate.second,
        ),
      ),
    );
  }

  void createNewTask() {
    emit(TaskModel.initial());
  }

  TaskModel getNewTask() {
    const id = Uuid();

    int notificationId = shortenId(DateTime.now().millisecondsSinceEpoch);

    return state.copyWith(
      id: id.v1(),
      notificationId: notificationId,
    );
  }
}
