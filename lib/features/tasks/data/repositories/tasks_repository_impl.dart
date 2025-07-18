import 'package:dartz/dartz.dart' hide Task;
import 'package:firebase_offline/core/errors/failures.dart';
import 'package:firebase_offline/features/tasks/data/datasources/tasks/tasks_datasources.dart';
import 'package:firebase_offline/features/tasks/domain/entities/task.dart';
import 'package:firebase_offline/features/tasks/domain/repositories/tasks_repository.dart';

class TasksRepositoryImpl extends TasksRepository {
  final TasksDatasources tasksDatasources;

  TasksRepositoryImpl({required this.tasksDatasources});

  @override
  Future<Either<AppFailure, bool>> addTask(Task task) async {
    try {
      final bool resp = await tasksDatasources.addTask(task);
      return Right(resp);
    } on AppFailure catch (e) {
      //TODO handle custom error
      return Left(UnknowFailure(e.message));
    }
  }

  @override
  Future<Either<AppFailure, bool>> deleteTask(String id) async {
    try {
      final bool resp = await tasksDatasources.deleteTask(id);
      return Right(resp);
    } on AppFailure catch (e) {
      //TODO handle custom error
      return Left(UnknowFailure(e.message));
    }
  }

  @override
  Future<Either<AppFailure, Task>> getTask(String id) async {
    try {
      final Task resp = await tasksDatasources.getTask(id);
      return Right(resp);
    } on AppFailure catch (e) {
      //TODO handle custom error
      return Left(UnknowFailure(e.message));
    }
  }

  @override
  Stream<Either<AppFailure, List<Task>>> getTasksStream() async* {
    try {
      await for (final tasks in tasksDatasources.getTasksStream()) {
        yield Right(tasks);
      }
    } on AppFailure catch (e) {
      //TODO handle custom error
      yield Left(UnknowFailure(e.message));
    }
  }

  @override
  Future<Either<AppFailure, bool>> updateTask(Task task) async {
    try {
      final bool resp = await tasksDatasources.updateTask(task);
      return Right(resp);
    } on AppFailure catch (e) {
      //TODO handle custom error
      return Left(UnknowFailure(e.message));
    }
  }
}
