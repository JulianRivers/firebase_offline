import 'package:firebase_offline/features/tasks/domain/entities/Task.dart';

class TaskModel extends Task {
  TaskModel({
    required super.id,
    required super.task,
    required super.done,
    required super.createdAt,
    required super.updateAt,
    super.priority = 0,
  });

  factory TaskModel.fromJson(json) {
    return TaskModel(
      id: json['id'],
      task: json['task'],
      done: json['done'],
      priority: json['priority'],
      createdAt: json['createdAt'],
      updateAt: json['updateAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "task": task,
      "done": done,
      "priority": priority,
      "createdAt": createdAt,
      "updateAt": updateAt,
    };
  }

  factory TaskModel.fromEntity(Task task) {
    return TaskModel(
      id: task.id,
      task: task.task,
      done: task.done,
      priority: task.priority,
      createdAt: task.createdAt,
      updateAt: task.updateAt,
    );
  }
}
