import 'package:firebase_offline/features/tasks/domain/entities/task.dart';

class TaskModel extends Task {
  TaskModel({
    required super.id,
    required super.task,
    required super.done,
    required super.createdAt,
    required super.updatedAt,
    super.priority = 0,
  });

  factory TaskModel.fromJson(json) {
    return TaskModel(
      id: json['id'],
      task: json['task'],
      done: json['done'],
      priority: json['priority'],
      createdAt: json['createdAt'].toIso8601String(),
      updatedAt: json['updatedAt'].toIso8601String(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "task": task,
      "done": done,
      "priority": priority,
      "createdAt": createdAt,
      "updateAt": updatedAt,
    };
  }

  factory TaskModel.fromEntity(Task task) {
    return TaskModel(
      id: task.id,
      task: task.task,
      done: task.done,
      priority: task.priority,
      createdAt: task.createdAt,
      updatedAt: task.updatedAt,
    );
  }

  TaskModel copyWith({
    String? id,
    String? task,
    bool? done,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? priority,
  }) {
    return TaskModel(
      id: id ?? this.id,
      task: task ?? this.task,
      done: done ?? this.done,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      priority: priority ?? this.priority,
    );
  }
}
