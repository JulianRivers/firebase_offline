import 'package:dartz/dartz.dart';
import 'package:firebase_offline/core/errors/failures.dart';
import 'package:firebase_offline/features/tasks/domain/repositories/tasks_repository.dart';

class TasksRepositoryImpl extends TasksRepository {

  
  @override
  Future<Either<AppFailure, bool>> addTask(Task task) {
    // TODO: implement addTask
    throw UnimplementedError();
  }

  @override
  Future<Either<AppFailure, bool>> deleteTask(String id) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<Either<AppFailure, bool>> getTask(String id) {
    // TODO: implement getTask
    throw UnimplementedError();
  }

  @override
  Stream<Either<AppFailure, List<Task>>> getTasksStream() {
    // TODO: implement getTasksStream
    throw UnimplementedError();
  }

  @override
  Future<Either<AppFailure, bool>> updateTask(Task task) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
}
