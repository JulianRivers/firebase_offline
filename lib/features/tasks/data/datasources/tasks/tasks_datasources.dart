import 'package:firebase_offline/features/tasks/data/models/task_model.dart';
import 'package:firebase_offline/features/tasks/domain/entities/task.dart';

abstract class TasksDatasources {
  final String userId;

  TasksDatasources({required this.userId});

  Future<TaskModel> getTask(String id);
  Stream<List<TaskModel>> getTasksStream();
  Future<bool> addTask(Task task);
  Future<bool> deleteTask(String id);
  Future<bool> updateTask(Task task);
}
