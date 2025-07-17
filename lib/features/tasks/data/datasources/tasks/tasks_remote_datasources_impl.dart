import 'package:firebase_offline/features/tasks/data/datasources/tasks/tasks_datasources.dart';
import 'package:firebase_offline/features/tasks/domain/entities/task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TasksRemoteDatasourcesImpl extends TasksDatasources {
  final FirebaseFirestore db;

  TasksRemoteDatasourcesImpl({required this.db});

  @override
  Future<bool> addTask(Task task) {
    // TODO: implement addTask
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteTask(String id) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<bool> getTask(String id) {
    // TODO: implement getTask
    throw UnimplementedError();
  }

  @override
  Stream<List<Task>> getTasksStream() {
    // TODO: implement getTasksStream
    throw UnimplementedError();
  }

  @override
  Future<bool> updateTask(Task task) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
}
