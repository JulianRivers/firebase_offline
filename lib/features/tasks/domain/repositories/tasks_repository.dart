import 'package:dartz/dartz.dart';
import 'package:firebase_offline/core/errors/failures.dart';


abstract class TasksRepository {
  Future<Either<AppFailure, bool>> getTask(String id);
  Stream<Either<AppFailure, List<Task>>> getTasksStream();
  Future<Either<AppFailure, bool>> addTask(Task task);
  Future<Either<AppFailure, bool>> deleteTask(String id);
  Future<Either<AppFailure, bool>> updateTask(Task task);
}
