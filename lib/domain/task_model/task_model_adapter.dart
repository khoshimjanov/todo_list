import 'package:hive/hive.dart';
import 'task_model.dart';


@HiveType(typeId: 0)
class TaskModelAdapter extends TypeAdapter<TaskModel> {
  @override
  final int typeId = 0;

  @override
  TaskModel read(BinaryReader reader) {
    return TaskModel(
      isCompleted: reader.read(),
      id: reader.read(),
      taskName: reader.read(),
      time: reader.read(),
      category: reader.read(),
      subTaskName: reader.read(),
      notificationId: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, TaskModel obj) {
    writer.write(obj.id);
    writer.write(obj.taskName);
    writer.write(obj.time);
    writer.write(obj.category);
    writer.write(obj.subTaskName);
    writer.write(obj.notificationId);
  }
}
