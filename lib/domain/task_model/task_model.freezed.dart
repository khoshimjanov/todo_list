// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, non_nullable_equals_parameter
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TaskModel {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  bool get isCompleted => throw _privateConstructorUsedError;
  @HiveField(2)
  String get taskName => throw _privateConstructorUsedError;
  @HiveField(3)
  DateTime get time => throw _privateConstructorUsedError;
  @HiveField(4)
  Category get category => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get subTaskName => throw _privateConstructorUsedError;
  @HiveField(6)
  int get notificationId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskModelCopyWith<TaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskModelCopyWith<$Res> {
  factory $TaskModelCopyWith(TaskModel value, $Res Function(TaskModel) then) =
      _$TaskModelCopyWithImpl<$Res, TaskModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) bool isCompleted,
      @HiveField(2) String taskName,
      @HiveField(3) DateTime time,
      @HiveField(4) Category category,
      @HiveField(5) String? subTaskName,
      @HiveField(6) int notificationId});
}

/// @nodoc
class _$TaskModelCopyWithImpl<$Res, $Val extends TaskModel>
    implements $TaskModelCopyWith<$Res> {
  _$TaskModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isCompleted = null,
    Object? taskName = null,
    Object? time = null,
    Object? category = null,
    Object? subTaskName = freezed,
    Object? notificationId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      taskName: null == taskName
          ? _value.taskName
          : taskName // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      subTaskName: freezed == subTaskName
          ? _value.subTaskName
          : subTaskName // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationId: null == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskModelImplCopyWith<$Res>
    implements $TaskModelCopyWith<$Res> {
  factory _$$TaskModelImplCopyWith(
          _$TaskModelImpl value, $Res Function(_$TaskModelImpl) then) =
      __$$TaskModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) bool isCompleted,
      @HiveField(2) String taskName,
      @HiveField(3) DateTime time,
      @HiveField(4) Category category,
      @HiveField(5) String? subTaskName,
      @HiveField(6) int notificationId});
}

/// @nodoc
class __$$TaskModelImplCopyWithImpl<$Res>
    extends _$TaskModelCopyWithImpl<$Res, _$TaskModelImpl>
    implements _$$TaskModelImplCopyWith<$Res> {
  __$$TaskModelImplCopyWithImpl(
      _$TaskModelImpl _value, $Res Function(_$TaskModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isCompleted = null,
    Object? taskName = null,
    Object? time = null,
    Object? category = null,
    Object? subTaskName = freezed,
    Object? notificationId = null,
  }) {
    return _then(_$TaskModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      taskName: null == taskName
          ? _value.taskName
          : taskName // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      subTaskName: freezed == subTaskName
          ? _value.subTaskName
          : subTaskName // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationId: null == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TaskModelImpl implements _TaskModel {
  _$TaskModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.isCompleted,
      @HiveField(2) required this.taskName,
      @HiveField(3) required this.time,
      @HiveField(4) required this.category,
      @HiveField(5) this.subTaskName,
      @HiveField(6) required this.notificationId});

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final bool isCompleted;
  @override
  @HiveField(2)
  final String taskName;
  @override
  @HiveField(3)
  final DateTime time;
  @override
  @HiveField(4)
  final Category category;
  @override
  @HiveField(5)
  final String? subTaskName;
  @override
  @HiveField(6)
  final int notificationId;

  @override
  String toString() {
    return 'TaskModel(id: $id, isCompleted: $isCompleted, taskName: $taskName, time: $time, category: $category, subTaskName: $subTaskName, notificationId: $notificationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.taskName, taskName) ||
                other.taskName == taskName) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.subTaskName, subTaskName) ||
                other.subTaskName == subTaskName) &&
            (identical(other.notificationId, notificationId) ||
                other.notificationId == notificationId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, isCompleted, taskName, time,
      category, subTaskName, notificationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      __$$TaskModelImplCopyWithImpl<_$TaskModelImpl>(this, _$identity);
}

abstract class _TaskModel implements TaskModel {
  factory _TaskModel(
      {@HiveField(0) required final String id,
      @HiveField(1) required final bool isCompleted,
      @HiveField(2) required final String taskName,
      @HiveField(3) required final DateTime time,
      @HiveField(4) required final Category category,
      @HiveField(5) final String? subTaskName,
      @HiveField(6) required final int notificationId}) = _$TaskModelImpl;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  bool get isCompleted;
  @override
  @HiveField(2)
  String get taskName;
  @override
  @HiveField(3)
  DateTime get time;
  @override
  @HiveField(4)
  Category get category;
  @override
  @HiveField(5)
  String? get subTaskName;
  @override
  @HiveField(6)
  int get notificationId;
  @override
  @JsonKey(ignore: true)
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
