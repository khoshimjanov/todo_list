import 'package:hive_flutter/adapters.dart';
import 'package:todo_list/domain/task_model/task_model.dart';

import '../domain/category_model/category_model.dart';

class DbHelper {
  static const _boxName = 'userBox';
  static const _userName = 'username';

  static Future<void> initialize() async {
    try {
      await Hive.initFlutter();
      Hive.registerAdapter(TaskModelAdapter());
      Hive.registerAdapter(CategoryAdapter());
      await Hive.openBox(_boxName);
    } catch (e) {
      print(
        "error in getting data:$e",
      );
    }
  }

  static Future<void> changeUserName(
    String newUserName,
  ) async {
    final box = await Hive.openBox(
      _boxName,
    );
    await box.put(_userName, newUserName);
  }

  static const String boxName = 'tasksBox';

  static Future<String?> getUserName() async {
    final box = await Hive.openBox(
      _boxName,
    );
    return box.get(_userName);
  }

  static Future<void> openBox() async {
    await Hive.openBox<TaskModel>(boxName);
  }

  static void addTask(TaskModel task) {
    final taskBox = Hive.box<TaskModel>(boxName);
    taskBox.put(task.id, task);
  }

  static void removeTask(String taskId) {
    final taskBox = Hive.box<TaskModel>(boxName);
    taskBox.delete(taskId);
  }

  static void removHiveBox() {
    final taskBox = Hive.box<TaskModel>(boxName);
    taskBox.deleteFromDisk();
  }

  static List<TaskModel> getTasks() {
    Box<TaskModel> taskBox = Hive.box<TaskModel>(boxName);
    List<TaskModel> allTasks = taskBox.values.toList();
    return allTasks;
  }

  static void completeTask(
    String id,
  ) {
    final taskBox = Hive.box<TaskModel>(boxName);
    TaskModel? task = taskBox.get(id);

    if (task != null) {
      final taskToUpdate = task.copyWith(isCompleted: true);

      taskBox.put(id, taskToUpdate);

      print(
        'Task with ID $id updated: ${taskToUpdate.taskName}, isCompleted: ${taskToUpdate.isCompleted}',
      );
    } else {
      print(
        'Task with ID $id not found',
      );
    }
  }

  static void changeTask(TaskModel newTask) {
    final taskBox = Hive.box<TaskModel>(
      boxName,
    );
    // TaskModel? task = taskBox.get(id);

    // if (task != null) {
    TaskModel taskToUpdate = newTask;

    taskBox.put(taskToUpdate.id, taskToUpdate);

    // print(
    // 'Task with ID $id updated: ${taskToUpdate.taskName}, isCompleted: ${taskToUpdate.isCompleted}',
    // );//
    // } else {
    //   print(
    //     'Task with ID $id not found',
    //   );
    // }
  }
}
