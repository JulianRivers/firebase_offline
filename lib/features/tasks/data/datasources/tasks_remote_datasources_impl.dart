import 'package:firebase_offline/core/errors/failures.dart';
import 'package:firebase_offline/features/tasks/data/datasources/tasks_datasources.dart';
import 'package:firebase_offline/features/tasks/data/models/task_model.dart';
import 'package:firebase_offline/features/tasks/domain/entities/task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class TasksRemoteDatasourcesImpl extends TasksDatasources {
  final FirebaseFirestore db;

  TasksRemoteDatasourcesImpl({required super.userId, required this.db});

  @override
  Future<bool> addTask(Task task) async {
    try {
      final newId = db
          .collection('users')
          .doc(userId)
          .collection('tasks')
          .doc()
          .id;

      await db
          .collection('users')
          .doc(userId)
          .collection('tasks')
          .doc(newId)
          .set(TaskModel.fromEntity(task).toJson());
      return true;
    } catch (error) {
      debugPrint(error.toString());
      throw UnknowFailure(error.toString());
    }
  }

  @override
  Future<bool> deleteTask(String id) async {
    try {
      await db.collection('users').doc(userId).delete();
      return true;
    } catch (error) {
      debugPrint(error.toString());
      throw UnknowFailure(error.toString());
    }
  }

  @override
  Future<TaskModel> getTask(String id) async {
    try {
      final docSnapshot = await db
          .collection('users')
          .doc(userId)
          .collection('tasks')
          .doc(id)
          .get();

      if (!docSnapshot.exists) {
        throw UnknowFailure('no hay un tarea con id $id');
      }

      final data = docSnapshot.data();
      if (data == null) throw UnknowFailure('tarea está vacía');

      return TaskModel.fromJson(data);
    } catch (error) {
      debugPrint(error.toString());
      throw UnknowFailure(error.toString());
    }
  }

  @override
  Stream<List<TaskModel>> getTasksStream() {
    try {
      return db
          .collection('users')
          .doc(userId)
          .collection('tasks')
          .snapshots()
          .map((querySnapshot) {
            return querySnapshot.docs.map((docSnapshot) {
              final data = docSnapshot.data();
              return TaskModel.fromJson(data);
            }).toList();
          });
    } catch (error) {
      debugPrint(error.toString());
      throw UnknowFailure(error.toString());
    }
  }

  @override
  Future<bool> updateTask(Task task) async {
    try {
      final taskmodel = TaskModel.fromEntity(task);
      await db
          .collection('users')
          .doc(userId)
          .collection('tasks')
          .doc(task.id)
          .set(taskmodel.toJson(), SetOptions(merge: true));
      return true;
    } catch (error) {
      debugPrint(error.toString());
      throw UnknowFailure(error.toString());
    }
  }
}
