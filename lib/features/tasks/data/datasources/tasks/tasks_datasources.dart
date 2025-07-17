import 'package:firebase_offline/features/tasks/domain/entities/task.dart';

abstract class TasksDatasources {
  Future<bool> getTask(String id);
  Stream<List<Task>> getTasksStream();
  Future<bool> addTask(Task task);
  Future<bool> deleteTask(String id);
  Future<bool> updateTask(Task task);
}
