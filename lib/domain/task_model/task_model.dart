import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import 'package:todo_list/domain/category_model/category_model.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
@HiveType(typeId: 0)
class TaskModel with _$TaskModel {
  factory TaskModel({
    @HiveField(0) required String id,
    @HiveField(1) required bool isCompleted,
    @HiveField(2) required String taskName,
    @HiveField(3) required DateTime time,
    @HiveField(4) required Category category,
    @HiveField(5) String? subTaskName,
    @HiveField(6) required int notificationId,
  }) = _TaskModel;
  
  factory TaskModel.initial() {
    const uuid = Uuid();
    return TaskModel(
      notificationId: DateTime.now().millisecondsSinceEpoch,
      time: DateTime.now(),
      isCompleted: false,
      id: uuid.v1(),
      taskName: 'New task',
      category: Category.nocategory,
    );
  }
  factory TaskModel.demo() {
    const uuid = Uuid();
    return TaskModel(
      notificationId: DateTime.now().millisecondsSinceEpoch,
      isCompleted: false,
      time: DateTime.now(),
      id: uuid.v1(),
      taskName: 'Hi',
      category: Category.nocategory,
    );
  }
}


// TaskModel(
//       id: fields[0] as String,
//       isCompleted: fields[1] as bool,
//       taskName: fields[2] as String,
//       time: fields[3] as DateTime,
//       category: fields[4] as Category,
//       subTaskName: fields[5] as String?,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, TaskModel obj) {
//     writer
//       ..writeByte(6)
//       ..writeByte(0)
//       ..write(obj.id)
//       ..writeByte(1)
//       ..write(obj.isCompleted)
//       ..writeByte(2)
//       ..write(obj.taskName)
//       ..writeByte(3)
//       ..write(obj.time)
//       ..writeByte(4)
//       ..write(obj.category)
//       ..writeByte(5)
//       ..write(obj.subTaskName);
//   }